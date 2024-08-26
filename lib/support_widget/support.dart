import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final String image;
  const CategoryTile({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20),
      height: 120,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Image.asset(
            image,
            height: 70,
            width: 70,
            fit: BoxFit.cover,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Icon(
              Icons.arrow_forward,
            ),
          ),
        ],
      ),
    );
  }
}

class AppWidget {
  static TextStyle BoldTextsyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle SemiboldBoldTextsyle() {
    return TextStyle(
      color: Colors.black,
      fontSize: 22,
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle lisghtTextsyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 20,
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle normalTextsyle() {
    return TextStyle(
      color: Colors.black54,
      fontSize: 17,
      fontWeight: FontWeight.w500,
    );
  }

  showSnack(String t, BuildContext context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(t)),
    );
  }
}
