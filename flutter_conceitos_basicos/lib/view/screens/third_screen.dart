import 'package:flutter/material.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        //color: Colors.orange,
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(150),
                border: Border.all(color: Colors.black)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150),
              child: Image.asset("assets/images/wong.png",
                  height: 350, fit: BoxFit.fitHeight),
            ),
          ),
          Text("Letícia Wong",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  letterSpacing: 2)),
          Text(
              "Esta aqui é a Letícia, aluna de BSI que gosta de ratos, qualquer um deles.",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
        ]);
  }
}
