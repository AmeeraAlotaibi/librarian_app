import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleSwitch extends StatefulWidget {
  ToggleSwitch({Key? key}) : super(key: key);

  @override
  State<ToggleSwitch> createState() => _ToggleSwitchState();
}

class _ToggleSwitchState extends State<ToggleSwitch> {
  List<bool> isSelected = [true, false];
  @override
  Widget build(BuildContext context) {
    return ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      fillColor: Colors.green,
      renderBorder: false,
      onPressed: (int newIndex) {
        setState(() {
          for (int i = 0; i < isSelected.length; i++) {
            if (i == newIndex) {
              isSelected[i] = true;
            } else {
              isSelected[i] = false;
            }
          }
        });
      },
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'Yes',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ),
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                'No',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )),
        ),
      ],
    );
  }
}
