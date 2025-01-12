import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/features/all_tickets/presentation/view/widget/status_button.dart';
import 'package:flutter/material.dart';

class TicketsDetailsView extends StatelessWidget {
  const TicketsDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "Ticket Details"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: const [
            CircleAvatar(
              radius: 100,
              backgroundImage: AssetImage("assets/img/profile.jpg"),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                "Alaa Salem",
                style: AppStyles.textStyle18black,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Ticket Details:",
              style: AppStyles.textStyle18bold,
            ),
            SelectableText(
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna ali",
              style: AppStyles.textStyle18black,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Text(
                  "Status",
                  style: AppStyles.textStyle18bold,
                ),
                SizedBox(
                  width: 30,
                ),
                StatusButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
