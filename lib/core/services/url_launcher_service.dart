import 'package:url_launcher/url_launcher.dart';

class UrlLauncherService {
  Future<void> call(String phone) async {
    final Uri uri = Uri.parse("tel:$phone");

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> website(String url) async {
    final Uri uri = Uri.parse(url);

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }

  Future<void> directions(
    double latitude,
    double longitude,
  ) async {
    final Uri uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );

    await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );
  }
}