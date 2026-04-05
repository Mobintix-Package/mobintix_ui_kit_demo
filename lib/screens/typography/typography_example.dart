import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class TypographyExample extends StatelessWidget {
  const TypographyExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Scaffold(
      appBar: const AppAppBar(title: 'Typography'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppText',
              description: 'Display styles — largest marketing-style type.',
              code: '''
const AppText.displayLarge('Display Large')
const AppText.displaySmall('Display Small')''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.displayLarge('Display Large'),
                  AppText('Display Medium', style: AppTextStyle.displayMedium),
                  AppText.displaySmall('Display Small'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppText',
              description: 'Headline styles for page and section headers.',
              code: '''
const AppText.headlineLarge('Headline Large')
const AppText.headlineMedium('Headline Medium')''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.headlineLarge('Headline Large'),
                  AppText.headlineMedium('Headline Medium'),
                  AppText.headlineSmall('Headline Small'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppText',
              description: 'Title styles for cards, lists, and dialogs.',
              code: '''
const AppText.titleLarge('Title Large')
const AppText.titleMedium('Title Medium')''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.titleLarge('Title Large'),
                  AppText.titleMedium('Title Medium'),
                  AppText.titleSmall('Title Small'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppText',
              description: 'Body styles for primary reading text.',
              code: '''
const AppText.bodyLarge('Body Large')
const AppText.bodyMedium('Body Medium')''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyLarge('Body Large — Main content text'),
                  AppText.bodyMedium('Body Medium — Default body text'),
                  AppText.bodySmall('Body Small — Secondary content'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppText',
              description: 'Label styles for buttons, chips, and captions.',
              code: '''
const AppText.labelLarge('Label Large')
const AppText('Label Medium', style: AppTextStyle.labelMedium)''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.labelLarge('Label Large'),
                  AppText('Label Medium', style: AppTextStyle.labelMedium),
                  AppText.labelSmall('Label Small'),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppText',
              description: 'Semantic and brand colors via the color parameter.',
              code: '''
AppText.bodyLarge('Success', color: colors.success)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyLarge('Primary color', color: colors.primary),
                  AppText.bodyLarge('Secondary color', color: colors.secondary),
                  AppText.bodyLarge('Success color', color: colors.success),
                  AppText.bodyLarge('Error color', color: colors.error),
                  AppText.bodyLarge('Warning color', color: colors.warning),
                  AppText.bodyLarge('Info color', color: colors.info),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppText',
              description: 'fontWeight, maxLines, and TextOverflow.',
              code: '''
const AppText.bodyMedium(
  'Long text…',
  maxLines: 2,
  overflow: TextOverflow.ellipsis,
)''',
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodyLarge(
                    'Bold text example',
                    fontWeight: FontWeight.w700,
                  ),
                  AppText.bodyMedium(
                    'This is a very long text that will be truncated after two '
                    'lines to demonstrate the maxLines and overflow properties '
                    'of the AppText widget in the UI Kit.',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
