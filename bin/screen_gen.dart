import '../bin/src/controller/controller_gen.dart';

void main(List<String> args) {
  assetsGen(args);
}

void assetsGen(List<String> args) {
  if (args.isEmpty) {
    print('Usage: dart screen_gen.dart <WidgetName> [ControllerName]');
    return;
  }
  final widgetName = args[0];
  final controllerName = args.length > 1 ? args[1] : null;
  generateWidget(widgetName, controllerName);
}
