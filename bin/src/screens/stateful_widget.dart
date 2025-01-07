String generateStatefulWidget(
  String widgetName,
  String controllerFileName,
  String controllerClassName,
) {
  final pascalCaseName = widgetName[0].toUpperCase() + widgetName.substring(1);
  return '''
  
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/$controllerFileName.dart';

class $pascalCaseName extends StatefulWidget {
  const $pascalCaseName({super.key});

  @override
  State<$pascalCaseName> createState() => _${pascalCaseName}State();
}

class _${pascalCaseName}State extends State<$pascalCaseName> {
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<$controllerClassName>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('$pascalCaseName'),
      ),
      body: Center(
        child: Text('Hello, $pascalCaseName!'),
      ),
    );
  }
}
''';
}
