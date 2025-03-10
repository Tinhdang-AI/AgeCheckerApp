import 'package:flutter/material.dart';

void main() {
  runApp(AgeCheckerApp());
}

class AgeCheckerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AgeCheckerScreen(),
    );
  }
}

class AgeCheckerScreen extends StatefulWidget {
  @override
  _AgeCheckerScreenState createState() => _AgeCheckerScreenState();
}

class _AgeCheckerScreenState extends State<AgeCheckerScreen> {
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

    String category;
    Color resultColor;

    if (age > 65) {
      category = "Người già";
      resultColor = Colors.brown;
    } else if (age >= 6) {
      category = "Người lớn";
      resultColor = Colors.blue;
    } else if (age >= 2) {
      category = "Trẻ em";
      resultColor = Colors.orange;
    } else {
      category = "Em bé";
      resultColor = Colors.pink;
    }

    setState(() {
      _result = "$name thuộc nhóm: $category";
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_result, style: TextStyle(fontSize: 16)),
        backgroundColor: resultColor,
        duration: Duration(seconds: 2),
      ),
    );
  }

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
        child: Column(
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
              textCapitalization: TextCapitalization.words, // Viết hoa chữ cái đầu
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
        ),
      ),
    );
  }
}
