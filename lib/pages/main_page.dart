import 'package:ffdemo/imports.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: widget.title.wText,
      ),
      body: [
        'You have pushed the button this many times:'.wLabelLarge(context),
        const CounterWidget(),
      ].columnSpreadEvenly.center,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.handle(const ButtonEvent(id: 'main.plus')),
        child: Icons.add.icon,
      ),
    );
  }
}
