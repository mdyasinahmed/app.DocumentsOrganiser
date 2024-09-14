import 'package:flutter/material.dart';
import '../theme/colors.dart';

class CustomTable extends StatelessWidget {
  const CustomTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Table(
      columnWidths: const {
        0: FractionColumnWidth(0.2),  // 20% width for Priority column
        1: FractionColumnWidth(0.6),  // 60% width for Documents Title column
        2: FractionColumnWidth(0.2),  // 20% width for PDF column
      },
      children: [
        TableRow(
          decoration: BoxDecoration(
            color: AppColors.primaryColor,  // Header background color
          ),
          children: [
            Container(
              height: 50,  // Adjustable height
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.horizontal(left: Radius.circular(10)),
              ),
              alignment: Alignment.center,
              child: Text(
                "Priority",
                style: TextStyle(color: AppColors.foregroundColor, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,  // Adjustable height
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
              ),
              alignment: Alignment.center,
              child: Text(
                "Documents Title",
                style: TextStyle(color: AppColors.foregroundColor, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 50,  // Adjustable height
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.horizontal(right: Radius.circular(10)),
              ),
              alignment: Alignment.center,
              child: Text(
                "PDF",
                style: TextStyle(color: AppColors.foregroundColor, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        // Add more rows as needed here
      ],
    );
  }
}