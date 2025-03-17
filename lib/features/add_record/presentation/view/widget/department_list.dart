import 'package:admin_app/features/add_record/presentation/view/widget/record_card.dart';
import 'package:flutter/material.dart';

class DepartmentListView extends StatelessWidget {
  const DepartmentListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.only(top: 13),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(13)),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 3,
          itemBuilder: (context, index) {
            return RecordCard(
              index: index,
              title: "CS",
            );
          },
        ),
      ),
    );
  }
}
