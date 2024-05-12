abstract class Failure {
  const Failure([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failure{
  final String? message;

  const ServerFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is ServerFailure &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}

class PermissionFailure extends Failure{
  final String? message;

  const PermissionFailure(this.message);

  @override
  bool operator ==(Object other) =>
      other is ServerFailure &&
          message == other.message;

  @override
  int get hashCode => message.hashCode;
}