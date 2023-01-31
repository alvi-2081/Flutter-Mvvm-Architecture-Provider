class AppException implements Exception {
  final _message;
  final _prefix;
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix $_message';
  }
}

//  run during timeout
class FetchDataException extends AppException {
  FetchDataException([String? message])
      : super(message, 'Error During Communication');
}

//
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'Invalid Request');
}

//     not user available
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message])
      : super(message, 'Unauthorized Request');
}

class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'Invalid Input');
}
