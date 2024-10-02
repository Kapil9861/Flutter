class KycException extends Error {
  final String message;

  KycException({required this.message});

  @override
  String toString() {
    return "Exception : $message";
  }
}
