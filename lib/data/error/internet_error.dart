class InternetError extends Error {
  @override
  String toString() {
    return 'No internet connection!';
  }
}
