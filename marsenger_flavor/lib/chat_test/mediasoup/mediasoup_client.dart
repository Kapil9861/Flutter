import 'package:flutter/foundation.dart';
import 'package:marsenger_flavor/chat_test/mediasoup/marsenger_signaling.dart';
import 'package:mediasoup_client_flutter/mediasoup_client_flutter.dart';

class MediasoupClient {
  final device = Device();
  final signaling = MarsengerSignaling();

  void routerRtpCapabilities() async {
    signaling.connect();

    final Map<String, dynamic> routerCapabilities =
        await signaling.request('getRouterCapabilities');
    final rtpCapabilities = RtpCapabilities.fromMap(routerCapabilities);

    await device.load(routerRtpCapabilities: rtpCapabilities);

    if (!device.canProduce(RTCRtpMediaType.RTCRtpMediaTypeVideo)) {
      if (kDebugMode) {
        print('cannot produce video');
      }
    }

    // Setting up transport for producing media
    final Map producerTransportInfo =
        await signaling.request('createTransport', {
      'forceTcp': false,
      'producing': true,
      'consuming': false,
      'sctpCapabilities': device.sctpCapabilities.toMap(),
    });

    final sendTransport = device.createSendTransportFromMap(
        producerTransportInfo,
        producerCallback: (Producer producer) {});

    sendTransport.on('connect', (Map data) {
      signaling
          .request('transport-connect', {
            'transportId': sendTransport.id,
          })
          .then(data['callback'])
          .catchError(data['errback']);
    });
    sendTransport.on('produce', (Map data) async {
      try {
        Map response = await signaling.request(
          'produce',
          {
            'transportId': sendTransport.id,
            'kind': data['kind'],
            'rtpParameters': data['rtpParameters'].toMap(),
            if (data['addData'] != null)
              'appData': Map<String, dynamic>.from(data['appData'])
          },
        );
        data['callback'](response['id']);
      } catch (error) {
        data['errback'](error);
      }
    });

    // Now setting up the consumer
    final Map consumerTransportInfo =
        await signaling.request('createTransport', {
      'forceTcp': false,
      'producing': false,
      'consuming': true,
      'sctpCapabilities': device.sctpCapabilities.toMap(),
    });

    final recvTransport =
        device.createRecvTransportFromMap(consumerTransportInfo);

    recvTransport.on('connect', (Map data) {
      signaling
          .request('transport-connect', {
            'transportId': recvTransport.id,
          })
          .then(data['callback'])
          .catchError(data['errback']);
    });

    // Request consumer data from the server
    final Map<String, dynamic> consumerData =
        await signaling.request('consumeStreams', {
      'rtpCapabilities': device.rtpCapabilities.toMap(),
    });

    // Call recvTransport.consume without awaiting since it's void
    recvTransport.consume(
      id: consumerData['id'],
      producerId: consumerData['producerId'],
      kind: consumerData['kind'],
      rtpParameters: RtpParameters.fromMap(consumerData['rtpParameters']),
      peerId: consumerData['peerId'],
    );

    // Assuming you can access the consumer or its track through events
    recvTransport.on('producedconsumer', (Consumer consumer) {
      MediaStreamTrack videoTrack = consumer.track;

      // Handle video track (e.g., pass it to a video player)

      // Listen for track end event
      consumer.on('trackended', () {
        if (kDebugMode) {
          print('Consumer track ended');
        }
      });
    });
  }

  MediasoupClient() {
    routerRtpCapabilities();
  }
}
