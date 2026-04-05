import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class NavigationExample extends StatefulWidget {
  const NavigationExample({super.key});

  @override
  State<NavigationExample> createState() => _NavigationExampleState();
}

class _NavigationExampleState extends State<NavigationExample>
    with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 0;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Scaffold(
      appBar: const AppAppBar(title: 'Navigation'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppTabBar',
              description:
                  'Text-only tabs with a TabController and TabBarView.',
              code: 'AppTabBar(\n'
                  '  controller: tabController,\n'
                  '  tabs: const [\n'
                  '    AppTab(label: \'Overview\'),\n'
                  '    AppTab(label: \'Activity\'),\n'
                  '    AppTab(label: \'Settings\'),\n'
                  '  ],\n'
                  ')',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(context.appRadius.lg),
                  border: Border.all(color: colors.border),
                ),
                child: Column(
                  children: [
                    AppTabBar(
                      controller: _tabController,
                      tabs: const [
                        AppTab(label: 'Overview'),
                        AppTab(label: 'Activity'),
                        AppTab(label: 'Settings'),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Center(
                            child: AppText.bodyMedium(
                              'Overview content',
                              color: colors.textSecondary,
                            ),
                          ),
                          Center(
                            child: AppText.bodyMedium(
                              'Activity content',
                              color: colors.textSecondary,
                            ),
                          ),
                          Center(
                            child: AppText.bodyMedium(
                              'Settings content',
                              color: colors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'AppTabBar',
              description:
                  'Tabs with leading icons using DefaultTabController.',
              code: 'const AppTabBar(\n'
                  '  tabs: [\n'
                  '    AppTab(label: \'Home\', icon: Icons.home),\n'
                  '    AppTab(label: \'Search\', icon: Icons.search),\n'
                  '    AppTab(label: \'Profile\', icon: Icons.person),\n'
                  '  ],\n'
                  ')',
              child: DefaultTabController(
                length: 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: colors.surface,
                    borderRadius: BorderRadius.circular(context.appRadius.lg),
                    border: Border.all(color: colors.border),
                  ),
                  child: Column(
                    children: [
                      const AppTabBar(
                        tabs: [
                          AppTab(label: 'Home', icon: Icons.home),
                          AppTab(label: 'Search', icon: Icons.search),
                          AppTab(label: 'Profile', icon: Icons.person),
                        ],
                      ),
                      SizedBox(
                        height: 80,
                        child: TabBarView(
                          children: List.generate(3, (i) {
                            return Center(
                              child: AppText.bodySmall(
                                'Tab ${i + 1}',
                                color: colors.textSecondary,
                              ),
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            WidgetShowcase(
              title: 'AppBottomNavBar',
              description:
                  'Preview; typically placed on Scaffold.bottomNavigationBar.',
              code: 'AppBottomNavBar(\n'
                  '  currentIndex: index,\n'
                  '  onTap: (i) => setState(() => index = i),\n'
                  '  items: const [\n'
                  '    AppBottomNavItem(icon: Icons.home, label: \'Home\'),\n'
                  '    AppBottomNavItem(icon: Icons.search, label: \'Search\'),\n'
                  '  ],\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppText.bodySmall(
                    'Preview of AppBottomNavBar (typically placed in Scaffold.bottomNavigationBar):',
                    color: colors.textSecondary,
                  ),
                  const VSpace.md(),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(context.appRadius.lg),
                      border: Border.all(color: colors.border),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: AppBottomNavBar(
                      currentIndex: _bottomNavIndex,
                      onTap: (i) => setState(() => _bottomNavIndex = i),
                      items: const [
                        AppBottomNavItem(
                          icon: Icons.home_outlined,
                          activeIcon: Icons.home,
                          label: 'Home',
                        ),
                        AppBottomNavItem(
                          icon: Icons.search,
                          label: 'Search',
                        ),
                        AppBottomNavItem(
                          icon: Icons.shopping_bag_outlined,
                          activeIcon: Icons.shopping_bag,
                          label: 'Cart',
                        ),
                        AppBottomNavItem(
                          icon: Icons.person_outline,
                          activeIcon: Icons.person,
                          label: 'Profile',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppListTile',
              description: 'Leading icon, title, subtitle, divider, and onTap.',
              code: 'AppListTile(\n'
                  '  leading: const Icon(Icons.person_outline),\n'
                  '  title: \'Account\',\n'
                  '  subtitle: \'Manage your account settings\',\n'
                  '  showDivider: true,\n'
                  '  onTap: () {},\n'
                  ')',
              child: Container(
                decoration: BoxDecoration(
                  color: colors.surface,
                  borderRadius: BorderRadius.circular(context.appRadius.lg),
                  border: Border.all(color: colors.border),
                ),
                clipBehavior: Clip.antiAlias,
                child: Column(
                  children: [
                    AppListTile(
                      leading: const Icon(Icons.person_outline),
                      title: 'Account',
                      subtitle: 'Manage your account settings',
                      showDivider: true,
                      onTap: () {},
                    ),
                    AppListTile(
                      leading: const Icon(Icons.notifications_outlined),
                      title: 'Notifications',
                      subtitle: 'Configure alerts and sounds',
                      showDivider: true,
                      onTap: () {},
                    ),
                    AppListTile(
                      leading: const Icon(Icons.lock_outline),
                      title: 'Privacy',
                      showDivider: true,
                      onTap: () {},
                    ),
                    AppListTile(
                      leading: const Icon(Icons.help_outline),
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
            WidgetShowcase(
              title: 'AppListTile',
              description: 'Dense rows with custom trailing widgets.',
              code: 'AppListTile(\n'
                  '  title: \'Wi-Fi\',\n'
                  '  trailing: AppSwitch(\n'
                  '      value: true, onChanged: (_) {}, dense: true),\n'
                  '  dense: true,\n'
                  '  showDivider: true,\n'
                  ')',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppText.bodySmall(
                    'Dense variant with trailing widget:',
                    color: colors.textSecondary,
                  ),
                  const VSpace.sm(),
                  Container(
                    decoration: BoxDecoration(
                      color: colors.surface,
                      borderRadius: BorderRadius.circular(context.appRadius.lg),
                      border: Border.all(color: colors.border),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        AppListTile(
                          title: 'Wi-Fi',
                          trailing: AppSwitch(
                            value: true,
                            onChanged: (_) {},
                            dense: true,
                          ),
                          dense: true,
                          showDivider: true,
                        ),
                        AppListTile(
                          title: 'Bluetooth',
                          trailing: AppSwitch(
                            value: false,
                            onChanged: (_) {},
                            dense: true,
                          ),
                          dense: true,
                          showDivider: true,
                        ),
                        const AppListTile(
                          title: 'Version',
                          trailing: Text('1.0.0'),
                          dense: true,
                        ),
                      ],
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
