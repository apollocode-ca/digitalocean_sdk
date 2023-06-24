class ClientHttpService {
  final String baseUrl;
  final String endpoint;
  final String? oAuthToken;
  ClientHttpService(
      {required this.baseUrl, required this.endpoint, this.oAuthToken});
}
