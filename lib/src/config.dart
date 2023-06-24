class Config {
  static Config? _instance;

  static Config get instance {
    if (_instance == null) {
      throw Exception("Config is not initialized");
    }
    return _instance!;
  }

  static void init(
    String oAuthToken,
  ) {
    _instance = Config._internal(oAuthToken);
  }

  Config._internal(this.oAuthToken);

  final String oAuthToken;

  final String baseUrl = 'https://api.digitalocean.com';
}
