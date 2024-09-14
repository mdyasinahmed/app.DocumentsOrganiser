import 'package:flutter/material.dart';
import '../theme/colors.dart';
import '../widgets/add_document_popup.dart';
import 'categories_selection.dart';
import 'search_results.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        backgroundColor: AppColors.primaryColor,  // Title bar color
      ),
      body: Container(
        margin: const EdgeInsets.all(16.0),  // 10% margin from all sides
        child: Column(
          children: [
            const CategoriesSelection(),
            const SizedBox(height: 20),
            const SearchResults(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          showDialog(
            context: context,
            barrierDismissible: false,  // Prevents closing on outside tap
            builder: (context) => const AddDocumentPopup(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
