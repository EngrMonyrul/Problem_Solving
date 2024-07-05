abstract class Display<T> {
  void displayValue({required T value, required String message});
}

class DisplayImpl<T> extends Display<T> {
  @override
  void displayValue({required T value, required String message}) {
    print(message + value.toString());
  }
}
