import 'package:dartz/dartz.dart';

import '../errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultStream<T> = Stream<Either<Failure, T>>;

typedef ResultMap = Map<String, dynamic>;

typedef ResultMapList = List<Map<String, dynamic>>;

typedef ValueCallback<P> = void Function(P value);
