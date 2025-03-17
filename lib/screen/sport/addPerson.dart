import 'package:flutter/material.dart';

class SportAddPerson extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  SportAddPerson({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(children: [
          Form(
            key: _formKey,
            child: Column(
              children: [

              ],
            ),
          )
        ]),
      ),
    );
  }
}
