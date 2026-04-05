import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class MediaExample extends StatelessWidget {
  const MediaExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: const AppAppBar(title: 'Media'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppImage',
              description: 'Network images with rounded corners.',
              code: '''AppImage(
  url: 'https://…',
  width: double.infinity,
  height: 200,
  borderRadius: BorderRadius.all(Radius.circular(12)),
  semanticLabel: 'Sample landscape',
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const AppImage(
                    url: 'https://picsum.photos/400/200',
                    width: double.infinity,
                    height: 200,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    semanticLabel: 'Sample landscape',
                  ),
                  const VSpace.md(),
                  Row(
                    children: [
                      const Expanded(
                        child: AppImage(
                          url: 'https://picsum.photos/200/200',
                          height: 120,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          semanticLabel: 'Thumbnail 1',
                        ),
                      ),
                      SizedBox(width: spacing.sm),
                      const Expanded(
                        child: AppImage(
                          url: 'https://picsum.photos/201/200',
                          height: 120,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          semanticLabel: 'Thumbnail 2',
                        ),
                      ),
                      SizedBox(width: spacing.sm),
                      const Expanded(
                        child: AppImage(
                          url: 'https://picsum.photos/202/200',
                          height: 120,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          semanticLabel: 'Thumbnail 3',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppImage',
              description: 'Placeholder and error states.',
              code: '''AppImage(
  url: invalidUrl, // or omit url
  width: 100,
  height: 100,
  borderRadius: BorderRadius.all(Radius.circular(8)),
  semanticLabel: 'Error state',
)''',
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      children: [
                        AppImage(
                          width: 100,
                          height: 100,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          semanticLabel: 'No URL placeholder',
                        ),
                        VSpace.xs(),
                        AppText.labelSmall('No URL'),
                      ],
                    ),
                  ),
                  SizedBox(width: spacing.sm),
                  const Expanded(
                    child: Column(
                      children: [
                        AppImage(
                          url: 'https://invalid-url-example.test/img.jpg',
                          width: 100,
                          height: 100,
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          semanticLabel: 'Error state',
                        ),
                        VSpace.xs(),
                        AppText.labelSmall('Error'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppAvatar',
              description: 'Initials from name at different sizes.',
              code: '''AppAvatar(
  name: 'Alice',
  size: AvatarSize.medium,
)''',
              child: const Wrap(
                spacing: 12,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AppAvatar(name: 'Alice', size: AvatarSize.small),
                  AppAvatar(name: 'Bob Smith', size: AvatarSize.medium),
                  AppAvatar(name: 'Charlie Brown', size: AvatarSize.large),
                  AppAvatar(name: 'Diana Prince', size: AvatarSize.xlarge),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppAvatar',
              description: 'Photo URL with optional border.',
              code: '''AppAvatar(
  imageUrl: 'https://…',
  name: 'User',
  size: AvatarSize.large,
  showBorder: true,
)''',
              child: const Wrap(
                spacing: 12,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  AppAvatar(
                    imageUrl: 'https://i.pravatar.cc/100?img=1',
                    name: 'User 1',
                    size: AvatarSize.medium,
                  ),
                  AppAvatar(
                    imageUrl: 'https://i.pravatar.cc/100?img=2',
                    name: 'User 2',
                    size: AvatarSize.large,
                    showBorder: true,
                  ),
                  AppAvatar(
                    imageUrl: 'https://i.pravatar.cc/100?img=3',
                    name: 'User 3',
                    size: AvatarSize.xlarge,
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'StatusAvatar',
              description: 'Avatar with online/offline indicator.',
              code: '''StatusAvatar(
  name: 'Online User',
  isOnline: true,
  size: AvatarSize.medium,
)''',
              child: const Wrap(
                spacing: 16,
                runSpacing: 12,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  StatusAvatar(
                    name: 'Online User',
                    isOnline: true,
                    size: AvatarSize.medium,
                  ),
                  StatusAvatar(
                    name: 'Offline User',
                    isOnline: false,
                    size: AvatarSize.medium,
                  ),
                  StatusAvatar(
                    imageUrl: 'https://i.pravatar.cc/100?img=4',
                    name: 'Active',
                    isOnline: true,
                    size: AvatarSize.large,
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
