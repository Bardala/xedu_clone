sealed class Result<T> {
  const Result();

  factory Result.ok(T data) => Success(data);
  factory Result.error(String message) => Failure(message);

  bool get isSuccess => this is Success<T>;
  bool get isFailure => this is Failure<T>;

  T? get data => this is Success<T> ? (this as Success<T>).data : null;
  String? get error =>
      this is Failure<T> ? (this as Failure<T>).errorMsg : null;
}

final class Success<T> extends Result<T> {
  @override
  final T data;
  const Success(this.data);
}

final class Failure<T> extends Result<T> {
  final String errorMsg;
  const Failure(this.errorMsg);
}
