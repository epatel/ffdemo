import 'package:provider/provider.dart';
import 'package:ffdemo/imports.dart';

class Coordinator extends ChangeNotifier {
  late void Function(BuildContext context, CoordinatorEvent event) stateHandler;

  final AppState state = AppState();

  void incrementCounter() {
    state.counter++;
    notifyListeners();
  }

  Coordinator() {
    stateHandler = startState;
  }

  CoordinatorEvent eventFilter(CoordinatorEvent event) {
    print('${DateTime.now()}: $event');

    if (event is ButtonEvent) {
      if (event.id != 'main.plus') {
        return NullEvent();
      }
    }
    return event;
  }

  void handleEvent(BuildContext context, CoordinatorEvent event) =>
      stateHandler(context, eventFilter(event));

  void startState(BuildContext context, CoordinatorEvent event) {
    if (event is ButtonEvent) {
      if (event.id == 'main.plus') {
        incrementCounter();
      }
    }
  }
}

extension CoordinatorExtensions on BuildContext {
  Coordinator get coordinator => get<Coordinator>();
  void handle(CoordinatorEvent event) => coordinator.handleEvent(this, event);

  /// Get a provider, ie AppState
  /// ```dart
  /// final AppState state = context.get<Coordinator>().state;
  /// ```
  T get<T>() => read<T>();

  /// Subscribe to a value, ie AppState
  /// ```dart
  /// final AppState state = context.subscribe((Coordinator coordinator) => coordinator.state);
  /// ```
  R subscribe<T, R>(R Function(T value) selector) => select(selector);
}
