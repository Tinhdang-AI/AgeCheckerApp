import 'package:flutter/material.dart';
import '../widgets/age_input_form.dart';

class AgeCheckerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Kiểm Tra Nhóm Tuổi"),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: AgeInputForm(),
      ),
    );
  }
}

