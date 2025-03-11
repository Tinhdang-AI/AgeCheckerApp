// TODO Implement this library.
import 'package:flutter/material.dart';
import '../models/age_category.dart';

class AgeInputForm extends StatefulWidget {
  @override
  _AgeInputFormState createState() => _AgeInputFormState();
}

class _AgeInputFormState extends State<AgeInputForm> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  String _result = "";

  void _checkAgeCategory() {
    String name = _nameController.text.trim();
    int? age = int.tryParse(_ageController.text);

    if (name.isEmpty || age == null) {
      setState(() {
        _result = "Vui lòng nhập đầy đủ thông tin!";
      });
      return;
    }

    AgeCategory category = AgeCategory.fromAge(age);

    setState(() {
      _result = "$name thuộc nhóm: ${category.label}";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_result, style: TextStyle(fontSize: 16)),
        backgroundColor: category.color,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          controller: _nameController,
          decoration: InputDecoration(
            labelText: "Họ và tên",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person),
          ),
          textCapitalization: TextCapitalization.words,
        ),
        SizedBox(height: 15),
        TextField(
          controller: _ageController,
          decoration: InputDecoration(
            labelText: "Tuổi",
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.cake),
          ),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _checkAgeCategory,
          child: Text("Kiểm tra", style: TextStyle(fontSize: 18)),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 15),
          ),
        ),
        SizedBox(height: 20),
        Text(
          _result,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blueAccent),
        ),
      ],
    );
  }
}
