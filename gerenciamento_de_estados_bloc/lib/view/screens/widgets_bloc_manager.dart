import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/checkbox_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/radio_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/slider_bloc.dart';
import 'package:gerenciamento_de_estados_bloc/logic/form_widgets/switch_bloc.dart';

class WidgetsBloc extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Bloc"),
        ),
        body: BlocListener<CheckBoxBloc, CheckBoxState>(
          listener: myListener,
          child: Container(
            child: Column(
              children: [
                myCheckBox(),
                mySwitch(),
                mySlider(),
                myRadio(1),
                myRadio(2),
                myRadio(3),
                myButtonBottomSheet(),
              ],
            ),
          ),
        ));
  }

  Widget myCheckBox() {
    return BlocBuilder<CheckBoxBloc, CheckBoxState>(
        builder: (context, state) => Checkbox(
            value: state == CheckBoxState.checked ? true : false,
            onChanged: (bool inValue) {
              if (inValue) {
                BlocProvider.of<CheckBoxBloc>(context).add(CheckBoxEvent.check);
              } else {
                BlocProvider.of<CheckBoxBloc>(context)
                    .add(CheckBoxEvent.uncheck);
              }
            }));
  }

  Widget mySwitch() {
    return BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) => Switch(
            value: state == SwitchState.on,
            onChanged: (bool inValue) {
              if (inValue) {
                BlocProvider.of<SwitchBloc>(context).add(SwitchEvent.turn_on);
              } else {
                BlocProvider.of<SwitchBloc>(context).add(SwitchEvent.turn_off);
              }
            }));
  }

  Widget mySlider() {
    return BlocBuilder<SliderBloc, double>(
        builder: (context, state) => Slider(
            min: 0,
            max: 20,
            value: state,
            onChanged: (double inValue) {
              BlocProvider.of<SliderBloc>(context).add(inValue);
            }));
  }

  Widget myRadio(int value) {
    return BlocBuilder<RadioBloc, int>(
        builder: (context, state) => Radio(
              groupValue: state,
              onChanged: (int inValue) {
                BlocProvider.of<RadioBloc>(context).add(inValue);
              },
              value: value,
            ));
  }

  myListener(context, state) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.orange,
        duration: Duration(seconds: 5),
        content: Text("Obrigado"),
        action: SnackBarAction(
          label: "Volte Sempre",
          onPressed: () {
            print("Funcionou $state");
          },
        ),
      ),
    );
  }

  Widget myButtonBottomSheet() {
    return Builder(
        builder: (context) => ElevatedButton(
            child: Text("BottomSheet"),
            onPressed: () {
              showBottomSheet(
                  backgroundColor: Colors.orange,
                  context: context,
                  builder: (_) => Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [Text("asdf"), Text("Letícia")],
                      ));
            }));
  }
}
