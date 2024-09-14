import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_dropdown.dart';

class CategoriesSelection extends StatefulWidget {
  const CategoriesSelection({Key? key}) : super(key: key);

  @override
  _CategoriesSelectionState createState() => _CategoriesSelectionState();
}

class _CategoriesSelectionState extends State<CategoriesSelection> {
  String? selectedCategory;  // Store selected category
  String? selectedFolder;  // Store selected folder

  final Map<String, List<String>> folderOptionsByCategory = {
    'Books': ['Engineering', 'Courses', 'Productivity', 'Historical', 'Fiction', 'Others'],
    'Notes': ['Daily Writings', 'Class Notes', 'Book Writing', 'Information', 'Lists', 'Others'],
    'Certificates': ['PSC', 'JSC', 'SSC', 'HSC', 'Undergrades', 'Others'],
    'Passport/NID': ['My Files', "Family Members'", "Friends'", 'Collected Files', 'Others'],
    'Others': ['Profile/Resume', 'Collected Information', 'Tech Career', 'Seminar', 'Others'],
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Categories Dropdown (40% width)
          Expanded(
            flex: 4,
            child: CustomDropdown(
              label: 'Categories',
              options: folderOptionsByCategory.keys.toList(),
              selectedValue: selectedCategory,
              onChanged: (value) {
                setState(() {
                  selectedCategory = value;
                  selectedFolder = null;  // Reset folder when category changes
                });
              },
            ),
          ),
          const SizedBox(width: 8),  // Spacing between dropdowns

          // Folders Dropdown (40% width)
          Expanded(
            flex: 4,
            child: CustomDropdown(
              label: 'Folders',
              options: selectedCategory != null
                  ? folderOptionsByCategory[selectedCategory!] ?? []
                  : [],
              selectedValue: selectedFolder,
              onChanged: (value) {
                setState(() {
                  selectedFolder = value;
                });
              },
            ),
          ),
          const SizedBox(width: 8),  // Spacing before search button

          // Search Button (20% width)
          Expanded(
            flex: 2,
            child: ElevatedButton(
              onPressed: () {
                // Handle search logic with selectedCategory and selectedFolder
                print('Selected Category: $selectedCategory');
                print('Selected Folder: $selectedFolder');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                foregroundColor: AppColors.foregroundColor,
              ),
              child: const Icon(Icons.search),  // Just the search icon
            ),
          ),
        ],
      ),
    );
  }
}
