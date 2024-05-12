import 'package:applanguefront/widgets/appbar.dart';
import 'package:flutter/material.dart';


class TutoScreen extends StatefulWidget {
  const TutoScreen({super.key});
  @override
  State<TutoScreen> createState() => _TutoScreenState();
}

class _TutoScreenState extends State<TutoScreen> {
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        MyAppBar(title: "Tuto", showClose: false),
        Expanded(
          child: Center(child: Text("Tuto Screen")
          )
        )
      ]
      )
    );
}
}