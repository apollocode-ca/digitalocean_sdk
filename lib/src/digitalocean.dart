import 'package:digitalocean/src/config.dart';
import 'package:digitalocean/src/services/apps_service.dart';

class DigitalOcean {
  final String oAuthToken;

  late final AppsService apps;

  DigitalOcean({required this.oAuthToken}) {
    Config.init(oAuthToken);
    apps =
        AppsService(endpoint: '/v2.0/cards/', baseUrl: Config.instance.baseUrl);
  }
}
