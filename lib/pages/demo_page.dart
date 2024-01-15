import 'package:ffdemo/imports.dart';

class DemoPage extends StyledWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(
    BuildContext context,
    StyleProvider style,
  ) {
    return Column(
      children: [
        FFStandardPadding(
          child: FFColumn(
            children: [
              const FFTitle(text: 'Hello Title').yellow,
              const FFSubtitle(text: 'Hello Subtitle').blue,
              const FFText(text: 'Hello Text text text text').yellow,
            ],
          ).lightGreen,
        ).red,
        Slider(
          min: 4,
          max: 24,
          value: style.standardPadding,
          onChanged: (value) {
            style.setStandardPadding(value);
          },
        ).width50,
        style.standardPadding.toStringAsFixed(2).wText,
      ],
    ).center;
  }
}
