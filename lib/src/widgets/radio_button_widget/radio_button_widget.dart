import 'package:flutter/material.dart';

class RadioButtonWidget extends StatefulWidget {
  const RadioButtonWidget({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed,
  });
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
}

class _RadioButtonWidgetState extends State<RadioButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          activeColor: Colors.white,
          fillColor: MaterialStateProperty.all(
              widget.isSelected ? Colors.white : const Color(0xFF07767D)),
          value: widget.isSelected,
          onChanged: (_) => widget.onPressed(),
          groupValue: true,
        ),
        Text(
          widget.label,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: Color.fromARGB(255, 19, 81, 88),
          ),
        ),
      ],
    );
  }
}
