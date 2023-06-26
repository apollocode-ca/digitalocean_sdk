import 'package:digitalocean/src/digitalocean.dart';
import 'package:test/test.dart';

void main() {
  group('[Apps]', () {
    var digitalOcean = DigitalOcean(
        oAuthToken:
            'dop_v1_328721b10423ca61c16f39d267b7c209eed034d7a3b1b6f7f12cef66141fadf3');

    test('List Apps', () async {
      var apps = await digitalOcean.apps.list();
      expect(apps.isNotEmpty, isTrue);
    });
  });
}
