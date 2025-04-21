 import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

BottomBarItem bottomBarItem({
  required IconData icon,
  required String text
}) =>
    BottomBarItem(
      inActiveItem: Icon(icon, color: Colors.white),
      activeItem: Icon(icon, color: Colors.blueAccent),
      itemLabelWidget: Text(
        text,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w900,
            color: Colors.white
        ),
      ),
    );


Widget defaultTextFormField({
  required TextEditingController controller,
  required String text,
  required String labelText,
  required IconData icon,
  required GestureTapCallback onTap,
}) =>
    TextFormField(
      onTap: onTap,
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return text;
        }
      },
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          labelText: labelText,
          prefixIcon: Icon(icon)
      ),
    );


