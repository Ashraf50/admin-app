import 'package:flutter/material.dart';
import 'manager_card.dart';

class AllManageListView extends StatelessWidget {
  const AllManageListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(13),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(13)),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {},
              child: const ManagerCard(),
            );
          },
        ),
      ),
    );
  }
}
