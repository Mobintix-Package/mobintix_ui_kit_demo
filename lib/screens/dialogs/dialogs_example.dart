import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class DialogsExample extends StatelessWidget {
  const DialogsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    return Scaffold(
      appBar: const AppAppBar(title: 'Dialogs & Sheets'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'showAppDialog',
              description: 'Title, message, and primary/secondary actions.',
              code: 'showAppDialog(\n'
                  '  context: context,\n'
                  '  title: \'Welcome!\',\n'
                  '  message: \'...\',\n'
                  '  primaryActionLabel: \'Get Started\',\n'
                  '  onPrimaryAction: () {},\n'
                  ')',
              child: AppButton.primary(
                text: 'Show Dialog',
                leadingIcon: Icons.open_in_new,
                onPressed: () => _showBasicDialog(context),
              ),
            ),
            WidgetShowcase(
              title: 'showConfirmDialog',
              description: 'Yes/no flow; optional dangerous styling.',
              code: 'final ok = await showConfirmDialog(\n'
                  '  context: context,\n'
                  '  title: \'Save?\',\n'
                  '  message: \'...\',\n'
                  '  confirmLabel: \'Save\',\n'
                  '  cancelLabel: \'Discard\',\n'
                  ');',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppButton.outline(
                    text: 'Show Confirmation',
                    leadingIcon: Icons.help_outline,
                    onPressed: () => _showConfirmation(context),
                  ),
                  const VSpace.sm(),
                  AppButton.danger(
                    text: 'Dangerous Action',
                    leadingIcon: Icons.delete_outline,
                    onPressed: () => _showDangerConfirmation(context),
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'showAppBottomSheet',
              description: 'Modal sheet with title and custom child.',
              code: 'showAppBottomSheet(\n'
                  '  context: context,\n'
                  '  title: \'Select Option\',\n'
                  '  child: Padding(\n'
                  '    padding: EdgeInsets.all(16),\n'
                  '    child: AppText.bodyMedium(\'...\'),\n'
                  '  ),\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppButton.secondary(
                    text: 'Show Bottom Sheet',
                    leadingIcon: Icons.vertical_align_bottom,
                    onPressed: () => _showSheet(context),
                  ),
                  const VSpace.sm(),
                  AppButton.outline(
                    text: 'Sheet with Options',
                    leadingIcon: Icons.list,
                    onPressed: () => _showOptionsSheet(context),
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

  void _showBasicDialog(BuildContext context) {
    showAppDialog(
      context: context,
      title: 'Welcome!',
      message:
          'Your account has been created successfully. You can now explore all the features.',
      primaryActionLabel: 'Get Started',
      onPrimaryAction: () {},
      secondaryActionLabel: 'Later',
    );
  }

  void _showConfirmation(BuildContext context) async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Save Changes?',
      message:
          'You have unsaved changes. Would you like to save them before leaving?',
      confirmLabel: 'Save',
      cancelLabel: 'Discard',
    );
    if (context.mounted && confirmed) {
      showAppToast(context, message: 'Changes saved!', type: ToastType.success);
    }
  }

  void _showDangerConfirmation(BuildContext context) async {
    final confirmed = await showConfirmDialog(
      context: context,
      title: 'Delete Account?',
      message:
          'This action is permanent and cannot be undone. All your data will be lost.',
      confirmLabel: 'Delete',
      cancelLabel: 'Cancel',
      isDangerous: true,
    );
    if (context.mounted && confirmed) {
      showAppToast(context, message: 'Account deleted', type: ToastType.error);
    }
  }

  void _showSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      title: 'Select Option',
      child: Padding(
        padding: EdgeInsets.all(context.appSpacing.lg),
        child: const AppText.bodyMedium(
          'Bottom sheets adapt to the screen size.',
        ),
      ),
    );
  }

  void _showOptionsSheet(BuildContext context) {
    showAppBottomSheet(
      context: context,
      title: 'Actions',
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          BottomSheetOption(
            icon: Icons.edit,
            label: 'Edit',
            subtitle: 'Modify this item',
            onTap: () {},
          ),
          BottomSheetOption(
            icon: Icons.copy,
            label: 'Duplicate',
            onTap: () {},
          ),
          BottomSheetOption(
            icon: Icons.share,
            label: 'Share',
            onTap: () {},
          ),
          BottomSheetOption(
            icon: Icons.delete,
            label: 'Delete',
            isDestructive: true,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
