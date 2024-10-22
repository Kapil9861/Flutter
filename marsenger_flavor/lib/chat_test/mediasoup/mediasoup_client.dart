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
      // Abort next steps.
    }
    final Map transportInfo = await signaling.request('createTransport', {
      'forceTcp': false,
      'producing': true,
      'consuming': false,
      'sctpCapabilities': device.sctpCapabilities.toMap(),
    });

//callback for the producers
    void producerCallback(Producer producer) {}

    final sendTransport = device.createSendTransportFromMap(transportInfo,
        producerCallback: producerCallback);

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

    Map<String, dynamic> mediaConstraints = <String, dynamic>{
      'audio': false,
      'video': {
        'mandatory': {
          'minWidth': '1000',
          'minHeight': '600',
          'minFrameRate': '30',
        }
      }
    };

    final MediaStream stream =
        await navigator.mediaDevices.getUserMedia(mediaConstraints);
    final MediaStreamTrack track = stream.getVideoTracks().first;
    sendTransport.produce(
      source: 'webcam',
      track: track,
      stream: stream,
    );
  }

  MediasoupClient() {
    routerRtpCapabilities();
  }
}
