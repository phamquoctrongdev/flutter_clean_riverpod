import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_riverpod/presentation/common/app_extension.dart';
import 'package:flutter_clean_riverpod/presentation/ui/core/app_text.dart';

import '../../../../generated/locale_keys.g.dart';
import '../../../theme/theme_color.dart';
import '../app_button.dart';

class PermissionAlertDialog extends StatelessWidget {
  final String title, description;
  final String imagePath;

  const PermissionAlertDialog({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: context.color(
        AppColor.primaryBackground,
      ),
      child: _dialogContent,
    );
  }

  Widget get _dialogContent {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(
              height: 27,
            ),
            AppText(
              text: title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 27,
            ),
            AppText(
              text: description,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 27,
            ),
            AppButton(
              title: LocaleKeys.grant_permission.tr(),
              titleColor: Colors.white,
              backgroundColor: context.color(AppColor.mainColor),
              onTap: () {
                Navigator.of(context).pop<bool>(true);
              },
            ),
            const SizedBox(
              height: 16,
            ),
            AppButton(
              title: LocaleKeys.label_cancel.tr(),
              height: 50.0,
              titleColor: context.color(AppColor.secondaryButtonTitle),
              backgroundColor: context.color(AppColor.secondaryColor),
              onTap: () {
                Navigator.of(context).pop<bool>(false);
              },
            ),
          ],
        ),
      );
    });
  }
}
