import 'package:admin_app/features/home/presentation/view/widget/change_phot_button.dart';
import 'package:flutter/material.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundImage: AssetImage("assets/img/profile.jpg"),
          ),
          Positioned(
            bottom: -3,
            right: 11,
            child: ChangePhotoButton(
              choosePhoto: () {},
              takePhoto: () {},
            ),
          )
        ],
      ),
    );
  }
}
