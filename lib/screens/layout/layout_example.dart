import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class LayoutExample extends StatelessWidget {
  const LayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Scaffold(
      appBar: const AppAppBar(
        title: 'Layout',
        actions: [
          AppIconButton(icon: Icons.info_outline, tooltip: 'Info'),
        ],
      ),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'VSpace',
              description: 'Fixed vertical gaps from the spacing scale.',
              code: '''
Column(
  children: [
    Text('A'),
    VSpace.md(),
    Text('B'),
  ],
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _spacingDemo(context, 'xxs', const VSpace.xxs()),
                  _spacingDemo(context, 'xs', const VSpace.xs()),
                  _spacingDemo(context, 'sm', const VSpace.sm()),
                  _spacingDemo(context, 'md', const VSpace.md()),
                  _spacingDemo(context, 'lg', const VSpace.lg()),
                  _spacingDemo(context, 'xl', const VSpace.xl()),
                  _spacingDemo(context, 'xxl', const VSpace.xxl()),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'HSpace',
              description: 'Fixed horizontal gaps between siblings.',
              code: '''
Row(
  children: [
    Text('A'),
    HSpace.md(),
    Text('B'),
  ],
)''',
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _hSpacingChip(context, 'xxs'),
                    const HSpace.xxs(),
                    _hSpacingChip(context, 'xs'),
                    const HSpace.xs(),
                    _hSpacingChip(context, 'sm'),
                    const HSpace.sm(),
                    _hSpacingChip(context, 'md'),
                    const HSpace.md(),
                    _hSpacingChip(context, 'lg'),
                    const HSpace.lg(),
                    _hSpacingChip(context, 'xl'),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'SafeContent',
              description:
                  'Responsive horizontal padding and max width for body content.',
              code: '''
SafeContent(
  child: ListView(children: [...]),
)''',
              child: AppCard(
                child: AppText.bodyMedium(
                  'The SafeContent widget wraps children with responsive horizontal '
                  'padding and constrains max width. It adapts across xs/sm/md/lg/xl '
                  'breakpoints automatically.',
                  color: colors.textSecondary,
                ),
              ),
            ),
            WidgetShowcase(
              title: 'Responsive',
              description: 'Breakpoint queries and per-breakpoint values.',
              code: '''
Responsive.value<int>(context, xs: 1, md: 2, lg: 3)
Responsive.isMobile(context)''',
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _breakpointRow(
                      context,
                      'Screen Size',
                      Responsive.screenSize(context).name.toUpperCase(),
                    ),
                    const VSpace.sm(),
                    _breakpointRow(
                      context,
                      'Is Mobile',
                      Responsive.isMobile(context).toString(),
                    ),
                    _breakpointRow(
                      context,
                      'Is Tablet',
                      Responsive.isTablet(context).toString(),
                    ),
                    _breakpointRow(
                      context,
                      'Is Desktop',
                      Responsive.isDesktop(context).toString(),
                    ),
                    const VSpace.sm(),
                    _breakpointRow(
                      context,
                      'Columns',
                      Responsive.value<int>(context, xs: 1, md: 2, lg: 3)
                          .toString(),
                    ),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'AppAppBar',
              description: 'Themed app bar with title, leading, and actions.',
              code: '''
const AppAppBar(
  title: 'Layout',
  actions: [AppIconButton(icon: Icons.info_outline)],
)''',
              child: AppCard(
                child: AppText.bodyMedium(
                  'The AppAppBar at the top of this screen is themed automatically. '
                  'It supports custom title widget, actions, leading widget, and '
                  'center alignment.',
                  color: colors.textSecondary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _spacingDemo(BuildContext context, String name, Widget space) {
    final colors = context.appColors;
    return Padding(
      padding: EdgeInsets.only(bottom: context.appSpacing.xs),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            child: AppText.labelSmall(name, color: colors.textSecondary),
          ),
          Expanded(
            child: Container(
              color: colors.primary.withValues(alpha: 0.15),
              child: space,
            ),
          ),
        ],
      ),
    );
  }

  Widget _hSpacingChip(BuildContext context, String name) {
    final colors = context.appColors;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: context.appSpacing.sm,
        vertical: context.appSpacing.xs,
      ),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(context.appTheme.radius.sm),
      ),
      child: AppText.labelSmall(name, color: colors.primary),
    );
  }

  Widget _breakpointRow(BuildContext context, String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.appSpacing.xxs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.bodyMedium(label),
          AppText.labelLarge(value, color: context.appColors.primary),
        ],
      ),
    );
  }
}
