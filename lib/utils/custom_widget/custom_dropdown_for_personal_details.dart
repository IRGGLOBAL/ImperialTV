import 'package:flutter/material.dart';

import 'my_color.dart';

class CustomDropdown2 extends StatelessWidget {
  final String title;
  final List<String> items;
  final String? selectedValue;
  final void Function(String) onChanged;

  const CustomDropdown2({
    Key? key,
    required this.title,
    required this.items,
    required this.onChanged,
    this.selectedValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: selectedValue,
            items: items.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) onChanged(value);
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(borderSide: BorderSide(
                  width: 1, ),
                borderRadius: BorderRadius.circular(8),),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 1, color:  MyColor.primaryColor),
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
