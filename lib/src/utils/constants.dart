// ignore_for_file: constant_identifier_names

const String START_MESSAGE = '''
┌───────────────────────────────────────────────────────────────────┐
│ Package:  │ ind_utils                                             │
└───────────────────────────────────────────────────────────────────┘''';
String controllerMessage(String name) => '''
┌────────────────────────────────────────────────────────────────────────
│  ✅  $name Controller Created Successfully\x1B[0m                  
└────────────────────────────────────────────────────────────────────────''';
String screenMessage(String name) => '''
┌────────────────────────────────────────────────────────────────────────
│  ✅  $name Screen Created Successfully\x1B[0m                     
└─────────────────────────────────────────────────────────────────────────''';
String directoryMessage(String name) => '''
┌─────────────────────────────────────────────────────────────────────────
│  ✅  $name Directory Created Successfully\x1B[0m                     
└─────────────────────────────────────────────────────────────────────────''';

const String END_MESSAGE = '''
==> 🎉 GENERATE Generated Files SUCCESSFULLY 🎉 <==

🙏 If this package helped you, please don't forget to
Give a 👍 on Pub.dev https://pub.dev/packages/Ind_utils
Give a ⭐️ on GitHub https://github.com/ansaralisah/ind_utils

                💚 THANK YOU! 💚
''';
