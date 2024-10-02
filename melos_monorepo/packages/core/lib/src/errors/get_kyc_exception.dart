class GetKYCInfoError extends Error {
  GetKYCInfoError(this.message);

  final String message;

  @override
  String toString() {
    return "Get Kyc Error (null value): $message";
  }
}
