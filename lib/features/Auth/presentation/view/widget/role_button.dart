import 'package:flutter/material.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_styles.dart';

class RoleButton extends StatelessWidget {
  final String selectedRole;
  final void Function() onTap;
  final String title;
  const RoleButton({
    super.key,
    required this.selectedRole,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11, horizontal: 45),
        decoration: BoxDecoration(
          color: selectedRole == title ? AppColors.darkBlue : AppColors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            title,
            style: selectedRole == title
                ? AppStyles.textStyle18white
                : AppStyles.textStyle18black,
          ),
        ),
      ),
    );
  }
}
