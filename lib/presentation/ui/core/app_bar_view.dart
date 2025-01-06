// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:step_tracker/common/common.dart';
// import 'package:step_tracker/common/extensions/extensions.dart';
//
// import '../../../gen/assets.gen.dart';
//
// class AppBarView extends StatelessWidget implements PreferredSizeWidget {
//   const AppBarView({
//     super.key,
//     this.title,
//     this.onBack,
//     this.actions,
//     this.leading,
//     this.isShowBackIcon = true,
//     this.widthIconLeading,
//     this.heightIconLeading,
//     this.backgroundColor,
//   });
//
//   final String? title;
//   final Function? onBack;
//   final List<Widget>? actions;
//   final bool isShowBackIcon;
//   final Widget? leading;
//   final double? widthIconLeading;
//   final double? heightIconLeading;
//   final Color? backgroundColor;
//
//   @override
//   Widget build(BuildContext context) {
//     Widget? leadingIcon = leading != null
//         ? Padding(
//             padding: const EdgeInsets.only(left: 24.0),
//             child: leading,
//           )
//         : (isShowBackIcon
//             ? IconButton(
//                 onPressed: () {
//                   if (onBack != null) {
//                     onBack!();
//                   } else {
//                     context.pop();
//                   }
//                 },
//                 icon: Assets.images.svgs.iconBack
//                     .tintColor(context.getColor(AppColor.primaryTextColor)),
//                 highlightColor: context.getColor(AppColor.colorDarkGray),
//               )
//             : const SizedBox());
//     return AppBar(
//       scrolledUnderElevation: 0,
//       title: Text(
//         title ?? '',
//         style: AppTextStyles.getTitleStyle(context),
//       ),
//       leading: leadingIcon,
//       centerTitle: true,
//       actions: actions,
//       backgroundColor: backgroundColor ?? context.getColor(AppColor.bgColor),
//     );
//   }
//
//   @override
//   Size get preferredSize => const Size.fromHeight(kToolbarHeight);
// }
