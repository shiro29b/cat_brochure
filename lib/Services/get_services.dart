// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

const String apiKey =
    'live_DAormuZAv2yXelNgeYajUqPOQaIrXJJKbm4up7r54udd0Hf1BDeSUDyJWGsHrBou';

class GetServices {
  Future<dynamic> getCatsData() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://api.thecatapi.com/v1/images/search?limit=50&api_key=live_DAormuZAv2yXelNgeYajUqPOQaIrXJJKbm4up7r54udd0Hf1BDeSUDyJWGsHrBou&has_breeds=1&size=small'));

    http.StreamedResponse response = await request.send();
    var res = await http.Response.fromStream(response);
    // print(res.statusCode);
    // print(res.body);
    // final result = jsonDecode(res.body);
    // print(result);

    if (res.statusCode == 200) {
      return res;
      // print(await response.stream.bytesToString());
    } else {
      // print(res.body);
    }
  }
}
