import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class FeedbackExample extends StatelessWidget {
  const FeedbackExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Scaffold(
      appBar: const AppAppBar(title: 'Feedback'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'LoadingIndicator',
              description: 'Circular spinner; optional size.',
              code: 'const LoadingIndicator()\n'
                  'LoadingIndicator(size: 32)\n'
                  'LoadingIndicator(size: 48)',
              child: const Row(
                children: [
                  LoadingIndicator(),
                  HSpace.lg(),
                  LoadingIndicator(size: 32),
                  HSpace.lg(),
                  LoadingIndicator(size: 48),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'LoadingOverlay',
              description: 'Blocks interaction with optional message.',
              code: 'LoadingOverlay(\n'
                  '  message: \'Processing...\',\n'
                  ')',
              child: SizedBox(
                height: 200,
                child: Stack(
                  children: [
                    AppCard(
                      child: Center(
                        child: AppText.bodyMedium(
                          'Content behind the overlay',
                          color: context.appColors.textSecondary,
                        ),
                      ),
                    ),
                    const LoadingOverlay(message: 'Processing...'),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'EmptyState',
              description: 'Placeholder when there is no content.',
              code: 'EmptyState(\n'
                  '  icon: Icons.inbox_outlined,\n'
                  '  title: \'No Messages\',\n'
                  '  description: \'...\',\n'
                  '  actionLabel: \'Compose\',\n'
                  ')',
              child: const EmptyState(
                icon: Icons.inbox_outlined,
                title: 'No Messages',
                description:
                    'You don\'t have any messages yet. Start a conversation!',
                actionLabel: 'Compose',
              ),
            ),
            WidgetShowcase(
              title: 'ErrorState',
              description: 'Error message with optional retry action.',
              code: 'ErrorState(\n'
                  '  title: \'Connection Lost\',\n'
                  '  description: \'...\',\n'
                  '  actionLabel: \'Retry\',\n'
                  '  onAction: () {},\n'
                  ')',
              child: ErrorState(
                title: 'Connection Lost',
                description:
                    'Please check your internet connection and try again.',
                actionLabel: 'Retry',
                onAction: () {},
              ),
            ),
            WidgetShowcase(
              title: 'showAppToast',
              description: 'Brief messages; types and optional action.',
              code: 'showAppToast(\n'
                  '  context,\n'
                  '  message: \'Hello\',\n'
                  '  type: ToastType.info,\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Wrap(
                    spacing: spacing.sm,
                    runSpacing: spacing.sm,
                    children: [
                      AppButton.primary(
                        text: 'Info',
                        size: AppButtonSize.small,
                        onPressed: () => showAppToast(
                          context,
                          message: 'This is an info message',
                          type: ToastType.info,
                        ),
                      ),
                      AppButton(
                        text: 'Success',
                        size: AppButtonSize.small,
                        variant: AppButtonVariant.secondary,
                        onPressed: () => showAppToast(
                          context,
                          message: 'Operation completed successfully!',
                          type: ToastType.success,
                        ),
                      ),
                      AppButton.outline(
                        text: 'Warning',
                        size: AppButtonSize.small,
                        onPressed: () => showAppToast(
                          context,
                          message: 'Low disk space warning',
                          type: ToastType.warning,
                        ),
                      ),
                      AppButton.danger(
                        text: 'Error',
                        size: AppButtonSize.small,
                        onPressed: () => showAppToast(
                          context,
                          message: 'Something went wrong!',
                          type: ToastType.error,
                        ),
                      ),
                    ],
                  ),
                  const VSpace.md(),
                  AppButton.outline(
                    text: 'Toast with Action',
                    onPressed: () => showAppToast(
                      context,
                      message: 'Item deleted',
                      type: ToastType.info,
                      actionLabel: 'Undo',
                      onAction: () {},
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
