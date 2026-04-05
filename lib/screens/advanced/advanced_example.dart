import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class AdvancedExample extends StatefulWidget {
  const AdvancedExample({super.key});

  @override
  State<AdvancedExample> createState() => _AdvancedExampleState();
}

class _AdvancedExampleState extends State<AdvancedExample> {
  int _stepperIndex = 1;
  int _counter = 42;
  bool _bannerVisible = true;
  bool _warningVisible = true;

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Scaffold(
      appBar: const AppAppBar(title: 'Advanced Components'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppStepper',
              description: 'Multi-step flow with labels.',
              code: '''AppStepper(
  currentStep: index,
  steps: const [
    AppStepItem(label: 'Details'),
    AppStepItem(label: 'Payment'),
  ],
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppStepper(
                    currentStep: _stepperIndex,
                    steps: const [
                      AppStepItem(label: 'Details'),
                      AppStepItem(label: 'Payment'),
                      AppStepItem(label: 'Review'),
                      AppStepItem(label: 'Done'),
                    ],
                  ),
                  const VSpace.md(),
                  Row(
                    children: [
                      AppButton.outline(
                        text: 'Back',
                        size: AppButtonSize.small,
                        onPressed: _stepperIndex > 0
                            ? () => setState(() => _stepperIndex--)
                            : null,
                      ),
                      SizedBox(width: spacing.sm),
                      AppButton.primary(
                        text: 'Next',
                        size: AppButtonSize.small,
                        onPressed: _stepperIndex < 3
                            ? () => setState(() => _stepperIndex++)
                            : null,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppBanner',
              description: 'Info, success, warning, and error variants.',
              code: '''AppBanner(
  message: 'Your message',
  variant: AppBannerVariant.info,
  onDismiss: () { },
  action: TextButton(...),
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_bannerVisible)
                    AppBanner(
                      message:
                          'Your trial expires in 3 days. Upgrade now to keep access.',
                      variant: AppBannerVariant.info,
                      onDismiss: () => setState(() => _bannerVisible = false),
                      action: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'Upgrade',
                          style: context.labelLargeStyle.copyWith(
                            color: colors.info,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  if (_bannerVisible) const VSpace.sm(),
                  const AppBanner(
                    message: 'Payment processed successfully!',
                    variant: AppBannerVariant.success,
                  ),
                  const VSpace.sm(),
                  if (_warningVisible)
                    AppBanner(
                      message: 'Your password will expire soon.',
                      variant: AppBannerVariant.warning,
                      onDismiss: () =>
                          setState(() => _warningVisible = false),
                    ),
                  if (_warningVisible) const VSpace.sm(),
                  const AppBanner(
                    message: 'Unable to connect to server.',
                    variant: AppBannerVariant.error,
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AnimatedCounter',
              description: 'Animated number with optional prefix.',
              code: '''AnimatedCounter(
  value: count,
  prefix: r'\$',
)''',
              child: Row(
                children: [
                  AnimatedCounter(value: _counter, prefix: r'$'),
                  const Spacer(),
                  AppButton.outline(
                    text: '-10',
                    size: AppButtonSize.small,
                    onPressed: () => setState(() => _counter -= 10),
                  ),
                  SizedBox(width: spacing.sm),
                  AppButton.primary(
                    text: '+10',
                    size: AppButtonSize.small,
                    onPressed: () => setState(() => _counter += 10),
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppStatusIndicator',
              description: 'Preset and custom status dots.',
              code: '''AppStatusIndicator(
  status: AppStatus.online,
  showLabel: true,
)''',
              child: Wrap(
                spacing: spacing.lg,
                runSpacing: spacing.sm,
                children: const [
                  AppStatusIndicator(
                    status: AppStatus.online,
                    showLabel: true,
                  ),
                  AppStatusIndicator(
                    status: AppStatus.away,
                    showLabel: true,
                  ),
                  AppStatusIndicator(
                    status: AppStatus.busy,
                    showLabel: true,
                  ),
                  AppStatusIndicator(
                    status: AppStatus.offline,
                    showLabel: true,
                  ),
                  AppStatusIndicator.custom(
                    customColor: Colors.purple,
                    customLabel: 'In meeting',
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppCountdownTimer',
              description: 'Countdown from a duration.',
              code: '''const AppCountdownTimer(
  duration: Duration(minutes: 2, seconds: 30),
)''',
              child: Row(
                children: [
                  const AppCountdownTimer(
                    duration: Duration(minutes: 2, seconds: 30),
                  ),
                  SizedBox(width: spacing.lg),
                  AppText.bodySmall(
                    'OTP expires in',
                    color: colors.textSecondary,
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppClipboardCopy',
              description: 'Copy-to-clipboard rows with label.',
              code: '''const AppClipboardCopy(
  text: 'REF-2026-ABCDEF',
  label: 'Referral Code',
)
const AppClipboardCopy(
  text: 'demo-clipboard-placeholder-not-a-secret',
  label: 'API Key',
)''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppClipboardCopy(
                    text: 'REF-2026-ABCDEF',
                    label: 'Referral Code',
                  ),
                  VSpace.md(),
                  AppClipboardCopy(
                    text: 'demo-clipboard-placeholder-not-a-secret',
                    label: 'API Key',
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppTooltip',
              description: 'Rich tooltip around any child.',
              code: '''AppTooltip(
  message: 'Add to favorites',
  child: AppIconButton(...),
)''',
              child: Wrap(
                spacing: spacing.md,
                children: [
                  AppTooltip(
                    message: 'Add to favorites',
                    child: AppIconButton(
                      icon: Icons.favorite_border,
                      tooltip: 'Favorite',
                      onPressed: () {},
                    ),
                  ),
                  AppTooltip(
                    message: 'Share this item with others',
                    child: AppIconButton(
                      icon: Icons.share,
                      tooltip: 'Share',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppPopupMenu',
              description: 'Icon menu with labeled items.',
              code: '''AppPopupMenu<String>(
  items: const [
    AppPopupMenuItem(value: 'edit', label: 'Edit', icon: Icons.edit),
  ],
  onSelected: (v) { },
  tooltip: 'Actions',
)''',
              child: Row(
                children: [
                  AppPopupMenu<String>(
                    items: const [
                      AppPopupMenuItem(
                        value: 'edit',
                        label: 'Edit',
                        icon: Icons.edit,
                      ),
                      AppPopupMenuItem(
                        value: 'duplicate',
                        label: 'Duplicate',
                        icon: Icons.copy,
                      ),
                      AppPopupMenuItem(
                        value: 'archive',
                        label: 'Archive',
                        icon: Icons.archive,
                      ),
                      AppPopupMenuItem(
                        value: 'delete',
                        label: 'Delete',
                        icon: Icons.delete,
                        destructive: true,
                      ),
                    ],
                    onSelected: (v) {
                      AppSnackBar.show(context, message: 'Selected: $v');
                    },
                    tooltip: 'Actions',
                  ),
                  SizedBox(width: spacing.md),
                  AppText.bodySmall(
                    'Tap the menu icon',
                    color: colors.textSecondary,
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'GradientContainer',
              description: 'Gradient background with custom colors.',
              code: '''GradientContainer(
  padding: EdgeInsets.all(16),
  child: Text('Welcome!'),
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GradientContainer(
                    padding: EdgeInsets.all(spacing.xl),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back!',
                          style: context.titleLargeStyle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: spacing.xs),
                        Text(
                          'Your dashboard is ready.',
                          style: context.bodyMediumStyle.copyWith(
                            color: Colors.white.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const VSpace.md(),
                  GradientContainer(
                    colors: [colors.secondary, colors.secondaryDark],
                    padding: EdgeInsets.all(spacing.lg),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.local_offer,
                          color: Colors.white,
                          size: 24,
                        ),
                        SizedBox(width: spacing.md),
                        Expanded(
                          child: Text(
                            '50% off — Limited time offer!',
                            style: context.bodyLargeStyle.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppExpansionTile',
              description: 'Expandable sections inside a card.',
              code: '''AppExpansionTile(
  title: 'What is this UI Kit?',
  children: [Text('...')],
)''',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(context.appRadius.lg),
                  border: Border.all(color: colors.border),
                ),
                child: Column(
                  children: [
                    AppExpansionTile(
                      title: 'What is this UI Kit?',
                      children: [
                        Text(
                          'A complete, themed, reusable Flutter design system '
                          'that you can drop into any project. All components '
                          'read styling from design tokens.',
                          style: context.bodyMediumStyle.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1, color: colors.divider),
                    AppExpansionTile(
                      title: 'How do I customize the theme?',
                      children: [
                        Text(
                          'Wrap your app with AppThemeScope and pass an '
                          'AppTheme instance. Use AppTheme.fromJson() to load '
                          'from a remote config or local JSON.',
                          style: context.bodyMediumStyle.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                    Divider(height: 1, color: colors.divider),
                    AppExpansionTile(
                      title: 'Is it production-ready?',
                      initiallyExpanded: true,
                      children: [
                        Text(
                          'Yes — all components have widget tests, support '
                          'light/dark themes, and follow accessibility best practices.',
                          style: context.bodyMediumStyle.copyWith(
                            color: colors.textSecondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'AppSkeleton',
              description: 'Placeholder shapes and paragraph lines.',
              code: '''const AppSkeleton.circle(size: 48)
const AppSkeleton(width: 160, height: 16)
const AppSkeletonParagraph(lines: 3)''',
              child: Container(
                padding: EdgeInsets.all(spacing.lg),
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(context.appRadius.lg),
                  border: Border.all(color: colors.border),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppSkeleton.circle(size: 48),
                    SizedBox(width: spacing.md),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppSkeleton(width: 160, height: 16),
                          SizedBox(height: spacing.sm),
                          const AppSkeleton(width: 100, height: 12),
                          SizedBox(height: spacing.md),
                          const AppSkeletonParagraph(lines: 3),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const VSpace.xxl(),
          ],
        ),
      ),
    );
  }
}
