abstract class CoordinatorEvent {
  final Map<String, dynamic> payload = const {};

  const CoordinatorEvent();
}

class NullEvent extends CoordinatorEvent {}

class ButtonEvent extends CoordinatorEvent {
  const ButtonEvent({required this.id});

  final String id;

  @override
  String toString() => 'ButtonEvent(id: $id)';
}
