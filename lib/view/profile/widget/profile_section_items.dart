// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:zevoyi/controller/profile/profile_controller.dart';
// import 'package:zevoyi/view/profile/widget/navigator_key_class.dart';

// import '../../../model/profile_model/profile_sections_model.dart';

// class ProfileSectionItems {
//   final ProfileProvider profileProvider = Provider.of<ProfileProvider>(
//       NavigationService.navigatorKey.currentContext!,
//       listen: false);
//   final List<ProfileSectionModel> profileSectionList = [
//     ProfileSectionModel(
//       leadingIcon: Icons.notifications,
//       title: 'Notifications',
//       ontap: () => (NavigationService.navigatorKey.currentContext!)
//           .read<ProfileProvider>()
//           .goToNotificationSettings(),
//     ),
//     ProfileSectionModel(
//       leadingIcon: Icons.location_on,
//       title: 'Saved Addresses',
//       ontap: () => (NavigationService.navigatorKey.currentContext!)
//           .read<ProfileProvider>()
//           .goToAddressPage(),
//     ),
//     ProfileSectionModel(
//       leadingIcon: Icons.developer_board,
//       title: 'About',
//       ontap: () => (NavigationService.navigatorKey.currentContext!)
//           .read<ProfileProvider>()
//           .aboutApp(),
//     )
//   ];
// }
