class AppException implements Exception {
  final dynamic _message;
  final dynamic _prefix;

  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return "$_prefix $_message";
  }
}

// Communication error
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, "Error during communication.");
}

// Bad request
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, "Invalid request.");
}

// Unauthorized error
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, "Unauthorized request.");
}

// Invalid error
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, "Invalid input.");
}
