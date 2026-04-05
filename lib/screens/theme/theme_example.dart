import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class ThemeExample extends StatelessWidget {
  const ThemeExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;
    final sizing = context.appSizing;
    final durations = context.appDurations;

    return Scaffold(
      appBar: const AppAppBar(title: 'Theme Tokens'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppColors',
              description:
                  'Semantic palette from ThemeExtension / AppTheme (light & dark).',
              code: '''
final colors = context.appColors;
colors.primary
colors.textSecondary''',
              child: _colorGrid(context),
            ),
            WidgetShowcase(
              title: 'AppSpacing',
              description: 'Consistent padding and gap scale (logical pixels).',
              code: '''
final spacing = context.appSpacing;
padding: EdgeInsets.all(spacing.lg)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _tokenRow(context, 'xxs', '${spacing.xxs}'),
                  _tokenRow(context, 'xs', '${spacing.xs}'),
                  _tokenRow(context, 'sm', '${spacing.sm}'),
                  _tokenRow(context, 'md', '${spacing.md}'),
                  _tokenRow(context, 'lg', '${spacing.lg}'),
                  _tokenRow(context, 'xl', '${spacing.xl}'),
                  _tokenRow(context, 'xxl', '${spacing.xxl}'),
                  _tokenRow(context, 'xxxl', '${spacing.xxxl}'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppSizing',
              description: 'Component dimensions: buttons, icons, avatars, limits.',
              code: '''
final sizing = context.appSizing;
sizing.buttonHeightMd
sizing.minTapTarget''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _tokenRow(context, 'buttonHeightSm', '${sizing.buttonHeightSm}'),
                  _tokenRow(context, 'buttonHeightMd', '${sizing.buttonHeightMd}'),
                  _tokenRow(context, 'buttonHeightLg', '${sizing.buttonHeightLg}'),
                  _tokenRow(context, 'iconXs', '${sizing.iconXs}'),
                  _tokenRow(context, 'iconSm', '${sizing.iconSm}'),
                  _tokenRow(context, 'iconMd', '${sizing.iconMd}'),
                  _tokenRow(context, 'iconLg', '${sizing.iconLg}'),
                  _tokenRow(context, 'avatarSm', '${sizing.avatarSm}'),
                  _tokenRow(context, 'avatarMd', '${sizing.avatarMd}'),
                  _tokenRow(context, 'avatarLg', '${sizing.avatarLg}'),
                  _tokenRow(context, 'avatarXl', '${sizing.avatarXl}'),
                  _tokenRow(context, 'minTapTarget', '${sizing.minTapTarget}'),
                  _tokenRow(context, 'dialogMaxWidth', '${sizing.dialogMaxWidth}'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppDurations',
              description: 'Standard animation durations from the theme.',
              code: '''
final d = context.appDurations;
Duration(milliseconds: d.normal.inMilliseconds)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _tokenRow(context, 'fast', '${durations.fast.inMilliseconds}ms'),
                  _tokenRow(
                    context,
                    'normal',
                    '${durations.normal.inMilliseconds}ms',
                  ),
                  _tokenRow(context, 'slow', '${durations.slow.inMilliseconds}ms'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppRadius',
              description: 'Corner radii; visual preview with primary tint.',
              code: '''
BorderRadius.circular(context.appTheme.radius.md)''',
              child: _radiusRow(context),
            ),
            WidgetShowcase(
              title: 'AppTheme',
              description: 'Load full token sets from JSON for white-label apps.',
              code: '''
AppTheme.fromJson(json)
ThemeData(extensions: [appTheme])''',
              child: AppCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppText.titleSmall('White-label ready'),
                    const VSpace.xs(),
                    AppText.bodyMedium(
                      'All tokens can be loaded from JSON via AppTheme.fromJson(). '
                      'Use this for remote config, API-driven theming, or '
                      'multi-brand apps.',
                      color: colors.textSecondary,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _colorGrid(BuildContext context) {
    final colors = context.appColors;
    final entries = <MapEntry<String, Color>>[
      MapEntry('primary', colors.primary),
      MapEntry('secondary', colors.secondary),
      MapEntry('success', colors.success),
      MapEntry('warning', colors.warning),
      MapEntry('error', colors.error),
      MapEntry('info', colors.info),
      MapEntry('surface', colors.surface),
      MapEntry('background', colors.background),
      MapEntry('textPrimary', colors.textPrimary),
      MapEntry('textSecondary', colors.textSecondary),
      MapEntry('border', colors.border),
      MapEntry('divider', colors.divider),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children:
          entries.map((e) => _colorChip(context, e.key, e.value)).toList(),
    );
  }

  Widget _colorChip(BuildContext context, String name, Color color) {
    final textColor =
        color.computeLuminance() > 0.5 ? Colors.black87 : Colors.white;
    return Container(
      width: 100,
      padding: EdgeInsets.all(context.appSpacing.sm),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(context.appTheme.radius.md),
        border: Border.all(
          color: context.appColors.border.withValues(alpha: 0.3),
        ),
      ),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 10, color: textColor, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _tokenRow(BuildContext context, String name, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.appSpacing.xxs),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppText.bodyMedium(name),
          AppText.labelLarge(value, color: context.appColors.primary),
        ],
      ),
    );
  }

  Widget _radiusRow(BuildContext context) {
    final radius = context.appTheme.radius;
    final items = <MapEntry<String, double>>[
      MapEntry('xs', radius.xs),
      MapEntry('sm', radius.sm),
      MapEntry('md', radius.md),
      MapEntry('lg', radius.lg),
      MapEntry('xl', radius.xl),
      MapEntry('full', radius.full),
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: items.map((e) {
        final r = e.value > 100 ? 50.0 : e.value;
        return Column(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: context.appColors.primary.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(r),
                border: Border.all(color: context.appColors.primary),
              ),
            ),
            const VSpace.xxs(),
            AppText.labelSmall(
              '${e.key} (${e.value.toInt()})',
              color: context.appColors.textSecondary,
            ),
          ],
        );
      }).toList(),
    );
  }
}
