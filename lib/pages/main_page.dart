import 'package:ffdemo/imports.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: title.wText,
      ),
      body: Column(
        children: [
          ChangeNotifierProvider(
            create: (_) => StyleProvider(),
            child: const DemoPage(),
          ),
        ],
      ),
    );
  }
}
