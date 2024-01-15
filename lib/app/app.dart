import 'package:ffdemo/imports.dart';

import 'router.dart';
import 'theme.dart';

export 'coordinator.dart';
export 'coordinator_events.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Coordinator>.value(
      value: Coordinator(),
      child: MaterialApp.router(
        routerConfig: router,
        title: 'App',
        theme: lightTheme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
