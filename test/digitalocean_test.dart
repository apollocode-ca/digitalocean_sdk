import 'package:digitalocean/src/digitalocean.dart';
import 'package:digitalocean/src/models/git_infos_model.dart';
import 'package:digitalocean/src/models/specs/app_spec.dart';
import 'package:digitalocean/src/models/specs/domain_spec.dart';
import 'package:digitalocean/src/models/specs/service_spec.dart';
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

    test('Create app', () async {
      var app = await digitalOcean.apps
          .create(AppSpec(name: 'test', region: 'tor', services: [
        ServiceSpec(
            name: 'test',
            instanceSizeSlug: 'basic-xxs',
            instanceCount: 1,
            git: GitInfos(
                branch: 'master',
                repoCloneUrl:
                    'https://github.com/apollocode-ca/pharmaciens_remplacants.git'),
            httpPort: 8080)
      ], domains: [
        DomainSpec(domain: 'test.apollocode.ca', minimumTlsVersion: '1.3')
      ]));
      expect(app.id, isNotEmpty);
    });
  });
}
