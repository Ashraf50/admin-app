import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/core/widget/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgetPasswordViewBody extends StatelessWidget {
  const ForgetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "Reset your password",
                style: AppStyles.textStyle20blackBold.copyWith(height: 2),
              ),
            ),
            Center(
              child: Text(
                "We well send an email with \n instructions to reset your password ",
                style: AppStyles.textStyle18black,
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 30.h),
            Text(
              "Email",
              style: AppStyles.textStyle18black,
            ),
            CustomTextfield(
              hintText: "Enter your Email",
              controller: TextEditingController(),
              prefixIcon: const Icon(Icons.email),
            ),
            SizedBox(height: 15.h),
            CustomButton(
              title: "Reset password",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
