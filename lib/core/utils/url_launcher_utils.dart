import 'package:url_launcher/url_launcher.dart';

Future<void> launchURL(String? url) async {
  if (url == null || url.isEmpty) {
    throw Exception("URL can't be null or empty!");
  }

  final uri = Uri.tryParse(url);

  if (uri == null) {
    throw Exception("Invalid url: $uri");
  }

  if (!await launchUrl(uri)) {
    throw Exception("Not found any supported web browser!");
  }
}
