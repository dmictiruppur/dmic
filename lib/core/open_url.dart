import 'package:url_launcher/url_launcher.dart';
class OpenUrl{
  Future launchURL(String Urls) async {
    String url = Urls.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
    'Access-Control_Allow_Origin': '*'
  };
}