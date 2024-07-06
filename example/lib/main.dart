import 'package:flutter/material.dart';
import 'package:ind_utils/ind_utils.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            /// Make MainAxisAlignment.center
            mainAxisAlignment: mainCenter,

            children: [
              DecoratedBox(
                decoration: const BoxDecoration(color: Colors.red),

                /// Make Padding EdgeInsets.symmetric
                child: const Text("Welcome").sym(v: 10, h: 20),
              ),

              /// Give height in SizedBox like SizedBox(height: 50)
              50.hBox,

              Row(
                /// Make MainAxisAlignment.center
              mainAxisAlignment: mainCenter,
                children: [
                  DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.red),

                      /// Make Padding EdgeInsets.only
                      child: const Text("Welcome").p0(b: 10, r: 10, t: 10)),

                  /// Give width in SizedBox like SizedBox(width: 50)
                  50.wBox,

                  /// Make Padding EdgeInsets.all
                  DecoratedBox(
                      decoration: const BoxDecoration(color: Colors.green),
                      child: const Text("Welcome").pall(a: 10)),
                ],
              ),


            ],
          ),
        ),
      ),
    );
  }
}
