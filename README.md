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
- Log
- Get Height and Width of Screen

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
          Text("Welcome").sym(v: 10, h: 20), // Padding EdgeInsets.symmetric
          const Text("Welcome").pO(b: 10, l: 10, r: 10, t: 10), // Padding EdgeInsets.only
          const Text("Welcome").pall(a: 10), // Padding EdgeInsets.all
          50.hBox, // Give Space with Two Widgets Vertical
          50.wBox, // Give width in SizedBox like SizedBox(width: 50)
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
