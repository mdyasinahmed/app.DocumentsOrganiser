import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String label;
  final List<String> options;
  final String? selectedValue;  // Added to display selected value
  final Function(String?) onChanged; // Callback function to handle selection

  const CustomDropdown({
    Key? key,
    required this.label,
    required this.options,
    this.selectedValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: selectedValue,  // Show the selected value
      hint: Text(
        label,
        style: TextStyle(color: AppColors.primaryColor),
      ),
      items: options.map((String option) {
        return DropdownMenuItem<String>(
          value: option,
          child: Text(option),
        );
      }).toList(),
      onChanged: onChanged,  // Pass selected value to parent
      icon: const Icon(Icons.arrow_drop_down),  // Dropdown icon
      isExpanded: true,  // To make dropdown full width
      underline: const SizedBox(), // Remove underline
    );
  }
}
