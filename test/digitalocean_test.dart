import 'package:digitalocean/src/digitalocean.dart';
import 'package:test/test.dart';

void main() {
  group('A group of tests', () {
    DigitalOcean(
        oAuthToken:
            'fc1ca73c716cd6227a31f6f9c459dcb4afca447b02cb511f820bf483b38f468d231d6b425fd2d6de28d3a19f42f27e88547bebd4f38561bff61f6a51f0de8bcd');

    test('First Test', () {
      // expect(awesome.isAwesome, isTrue);
    });
  });
}
