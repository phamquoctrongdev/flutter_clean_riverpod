// import 'package:flutter/material.dart';
// import 'package:step_tracker/common/common.dart';
// import 'package:step_tracker/generated/generated.dart';
//
// import '../widgets/base_button.dart';
//
// class ConfirmDeleteDialog extends StatelessWidget {
//   const ConfirmDeleteDialog({
//     super.key,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(16),
//       ),
//       elevation: 0.0,
//       backgroundColor: context.getColor(AppColor.primaryBackground),
//       child: _dialogContent(context),
//     );
//   }
//
//   Widget _dialogContent(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min, // To make the card compact
//         children: [
//           Text(
//             LocaleKeys.confirm_title_delete.tr(),
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: context.getColor(AppColor.primaryTextColor),
//               fontWeight: FontWeight.bold,
//               fontSize: 24,
//             ),
//           ),
//           const SizedBox(
//             height: 27,
//           ),
//           Text(
//             LocaleKeys.confirm_description_delete_item.tr(),
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               color: context.getColor(AppColor.primaryTextColor),
//               fontWeight: FontWeight.normal,
//               fontSize: 18,
//             ),
//           ),
//           const SizedBox(
//             height: 27,
//           ),
//           BaseButton(
//             title: LocaleKeys.ok.tr(),
//             width: double.infinity,
//             height: 50,
//             titleColor: Colors.white,
//             bgColor: context.getColor(AppColor.mainColor),
//             onTap: () => Navigator.of(context).pop<bool>(true),
//           ),
//           const SizedBox(
//             height: 16,
//           ),
//           BaseButton(
//             title: LocaleKeys.cancel.tr(),
//             width: double.infinity,
//             height: 50,
//             titleColor: context.getColor(AppColor.secondaryButtonTitle),
//             bgColor: context.getColor(AppColor.secondaryColor),
//             onTap: () => Navigator.of(context).pop<bool>(false),
//           ),
//         ],
//       ),
//     );
//   }
// }
