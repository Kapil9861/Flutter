import 'package:http/http.dart' as http;

class SourceDataSource {
  Future deletesSource(int sourceId) async {
    var response = await http
        .post(Uri.parse("http://10.0.2.2:8000/api/deleteSource/$sourceId"));
    return response.body;
  }
}
