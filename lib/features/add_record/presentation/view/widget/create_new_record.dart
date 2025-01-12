import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_app_bar.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:flutter/material.dart';
import '../../../../../core/widget/custom_text_field.dart';

class CreateNewRecord extends StatelessWidget {
  const CreateNewRecord({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: const CustomAppBar(title: "Crete New"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Record Name",
              style: AppStyles.textStyle18bold,
            ),
            CustomTextfield(
              hintText: "Record Name",
              controller: TextEditingController(),
            ),
            CustomButton(
              title: "Submit",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
