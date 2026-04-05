import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class ProgressExample extends StatelessWidget {
  const ProgressExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    return Scaffold(
      appBar: const AppAppBar(title: 'Progress & Snackbar'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppProgressBar',
              description: 'Determinate progress with label and percentage.',
              code: 'AppProgressBar(\n'
                  '  value: 0.75,\n'
                  '  label: \'Profile completion\',\n'
                  '  showPercentage: true,\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppProgressBar(
                    value: 0.75,
                    label: 'Profile completion',
                    showPercentage: true,
                  ),
                  const VSpace.lg(),
                  const AppProgressBar(
                    value: 0.4,
                    label: 'Upload progress',
                    showPercentage: true,
                  ),
                  const VSpace.lg(),
                  AppProgressBar(
                    value: 1.0,
                    label: 'Completed',
                    showPercentage: true,
                    color: colors.success,
                  ),
                  const VSpace.lg(),
                  AppProgressBar(
                    value: 0.15,
                    label: 'Low battery',
                    showPercentage: true,
                    color: colors.error,
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppProgressBar',
              description: 'Indeterminate when value is omitted.',
              code: 'const AppProgressBar(\n'
                  '  label: \'Loading data...\',\n'
                  ')',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppProgressBar(label: 'Loading data...'),
                  VSpace.lg(),
                  AppProgressBar(),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppProgressBar',
              description: 'Track thickness via height.',
              code: 'AppProgressBar(\n'
                  '  value: 0.6,\n'
                  '  height: 8,\n'
                  '  label: \'Thick bar\',\n'
                  ')',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppProgressBar(
                    value: 0.6,
                    height: 8,
                    label: 'Thick bar',
                  ),
                  VSpace.lg(),
                  AppProgressBar(
                    value: 0.8,
                    height: 2,
                    label: 'Thin bar',
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppSnackBar',
              description: 'Material snackbar variants and actions.',
              code: 'AppSnackBar.show(\n'
                  '  context,\n'
                  '  message: \'Hello\',\n'
                  '  variant: AppSnackBarVariant.info,\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppText.bodySmall(
                    'Tap buttons to show snackbar:',
                    color: colors.textSecondary,
                  ),
                  const VSpace.md(),
                  Wrap(
                    spacing: spacing.sm,
                    runSpacing: spacing.sm,
                    children: [
                      AppButton.primary(
                        text: 'Info',
                        size: AppButtonSize.small,
                        leadingIcon: Icons.info_outline,
                        onPressed: () => AppSnackBar.show(
                          context,
                          message: 'This is an informational message',
                          variant: AppSnackBarVariant.info,
                        ),
                      ),
                      AppButton(
                        text: 'Success',
                        variant: AppButtonVariant.secondary,
                        size: AppButtonSize.small,
                        leadingIcon: Icons.check_circle_outline,
                        onPressed: () => AppSnackBar.show(
                          context,
                          message: 'Operation completed successfully!',
                          variant: AppSnackBarVariant.success,
                        ),
                      ),
                      AppButton.outline(
                        text: 'Warning',
                        size: AppButtonSize.small,
                        leadingIcon: Icons.warning_amber,
                        onPressed: () => AppSnackBar.show(
                          context,
                          message: 'Please check your input',
                          variant: AppSnackBarVariant.warning,
                        ),
                      ),
                      AppButton.danger(
                        text: 'Error',
                        size: AppButtonSize.small,
                        leadingIcon: Icons.error_outline,
                        onPressed: () => AppSnackBar.show(
                          context,
                          message: 'Something went wrong!',
                          variant: AppSnackBarVariant.error,
                        ),
                      ),
                    ],
                  ),
                  const VSpace.lg(),
                  AppButton.outline(
                    text: 'Snackbar with Action',
                    isFullWidth: true,
                    onPressed: () => AppSnackBar.show(
                      context,
                      message: 'Item deleted',
                      variant: AppSnackBarVariant.error,
                      action: SnackBarAction(
                        label: 'UNDO',
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const VSpace.xxl(),
          ],
        ),
      ),
    );
  }
}
