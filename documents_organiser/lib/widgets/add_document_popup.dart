import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/custom_dropdown.dart';

class AddDocumentPopup extends StatefulWidget {
  const AddDocumentPopup({Key? key}) : super(key: key);

  @override
  _AddDocumentPopupState createState() => _AddDocumentPopupState();
}

class _AddDocumentPopupState extends State<AddDocumentPopup> {
  String? selectedCategory;
  String? selectedFolder;
  String? documentTitle;

  // Categories and corresponding folder options
  final Map<String, List<String>> folderOptionsByCategory = {
    'Books': ['Engineering', 'Courses', 'Productivity', 'Historical', 'Fiction', 'Others'],
    'Notes': ['Daily Writings', 'Class Notes', 'Book Writing', 'Information', 'Lists', 'Others'],
    'Certificates': ['PSC', 'JSC', 'SSC', 'HSC', 'Undergraduates', 'Others'],
    'Passport/NID': ['My Files', "Family Members'", "Friends'", 'Collected Files', 'Others'],
    'Others': ['Profile/Resume', 'Collected Information', 'Tech Career', 'Seminar', 'Others'],
  };

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final popupWidth = screenWidth * 0.7; // 70% of screen width

    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: screenWidth * 0.15),  // Centering the popup
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),  // 10% padding around popup content
            width: popupWidth,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30), // Space for the X button

                const Text(
                  'Add Your Documents',
                  style: TextStyle(
                    fontSize: 22,  // Headline font size
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),  // Space between headline and dropdown

                // Categories Dropdown
                CustomDropdown(
                  label: 'Select Categories',
                  options: folderOptionsByCategory.keys.toList(),
                  selectedValue: selectedCategory,
                  onChanged: (value) {
                    setState(() {
                      selectedCategory = value;
                      selectedFolder = null;  // Reset folder when category changes
                    });
                  },
                ),
                const SizedBox(height: 20),  // Space between dropdowns

                // Folders Dropdown
                CustomDropdown(
                  label: 'Select Folders',
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
                const SizedBox(height: 20),  // Space between dropdown and input field

                // Document Title Input
                Container(
                  width: popupWidth * 0.9,  // 90% of popup width
                  child: TextField(
                    onChanged: (value) {
                      documentTitle = value;
                    },
                    decoration: InputDecoration(
                      labelText: 'Write a Document Title',
                      labelStyle: TextStyle(color: Color(0xFF000000)),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30), // Full rounded borders
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),  // Space between input and buttons

                // Select PDF Button
                Container(
                  width: popupWidth * 0.9,  // 90% of popup width
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Logic to select PDF from device
                    },
                    icon: const Icon(Icons.add),  // Add icon
                    label: const Text('Select PDF From Device'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      foregroundColor: AppColors.foregroundColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),  // Space between buttons

                // Upload Document Button
                Container(
                  width: popupWidth * 0.9,  // 90% of popup width
                  child: ElevatedButton(
                    onPressed: () {
                      // Logic to upload document with selectedCategory, selectedFolder, and documentTitle
                      print('Uploading Document');
                      print('Category: $selectedCategory');
                      print('Folder: $selectedFolder');
                      print('Title: $documentTitle');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,  // Button background color
                      foregroundColor: AppColors.foregroundColor,  // Button text color
                    ),
                    child: const Text('UPLOAD DOCUMENT'),
                  ),
                ),
              ],
            ),
          ),

          // Close (X) Button at the top-right corner
          Positioned(
            top: 5,
            right: 5,
            child: IconButton(
              icon: const Icon(Icons.close, color: Colors.black),
              onPressed: () {
                Navigator.of(context).pop(); // Close the popup
              },
            ),
          ),
        ],
      ),
    );
  }
}
