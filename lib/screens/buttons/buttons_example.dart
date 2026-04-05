import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class ButtonsExample extends StatefulWidget {
  const ButtonsExample({super.key});

  @override
  State<ButtonsExample> createState() => _ButtonsExampleState();
}

class _ButtonsExampleState extends State<ButtonsExample> {
  bool _isLoading = false;

  void _simulateLoading() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: const AppAppBar(title: 'Buttons'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppButton',
              description:
                  'Variants, sizes, icons, full width, loading, and disabled.',
              code: 'AppButton.primary(\n'
                  '  text: "Save",\n'
                  '  size: AppButtonSize.medium,\n'
                  '  isFullWidth: false,\n'
                  '  isLoading: false,\n'
                  '  onPressed: () {},\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppButton.primary(text: 'Primary', onPressed: () {}),
                  const VSpace.sm(),
                  AppButton.secondary(text: 'Secondary', onPressed: () {}),
                  const VSpace.sm(),
                  AppButton.outline(text: 'Outline', onPressed: () {}),
                  const VSpace.sm(),
                  AppButton.ghost(text: 'Ghost', onPressed: () {}),
                  const VSpace.sm(),
                  AppButton.danger(text: 'Danger', onPressed: () {}),
                  const VSpace.xl(),
                  AppButton.primary(
                    text: 'Small',
                    size: AppButtonSize.small,
                    onPressed: () {},
                  ),
                  const VSpace.sm(),
                  AppButton.primary(
                    text: 'Medium (default)',
                    size: AppButtonSize.medium,
                    onPressed: () {},
                  ),
                  const VSpace.sm(),
                  AppButton.primary(
                    text: 'Large',
                    size: AppButtonSize.large,
                    onPressed: () {},
                  ),
                  const VSpace.xl(),
                  AppButton.primary(
                    text: 'Send',
                    leadingIcon: Icons.send,
                    onPressed: () {},
                  ),
                  const VSpace.sm(),
                  AppButton.outline(
                    text: 'Download',
                    trailingIcon: Icons.download,
                    onPressed: () {},
                  ),
                  const VSpace.xl(),
                  AppButton.primary(
                    text: 'Full Width Button',
                    isFullWidth: true,
                    onPressed: () {},
                  ),
                  const VSpace.xl(),
                  AppButton.primary(
                    text: 'Tap to Load',
                    isLoading: _isLoading,
                    onPressed: _simulateLoading,
                  ),
                  const VSpace.xl(),
                  const AppButton.primary(text: 'Disabled Button'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppIconButton',
              description: 'Icon-only actions with optional styling.',
              code: 'AppIconButton(\n'
                  '  icon: Icons.favorite,\n'
                  '  tooltip: "Favorite",\n'
                  '  onPressed: () {},\n'
                  ')',
              child: Wrap(
                spacing: spacing.md,
                children: [
                  AppIconButton(
                    icon: Icons.favorite,
                    tooltip: 'Favorite',
                    onPressed: () {},
                  ),
                  AppIconButton(
                    icon: Icons.share,
                    tooltip: 'Share',
                    onPressed: () {},
                  ),
                  AppIconButton(
                    icon: Icons.more_vert,
                    tooltip: 'More',
                    onPressed: () {},
                  ),
                  AppIconButton(
                    icon: Icons.settings,
                    tooltip: 'Settings',
                    backgroundColor: context.appColors.primaryLight,
                    color: context.appColors.primary,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppTextButton',
              description: 'Low-emphasis text actions, with optional icon.',
              code: 'AppTextButton(\n'
                  '  text: "Continue",\n'
                  '  icon: Icons.arrow_forward,\n'
                  '  onPressed: () {},\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppTextButton(text: 'Text Button', onPressed: () {}),
                  const VSpace.sm(),
                  AppTextButton(
                    text: 'With Icon',
                    icon: Icons.arrow_forward,
                    onPressed: () {},
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
