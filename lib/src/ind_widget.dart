import 'package:flutter/material.dart';
import 'package:ind_utils/ind_utils.dart';

class INDWidgets extends StatelessWidget {
  const INDWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          /// don't use like this
          ///  Padding(
          ///  padding:  EdgeInsets.symmetric(vertical: 8.0 , horizontal: 10),
          ///  child: const Text("Welcome"),
          /// )
          /// User Like this
          const Text("Welcome").sym(v: 10, h: 20),
          /// don't use like this
          ///    Padding(
          ///        padding: const EdgeInsets.only(left: 8.0 , right: 0 , bottom: 9 , top: 4),
          ///        child: Text("Welcome"),
          ///     )
          /// use like this
          const Text("Welcome").p0(b: 10, l: 10, r: 10, t: 10),
          ///  Don't use like this
          ///   Padding(
          /// padding: EdgeInsets.all(10),
          ///      child: const Text("Welcome"),
          /// )
          ///  Use Like This
          const Text("Welcome").pall(a: 10),
          50.hBox,
          /// Don't use like this if you wanna space between two widgets
          /// SizedBox(
          ///   width: 50,
          /// )
          /// Use like this
          50.wBox,
        ],
      ),
    );
  }
}
