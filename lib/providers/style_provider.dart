import 'package:ffdemo/imports.dart';

class StyleProvider extends ChangeNotifier {
  double standardPadding = 16;
  Color brandColor = Colors.blue;
  Color selectedColor = Colors.green;

  TextStyle? titleStyle = const TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
  );

  TextStyle? subtitleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  TextStyle? textStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.black54,
  );

  void setStandardPadding(double value) {
    standardPadding = value;
    notifyListeners();
  }

  void setTitleStyle(TextStyle value) {
    titleStyle = value;
    notifyListeners();
  }

  void setSubtitleStyle(TextStyle value) {
    subtitleStyle = value;
    notifyListeners();
  }

  void setTextStyle(TextStyle value) {
    textStyle = value;
    notifyListeners();
  }
}

// ------------------------------

abstract class StyledWidget extends StatefulWidget {
  const StyledWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<StyledWidget> createState() => _StyledWidgetState();

  Widget build(BuildContext context, StyleProvider style);
}

class _StyledWidgetState extends State<StyledWidget> {
  @override
  Widget build(BuildContext context) {
    return Consumer<StyleProvider>(
      builder: (context, style, child) => child ?? widget.build(context, style),
    );
  }
}

// ------------------------------

class FFMenu extends StyledWidget {
  const FFMenu({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StyleProvider style,
  ) {
    return Container();
  }
}

// ------------------------------

class FFStandardPadding extends StyledWidget {
  final Widget child;

  const FFStandardPadding({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StyleProvider style,
  ) {
    return Padding(
      padding: EdgeInsets.all(style.standardPadding),
      child: child,
    );
  }
}

// ------------------------------

class FFTitle extends StyledWidget {
  final String text;

  const FFTitle({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StyleProvider style,
  ) {
    return Text(
      text,
      style: style.titleStyle,
    );
  }
}

// ------------------------------

class FFSubtitle extends StyledWidget {
  final String text;

  const FFSubtitle({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StyleProvider style,
  ) {
    return Text(
      text,
      style: style.subtitleStyle,
    );
  }
}

// ------------------------------

class FFText extends StyledWidget {
  final String text;

  const FFText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StyleProvider style,
  ) {
    return Text(
      text,
      style: style.textStyle,
    );
  }
}

// ------------------------------

class FFColumn extends StyledWidget {
  final List<Widget> children;

  const FFColumn({
    required this.children,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StyleProvider style,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: List.generate(
        children.length * 2 - 1,
        (index) => index % 2 == 0
            ? children[index ~/ 2]
            : SizedBox(
                height: style.standardPadding,
              ),
      ),
    );
  }
}
