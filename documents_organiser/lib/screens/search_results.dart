import 'package:flutter/material.dart';
import '../widgets/custom_table.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4.0),  // Padding around the table
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),  // Rounded corners
      ),
      child: CustomTable(),
    );
  }
}