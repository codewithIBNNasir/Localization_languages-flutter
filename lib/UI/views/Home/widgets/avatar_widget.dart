import 'package:flutter/material.dart';
import 'package:localization_languages/UI/views/Home/home_view_model.dart';
import '../../../../../../app/app_constants.dart';

class AvatarWidget extends StatelessWidget {
  final HomeViewModel vm;
  const AvatarWidget({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => vm.setAvatarHovered(true),
      onExit: (_) => vm.setAvatarHovered(false),
      child: GestureDetector(
        onTap: () => vm.setAvatarHovered(!vm.isAvatarHovered),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: (vm.isAvatarHovered
                        ? AppColors.accent
                        : AppColors.accentSecondary)
                    .withOpacity(0.5),
                blurRadius: vm.isAvatarHovered ? 30 : 15,
                spreadRadius: vm.isAvatarHovered ? 4 : 1,
              ),
            ],
          ),
          child: ClipOval(
            child: Image.asset(
              'assets/images/picture.jpeg',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}