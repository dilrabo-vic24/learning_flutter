class ServerException {
  final String errorMessage;
  final int statusCode;

  ServerException({required this.errorMessage, required this.statusCode});
}
