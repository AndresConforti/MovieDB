abstract class ApiInterface<T> {
  Future<T> fetch(String url);
}
