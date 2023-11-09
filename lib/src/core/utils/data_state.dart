enum DataStateStates {
  WAITING,
  SUCCESS,
  ERROR,
  EMPTY,
}

class DataState<T> {
  late final T? data;
  final DataStateStates state;
  final String? error;

  DataState({
    required this.state,
    this.data,
    this.error,
  });
}
