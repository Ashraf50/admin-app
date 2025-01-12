import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widget/custom_text_field.dart';
import '../../../../../core/widget/drop_down_text_field.dart';

class AddNewManager extends StatelessWidget {
  const AddNewManager({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "Create New"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "First Name",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "First Name",
              controller: TextEditingController(),
            ),
            const Text(
              "Last Name",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Last Name",
              controller: TextEditingController(),
            ),
            const Text(
              "Phone Number",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Phone Number",
              controller: TextEditingController(),
            ),
            const Text(
              "Email",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Email",
              controller: TextEditingController(),
            ),
            const Text(
              "Department",
              style: AppStyles.textStyle18bold,
            ),
            const DropdownTextField(),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Password",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Password",
              controller: TextEditingController(),
            ),
            const Text(
              "Confirm Password",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Confirm Password",
              controller: TextEditingController(),
            ),
            CustomButton(
              title: "Submit",
              onTap: () {},
            ),
            const SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
