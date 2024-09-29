import 'package:equatable/equatable.dart';
import '../utils/enums/error_code.dart';
import 'exceptions.dart';

abstract class Failure extends Equatable {
  final String message;
  final ErrorCode code;

  Failure({
    required this.message,
    this.code = ErrorCode.unknown,
  }) : assert(
          code.runtimeType == ErrorCode,
          'Code cannot be type of ${code.runtimeType}',
        );

  @override
  List<Object> get props => [
        message,
        code,
      ];
}

class CacheFailure extends Failure {
  CacheFailure({
    super.message = 'Something went wrong on the device',
  });

  CacheFailure.fromException(CacheException exception)
      : super(
          message: exception.message,
        );
}

class ServerFailure extends Failure {
  ServerFailure({
    super.message = 'Something went wrong on the server',
  });

  ServerFailure.fromException(ServerException exception, [ErrorCode? code])
      : super(
          message: exception.message,
          code: code ?? ErrorCode.unknown,
        );
}
