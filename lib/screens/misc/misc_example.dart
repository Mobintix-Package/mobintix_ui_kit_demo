import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class MiscExample extends StatelessWidget {
  const MiscExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: const AppAppBar(title: 'Misc'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppBadge',
              description:
                  'Semantic variants, outlined style, sizes, and leading icons.',
              code: '''
AppBadge(
  text: 'Success',
  variant: BadgeVariant.success,
  icon: Icons.check_circle,
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      AppBadge(
                          text: 'Primary', variant: BadgeVariant.primary),
                      AppBadge(
                          text: 'Secondary',
                          variant: BadgeVariant.secondary),
                      AppBadge(text: 'Success', variant: BadgeVariant.success),
                      AppBadge(text: 'Warning', variant: BadgeVariant.warning),
                      AppBadge(text: 'Error', variant: BadgeVariant.error),
                      AppBadge(text: 'Info', variant: BadgeVariant.info),
                      AppBadge(text: 'Neutral', variant: BadgeVariant.neutral),
                    ],
                  ),
                  const VSpace.lg(),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      AppBadge(
                        text: 'Primary',
                        variant: BadgeVariant.primary,
                        outlined: true,
                      ),
                      AppBadge(
                        text: 'Success',
                        variant: BadgeVariant.success,
                        outlined: true,
                      ),
                      AppBadge(
                        text: 'Error',
                        variant: BadgeVariant.error,
                        outlined: true,
                      ),
                    ],
                  ),
                  const VSpace.lg(),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      AppBadge(text: 'Small', size: BadgeSize.small),
                      AppBadge(text: 'Medium', size: BadgeSize.medium),
                      AppBadge(text: 'Large', size: BadgeSize.large),
                    ],
                  ),
                  const VSpace.lg(),
                  const Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: [
                      AppBadge(
                        text: 'Active',
                        variant: BadgeVariant.success,
                        icon: Icons.check_circle,
                      ),
                      AppBadge(
                        text: 'Pending',
                        variant: BadgeVariant.warning,
                        icon: Icons.schedule,
                      ),
                      AppBadge(
                        text: 'Failed',
                        variant: BadgeVariant.error,
                        icon: Icons.cancel,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'NotificationBadge',
              description: 'Numeric cap, overflow label, or dot on any child.',
              code: '''
NotificationBadge(
  count: 3,
  child: AppIconButton(
    icon: Icons.notifications_outlined,
    onPressed: () {},
  ),
)''',
              child: Wrap(
                spacing: spacing.xl,
                runSpacing: spacing.md,
                children: [
                  NotificationBadge(
                    count: 3,
                    child: AppIconButton(
                      icon: Icons.notifications_outlined,
                      tooltip: 'Notifications',
                      onPressed: () {},
                    ),
                  ),
                  NotificationBadge(
                    count: 99,
                    child: AppIconButton(
                      icon: Icons.mail_outline,
                      tooltip: 'Messages',
                      onPressed: () {},
                    ),
                  ),
                  NotificationBadge(
                    count: 150,
                    child: AppIconButton(
                      icon: Icons.chat_bubble_outline,
                      tooltip: 'Chat',
                      onPressed: () {},
                    ),
                  ),
                  NotificationBadge(
                    showDot: true,
                    child: AppIconButton(
                      icon: Icons.person_outline,
                      tooltip: 'Profile',
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppDivider',
              description: 'Full-width horizontal rule with optional indents.',
              code: '''
const AppDivider()
const AppDivider(indent: 16, endIndent: 16)''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppText.bodySmall('Horizontal Divider'),
                  AppDivider(),
                  VSpace.sm(),
                  AppText.bodySmall('With Indent'),
                  AppDivider(indent: 16, endIndent: 16),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'DividerWithText',
              description: 'Centered label between horizontal lines.',
              code: '''
const DividerWithText(text: 'OR')''',
              child: const DividerWithText(text: 'OR'),
            ),
            WidgetShowcase(
              title: 'AppVerticalDivider',
              description: 'Vertical rule between row children.',
              code: '''
Row(
  children: [
    Text('Left'),
    AppVerticalDivider(),
    Text('Right'),
  ],
)''',
              child: SizedBox(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const AppText.bodyMedium('Left'),
                    const AppVerticalDivider(),
                    const AppText.bodyMedium('Right'),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'ShimmerLoading',
              description:
                  'Animated skeleton; ShimmerText, ShimmerListItem, and ShimmerCard build on it.',
              code: '''
ShimmerLoading(
  child: ShimmerBox(height: 40, width: double.infinity),
)''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ShimmerText(lines: 3),
                  VSpace.lg(),
                  ShimmerListItem(),
                  VSpace.sm(),
                  ShimmerListItem(),
                  VSpace.sm(),
                  ShimmerListItem(showAvatar: false, showSubtitle: false),
                  VSpace.lg(),
                  ShimmerCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
