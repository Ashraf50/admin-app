import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/core/widget/custom_text_field.dart';
import 'package:admin_app/features/Auth/presentation/view/widget/check_account_widget.dart';
import 'package:admin_app/features/Auth/presentation/view/widget/custom_auth_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          const CustomAuthAppBar(
            title: 'Hello friend!',
            subTitle:
                'To keep connected with us please\nlogin with your personal Info',
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            'Sign Up',
            style: AppStyles.textStyle20blackBold,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                Text(
                  "Password",
                  style: AppStyles.textStyle18black,
                ),
                CustomTextfield(
                  hintText: "Enter your password",
                  controller: TextEditingController(),
                  prefixIcon: const Icon(Icons.lock_sharp),
                  suffixIcon: const Icon(Icons.visibility),
                ),
                Text(
                  "Confirm Password",
                  style: AppStyles.textStyle18black,
                ),
                CustomTextfield(
                  hintText: "Enter your password",
                  controller: TextEditingController(),
                  prefixIcon: const Icon(Icons.lock_sharp),
                  suffixIcon: const Icon(Icons.visibility),
                ),
                SizedBox(height: 15.h),
                CustomButton(
                  title: "Sign Up",
                  onTap: () {},
                ),
                SizedBox(height: 20.h),
                CheckedAccount(
                  title: "Already have an account?",
                  buttonTitle: "Sign In",
                  buttonOnTap: () {
                    context.push('/sign_in');
                  },
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
