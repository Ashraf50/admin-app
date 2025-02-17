import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/core/widget/custom_text_field.dart';
import 'package:admin_app/features/home/presentation/view/widget/profile_photo.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "Edit Profile"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const ProfilePhoto(),
            Text(
              "First Name",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "First Name",
              controller: TextEditingController(),
            ),
            Text(
              "Last Name",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Last Name",
              controller: TextEditingController(),
            ),
            Text(
              "Email",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Email",
              controller: TextEditingController(),
            ),
            CustomButton(
              title: "Submit",
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }
}
