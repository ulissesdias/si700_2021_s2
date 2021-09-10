import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  final List icons = [
    Icons.cake,
    Icons.ac_unit,
    Icons.access_alarm_rounded,
    Icons.accessibility_new_sharp
  ];

  final List textos = [
    "Letícia",
    "Lweartoski",
    "Wong",
    "Breno",
    "Souza",
    "Reis",
    "Samantha",
    "Beatriz",
    "Paschoalini",
    "Paloma",
    "Eduarda",
    "Salvador",
    "Mello",
    "Carlos",
    "Henrique",
    "Silva",
    "Cirqueira"
  ];

  @override
  Widget build(BuildContext context) {
    return basicListView();
  }

  Widget iterationWithListView() {
    return ListView.builder(
        itemCount: textos.length,
        itemBuilder: (context, index) {
          return ListTile(
              onTap: () {},
              trailing:
                  GestureDetector(onTap: () {}, child: Icon(Icons.delete)),
              leading: Icon(icons[index % icons.length]),
              title: Text(textos[index % textos.length]));
        });
  }

  Widget basicListView() {
    return ListView(
      children: [
        Text("Lewartosky"),
        Card(
          color: Colors.orange,
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(1100)),
          child: ListTile(
            title: Text("Primeiro"),
            leading: Icon(Icons.ac_unit_outlined),
            trailing: Icon(Icons.add_a_photo),
            onTap: () {},
          ),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Colors.orange,
            Colors.yellow,
            Colors.blue,
          ])),
          margin: EdgeInsets.all(20),
          child: ListTile(
            title: Text("Primeiro com Container"),
            leading: Icon(Icons.ac_unit_outlined),
            trailing: Icon(Icons.add_a_photo),
          ),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
        ListTile(
          title: Text("Primeiro"),
          leading: Icon(Icons.ac_unit_outlined),
          trailing: Icon(Icons.add_a_photo),
        ),
      ],
    );
  }
}
