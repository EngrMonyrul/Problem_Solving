abstract class Display<T extends num> {
  void displayValue({required T value, required String message});
}

class DisplayImpl<T extends num> extends Display<T> {
  @override
  void displayValue({required T value, required String message}) {
    print(message + value.toString());
  }
}
