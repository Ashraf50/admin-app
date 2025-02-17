import 'package:admin_app/core/constant/app_styles.dart';
import 'package:flutter/material.dart';

class ManagerCard extends StatelessWidget {
  const ManagerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Title",
                    style: AppStyles.textStyle18black,
                  ),
                  Row(
                    children: [
                      Text(
                        "Subtitle",
                        style: AppStyles.textStyle16,
                      ),
                      const Icon(
                        Icons.person,
                        color: Colors.grey,
                      )
                    ],
                  ),
                ],
              ),
              Text(
                "01010101010",
                style: AppStyles.textStyle18black,
              ),
              PopupMenuButton(
                color: Colors.white,
                icon: const Icon(Icons.more_vert),
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text('Delete'),
                  ),
                ],
                onSelected: (value) {
                  // Handle menu item selection
                  if (value == 'edit') {
                    // Handle edit action
                  } else if (value == 'delete') {
                    // Handle delete action
                  }
                },
              ),
            ],
          ),
          const Divider(),
        ],
      ),
    );
  }
}
