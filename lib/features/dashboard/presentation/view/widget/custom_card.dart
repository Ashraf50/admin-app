import 'package:admin_app/core/constant/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/constant/app_colors.dart';
import '../../../../../core/constant/app_images.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(13),
      ),
      child: Column(
        children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: const Color(0xff9198B3),
                width: 5,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.buttonDrawer,
                  width: 5,
                ),
              ),
              child: const Center(
                child: Text(
                  "100%",
                  style: AppStyles.textStyle18bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            children: [
              const Text(
                "All Tickets",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                width: 10,
              ),
              SvgPicture.asset(
                Assets.ticket,
                height: 28,
              )
            ],
          ),
          const Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "10",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
