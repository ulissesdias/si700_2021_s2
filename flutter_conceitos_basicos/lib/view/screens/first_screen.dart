import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  asdf(lista) {
    return lista;
  }

  @override
  Widget build(BuildContext context) {
    List listA = asdf(["a", "b", "c", "d"]);

    List<Widget> listW = [];

    for (var el in listA) {
      listW.add(Text(" -- $el -- "));
    }

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(20),
            height: 350,
            //color: Colors.orange,
            transform: Matrix4.rotationZ(0.05),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
                boxShadow: [BoxShadow(color: Colors.orange, blurRadius: 10)],
                gradient: LinearGradient(colors: [
                  Colors.red,
                  Colors.blue,
                  Colors.yellow,
                  Colors.green,
                  Colors.red
                ])),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              verticalDirection: VerticalDirection.down,
              children: [
                Text("Letícia Lewartoski Wong"),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: () {}, child: Text("Carlos")),
                    ElevatedButton(onPressed: () {}, child: Text("Breno")),
                  ],
                ),
                Text("Molinari"),
                Text("Cicero"),
              ],
            ),
            //width: 120,
            //height: 200,
          ),
          Container(
            child: Text("Samantha Beatriz"),
          ),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Text("A"),
          Row(
            children: listW,
          )
        ],
      ),
    );
  }
}
