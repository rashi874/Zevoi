import 'package:flutter/cupertino.dart';

class ProfileSectionModel {
  final String title;
  final IconData leadingIcon;
  final void Function() ontap;
  ProfileSectionModel({
    required this.leadingIcon,
    required this.title,
    required this.ontap,
  });
}
