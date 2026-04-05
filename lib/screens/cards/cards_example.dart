import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class CardsExample extends StatelessWidget {
  const CardsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Scaffold(
      appBar: const AppAppBar(title: 'Cards'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppCard',
              description: 'Default surface with semantic label and content.',
              code: 'AppCard(\n'
                  '  semanticLabel: \'Welcome card\',\n'
                  '  child: Column(\n'
                  '    crossAxisAlignment: CrossAxisAlignment.start,\n'
                  '    children: [\n'
                  '      const AppText.titleMedium(\'Welcome Back\'),\n'
                  '      AppText.bodyMedium(\'...\', color: colors.textSecondary),\n'
                  '    ],\n'
                  '  ),\n'
                  '),',
              child: AppCard(
                semanticLabel: 'Welcome card',
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText.titleMedium('Welcome Back'),
                    const VSpace.xs(),
                    AppText.bodyMedium(
                      'Your account is all set up and ready to go.',
                      color: colors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'AppCard',
              description: 'Tappable row layout with avatar and chevron.',
              code: 'AppCard(\n'
                  '  semanticLabel: \'Profile settings\',\n'
                  '  onTap: () {},\n'
                  '  child: Row(children: [\n'
                  '    const AppAvatar(name: \'John Doe\', size: AvatarSize.medium),\n'
                  '    Expanded(child: Column(/* title, subtitle */)),\n'
                  '    Icon(Icons.chevron_right),\n'
                  '  ]),\n'
                  '),',
              child: AppCard(
                semanticLabel: 'Profile settings',
                onTap: () {},
                child: Row(
                  children: [
                    const AppAvatar(name: 'John Doe', size: AvatarSize.medium),
                    const HSpace.md(),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const AppText.titleSmall('John Doe'),
                          AppText.bodySmall(
                            'john@example.com',
                            color: colors.textSecondary,
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, color: colors.textSecondary),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'AppCard',
              description: 'Elevated look with shadow instead of border.',
              code: 'AppCard(\n'
                  '  showShadow: true,\n'
                  '  showBorder: false,\n'
                  '  child: Column(\n'
                  '    crossAxisAlignment: CrossAxisAlignment.start,\n'
                  '    children: [\n'
                  '      const AppText.titleMedium(\'Elevated Card\'),\n'
                  '      AppText.bodyMedium(\'...\', color: colors.textSecondary),\n'
                  '    ],\n'
                  '  ),\n'
                  '),',
              child: AppCard(
                showShadow: true,
                showBorder: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText.titleMedium('Elevated Card'),
                    const VSpace.xs(),
                    AppText.bodyMedium(
                      'This card uses shadow instead of border.',
                      color: colors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'InfoCard',
              description: 'Metric tiles with icon, optional subtitle, and tap.',
              code: 'InfoCard(\n'
                  '  icon: Icons.account_balance_wallet,\n'
                  '  title: \'Balance\',\n'
                  '  value: \'\\u002412,345.67\',\n'
                  '  iconColor: colors.primary,\n'
                  '),',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  InfoCard(
                    icon: Icons.account_balance_wallet,
                    title: 'Balance',
                    value: '\$12,345.67',
                    iconColor: colors.primary,
                  ),
                  const VSpace.sm(),
                  InfoCard(
                    icon: Icons.trending_up,
                    title: 'Revenue',
                    value: '\$8,920.00',
                    subtitle: '+12.5% this month',
                    iconColor: colors.success,
                    onTap: () {},
                  ),
                  const VSpace.sm(),
                  InfoCard(
                    icon: Icons.people_outline,
                    title: 'Total Users',
                    value: '1,234',
                    iconColor: colors.info,
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'ListDetailCard',
              description: 'List rows with leading badge, text stack, and trailing.',
              code: 'ListDetailCard(\n'
                  '  leading: Icon(Icons.arrow_downward, color: colors.success),\n'
                  '  leadingBackgroundColor: colors.success,\n'
                  '  title: \'Salary Deposit\',\n'
                  '  subtitle: \'Monthly payroll\',\n'
                  '  trailing: Text(\'+\$5,000.00\', style: ...),\n'
                  '),',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ListDetailCard(
                    leading: Icon(Icons.arrow_downward, color: colors.success),
                    leadingBackgroundColor: colors.success,
                    title: 'Salary Deposit',
                    subtitle: 'Monthly payroll',
                    trailing: Text(
                      '+\$5,000.00',
                      style: context.bodyMediumStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.success,
                      ),
                    ),
                  ),
                  const VSpace.sm(),
                  ListDetailCard(
                    leading: Icon(Icons.arrow_upward, color: colors.error),
                    leadingBackgroundColor: colors.error,
                    title: 'Netflix',
                    subtitle: 'Subscription payment',
                    trailing: Text(
                      '-\$15.99',
                      style: context.bodyMediumStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.error,
                      ),
                    ),
                  ),
                  const VSpace.sm(),
                  ListDetailCard(
                    leading: Icon(Icons.swap_horiz, color: colors.info),
                    leadingBackgroundColor: colors.info,
                    title: 'Transfer to Alice',
                    subtitle: 'Savings split',
                    caption: 'Pending',
                    trailing: Text(
                      '\$200.00',
                      style: context.bodyMediumStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.info,
                      ),
                    ),
                  ),
                  const VSpace.sm(),
                  ListDetailCard(
                    leading: Icon(Icons.replay, color: colors.warning),
                    leadingBackgroundColor: colors.warning,
                    title: 'Amazon Refund',
                    subtitle: 'Order #12345',
                    trailing: Text(
                      '+\$49.99',
                      style: context.bodyMediumStyle.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colors.warning,
                      ),
                    ),
                    onTap: () {},
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
