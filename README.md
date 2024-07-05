# ind_utils

ind_utils package use this package for SizedBox, Padding , Text , Show Toast , Get height and width
of Screen. No Need to write long code for these`

## Installation

1. Add the latest version of package to your pubspec.yaml (and run`dart pub get`):

```yaml
dependencies:
  ind_utils: ^0.1.0
```

1. Import the package and use it in your Flutter App.

```dart
import 'package:ind_utils/ind_utils.dart';
```

## Example

Use for SizedBox, Padding , Text , Show Toast , Get height and width
of Screen. No Need to write long code for these

- Padding
- Text
- Go to Next Page
- Log
- Show Toast Message
- Get Height and Width of Screen
- SizedBox
- More Widgets


<hr>

<table>
<tr>
<td>

```dart

class INDWidgets extends StatelessWidget {
  const INDWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const Text("Welcome").pSym(v: 10, h: 20),// Padding EdgeInsets.symmetric
          const Text("Welcome").mSym(v: 10, h: 20),// Margin EdgeInsets.symmetric
          const Text("Welcome").pO(b: 10, l: 10, r: 10, t: 10),// Padding EdgeInsets.only
          const Text("Welcome").mO(b: 10, l: 10, r: 10, t: 10),// Margin EdgeInsets.only
          const Text("Welcome").pAll(a: 10),// Padding EdgeInsets.all
          const Text("Welcome").mAll(a: 10),// Margin EdgeInsets.all
          const Text("Welcome").pZ(),// Padding EdgeInsets.zero
          const Text("Welcome").pZ().align(),// Align Widget
          50.hBox,// Give Space with Two Widgets Vertical
          50.wBox, // Give Space with Two Widgets Horizontal
          "Center Widget".txt(c: Colors.white, tA: TextAlign.center, fS: 30, fW: FontWeight.bold).center(),// Center Widget
          "Console Value".txt(fS: 20).onTab(() {
            var log = Log();
            log.w("Waning"); // print Waning value
            log.url("http://indiancreator.in/"); // print url
            log.e("Please Check Your URL");// print values
            log.i("Welcome in IndianCreator");// 
            log.d("Welcome");
          }),
          Icons.home_filled.icon(),// build icon Like This
          Icons.add.iconButton(iS: 20, pressed: () {
            context.goTo(context: context,page: NextPage());/// Open New Page
          }), // build iconButton Like This
          "Show Toast Message".text(fW: FontWeight.bold).onTab(() {
            context.message(text: "Toast Message");// show Toast Message
          }),
          "welcome".text(c: Colors.white).pSym(h: 10, v: 10).card(color: Colors.indigoAccent),// Card Widget
          "Show Dialog".text(fS: 20).onTab(() {
            context.dialog(
                title: "Delete App".text(fS: 30, fW: FontWeight.bold),
                content: "This is Dialog".text(),
                actions: [
                  "Cancel".text().onTab(() {
                    context.back();// Navigator.pop(context, false); No Need to write This
                  }),
                  25.wBox,
                  "OK".text().onTab(() {
                    context.back();// Navigator.pop(context, false); No Need to write This
                  }),
                ]);/// Show Dialog
          })
        ],
      ),
    );
  }
}

```

</td>
<td>
</td>
</tr>
</table>

## Next Goals

- [x] We will Explore More Utils