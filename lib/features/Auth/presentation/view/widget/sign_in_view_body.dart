import 'package:admin_app/core/constant/app_styles.dart';
import 'package:admin_app/core/widget/custom_button.dart';
import 'package:admin_app/core/widget/custom_scaffold.dart';
import 'package:admin_app/core/widget/custom_text_field.dart';
import 'package:admin_app/features/Auth/presentation/view/widget/check_account_widget.dart';
import 'package:admin_app/features/Auth/presentation/view/widget/custom_auth_app_bar.dart';
import 'package:admin_app/features/Auth/presentation/view/widget/role_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool visibility = true;
  String selectedRole = "Admin";
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: ListView(
        children: [
          const CustomAuthAppBar(
            title: 'Welcome Back!',
            subTitle:
                'To keep connected with us please\nlogin with your personal Info',
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            'Sign In',
            style: AppStyles.textStyle20blackBold,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoleButton(
                selectedRole: selectedRole,
                title: "Admin",
                onTap: () {
                  setState(() {
                    selectedRole = "Admin";
                  });
                },
              ),
              RoleButton(
                selectedRole: selectedRole,
                title: "Manager",
                onTap: () {
                  setState(() {
                    selectedRole = "Manager";
                  });
                },
              )
            ],
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
                  prefixIcon: const Icon(Icons.lock_sharp),
                  obscureText: visibility,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        visibility = !visibility;
                      });
                    },
                    icon: visibility
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                          ),
                  ),
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        context.push('/forget_pass');
                      },
                      child: Text(
                        'forget password!',
                        style: AppStyles.textStyle18blue,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 15.h),
                CustomButton(
                  title: "Sign In",
                  onTap: () {
                    if (selectedRole == 'Admin') {
                      context.push('/admin_home');
                    } else {
                      context.push('/manager_home');
                    }
                  },
                ),
                SizedBox(height: 20.h),
                if (selectedRole == "Admin")
                  CheckedAccount(
                    title: "You don't have an account?",
                    buttonTitle: "Sign Up",
                    buttonOnTap: () {
                      context.push('/sign_up');
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
