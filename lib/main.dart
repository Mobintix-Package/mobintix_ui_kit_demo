import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import 'screens/advanced/advanced_example.dart';
import 'screens/buttons/buttons_example.dart';
import 'screens/cards/cards_example.dart';
import 'screens/dialogs/dialogs_example.dart';
import 'screens/feedback/feedback_example.dart';
import 'screens/inputs/inputs_example.dart';
import 'screens/layout/layout_example.dart';
import 'screens/media/media_example.dart';
import 'screens/misc/misc_example.dart';
import 'screens/navigation/navigation_example.dart';
import 'screens/pickers/pickers_example.dart';
import 'screens/progress/progress_example.dart';
import 'screens/selection/selection_example.dart';
import 'screens/theme/theme_example.dart';
import 'screens/typography/typography_example.dart';

void main() {
  runApp(const UiKitExampleApp());
}

class UiKitExampleApp extends StatefulWidget {
  const UiKitExampleApp({super.key});

  @override
  State<UiKitExampleApp> createState() => _UiKitExampleAppState();
}

class _UiKitExampleAppState extends State<UiKitExampleApp> {
  bool _isDark = false;

  void _toggleTheme() {
    setState(() => _isDark = !_isDark);
  }

  @override
  Widget build(BuildContext context) {
    final theme = _isDark ? AppTheme.dark() : AppTheme.light();

    return AppThemeScope(
      theme: theme,
      child: MaterialApp(
        title: 'MOBINTIX UI Kit',
        debugShowCheckedModeBanner: false,
        theme: theme.toThemeData(),
        home: _HomeScreen(isDark: _isDark, onToggleTheme: _toggleTheme),
      ),
    );
  }
}

// ─── Data model for menu items ──────────────────────────────────────────────

class _Category {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color Function(AppColors) color;
  final int widgetCount;
  final Widget screen;

  const _Category({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.widgetCount,
    required this.screen,
  });
}

// ─── Home Screen ────────────────────────────────────────────────────────────

class _HomeScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const _HomeScreen({required this.isDark, required this.onToggleTheme});

  static final _categories = <_Category>[
    _Category(
      title: 'Buttons',
      subtitle: 'Primary, secondary, outline, ghost, danger, icon, text',
      icon: Icons.smart_button,
      color: (c) => c.primary,
      widgetCount: 3,
      screen: const ButtonsExample(),
    ),
    _Category(
      title: 'Inputs',
      subtitle: 'Text fields, password, search, PIN, phone',
      icon: Icons.text_fields,
      color: (c) => c.secondary,
      widgetCount: 5,
      screen: const InputsExample(),
    ),
    _Category(
      title: 'Selection Controls',
      subtitle: 'Switch, checkbox, radio, dropdown, chips',
      icon: Icons.toggle_on_outlined,
      color: (c) => c.info,
      widgetCount: 7,
      screen: const SelectionExample(),
    ),
    _Category(
      title: 'Pickers & Sliders',
      subtitle: 'Date, time, slider, range, rating, segmented control',
      icon: Icons.tune,
      color: (c) => c.primary,
      widgetCount: 6,
      screen: const PickersExample(),
    ),
    _Category(
      title: 'Cards',
      subtitle: 'Basic card, info card, list detail card',
      icon: Icons.credit_card,
      color: (c) => c.success,
      widgetCount: 3,
      screen: const CardsExample(),
    ),
    _Category(
      title: 'Navigation & Lists',
      subtitle: 'Tab bar, bottom nav, list tiles, expansion tiles',
      icon: Icons.menu_outlined,
      color: (c) => c.secondary,
      widgetCount: 5,
      screen: const NavigationExample(),
    ),
    _Category(
      title: 'Dialogs & Sheets',
      subtitle: 'Dialogs, confirmations, bottom sheets',
      icon: Icons.open_in_new,
      color: (c) => c.warning,
      widgetCount: 3,
      screen: const DialogsExample(),
    ),
    _Category(
      title: 'Feedback',
      subtitle: 'Loading, empty, error states, toasts',
      icon: Icons.feedback_outlined,
      color: (c) => c.error,
      widgetCount: 5,
      screen: const FeedbackExample(),
    ),
    _Category(
      title: 'Progress & Snackbar',
      subtitle: 'Progress bars, themed snackbar variants',
      icon: Icons.linear_scale,
      color: (c) => c.info,
      widgetCount: 2,
      screen: const ProgressExample(),
    ),
    _Category(
      title: 'Advanced',
      subtitle: 'Stepper, banner, counter, skeleton, clipboard, tooltip...',
      icon: Icons.auto_awesome,
      color: (c) => c.warning,
      widgetCount: 10,
      screen: const AdvancedExample(),
    ),
    _Category(
      title: 'Media',
      subtitle: 'Images, avatars, status avatars',
      icon: Icons.image_outlined,
      color: (c) => c.success,
      widgetCount: 3,
      screen: const MediaExample(),
    ),
    _Category(
      title: 'Typography',
      subtitle: 'All Material 3 text styles with AppText',
      icon: Icons.text_format,
      color: (c) => c.primary,
      widgetCount: 1,
      screen: const TypographyExample(),
    ),
    _Category(
      title: 'Layout & Grid',
      subtitle: 'Spacing, AppAppBar, responsive grid, gradient container',
      icon: Icons.dashboard_outlined,
      color: (c) => c.secondary,
      widgetCount: 5,
      screen: const LayoutExample(),
    ),
    _Category(
      title: 'Misc',
      subtitle: 'Badges, dividers, shimmer, popup menu, status indicator',
      icon: Icons.widgets_outlined,
      color: (c) => c.error,
      widgetCount: 6,
      screen: const MiscExample(),
    ),
    _Category(
      title: 'Theme Tokens',
      subtitle: 'Colors, spacing, sizing, radius, shadows, durations',
      icon: Icons.palette_outlined,
      color: (c) => c.warning,
      widgetCount: 7,
      screen: const ThemeExample(),
    ),
  ];

  int get _totalWidgets =>
      _categories.fold(0, (sum, c) => sum + c.widgetCount);

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appTheme.radius;

    return Scaffold(
      body: SafeContent(
        child: CustomScrollView(
          slivers: [
            // ── Hero header ──────────────────────────────────────────
            SliverToBoxAdapter(
              child: GradientContainer(
                colors: [colors.primary, colors.primaryDark],
                borderRadius: BorderRadius.zero,
                padding: EdgeInsets.fromLTRB(
                  spacing.xl,
                  MediaQuery.paddingOf(context).top + spacing.xl,
                  spacing.xl,
                  spacing.xl,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'MOBINTIX',
                                style: context.headlineSmallStyle.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 2,
                                ),
                              ),
                              Text(
                                'UI Kit',
                                style: context.titleMediumStyle.copyWith(
                                  color: Colors.white.withValues(alpha: 0.8),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(radius.md),
                          ),
                          child: IconButton(
                            icon: Icon(
                              isDark ? Icons.light_mode : Icons.dark_mode,
                              color: Colors.white,
                            ),
                            onPressed: onToggleTheme,
                            tooltip: isDark ? 'Light mode' : 'Dark mode',
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: spacing.lg),
                    Text(
                      'A fully configurable, theme-driven Flutter UI kit '
                      'with $_totalWidgets+ production-ready widgets.',
                      style: context.bodyMediumStyle.copyWith(
                        color: Colors.white.withValues(alpha: 0.9),
                      ),
                    ),
                    SizedBox(height: spacing.lg),
                    Wrap(
                      spacing: spacing.sm,
                      runSpacing: spacing.sm,
                      children: [
                        _StatChip(
                          label: '${_categories.length} Categories',
                          icon: Icons.category_outlined,
                        ),
                        _StatChip(
                          label: '$_totalWidgets+ Widgets',
                          icon: Icons.widgets_outlined,
                        ),
                        const _StatChip(
                          label: '175 Tests',
                          icon: Icons.check_circle_outline,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // ── Section title ────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  spacing.lg, spacing.xl, spacing.lg, spacing.sm,
                ),
                child: SectionHeader(
                  title: 'Components',
                  trailing: AppBadge(
                    text: '${_categories.length}',
                    variant: BadgeVariant.primary,
                    size: BadgeSize.small,
                  ),
                ),
              ),
            ),

            // ── Category grid ────────────────────────────────────────
            SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: spacing.lg),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: Responsive.value(
                    context,
                    xs: 2,
                    md: 3,
                    lg: 4,
                  ),
                  mainAxisSpacing: spacing.sm,
                  crossAxisSpacing: spacing.sm,
                  childAspectRatio: Responsive.value(
                    context,
                    xs: 1.1,
                    sm: 1.2,
                    md: 1.3,
                  ),
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final cat = _categories[index];
                    final catColor = cat.color(colors);
                    return _CategoryCard(
                      title: cat.title,
                      subtitle: cat.subtitle,
                      icon: cat.icon,
                      color: catColor,
                      widgetCount: cat.widgetCount,
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute<void>(builder: (_) => cat.screen),
                      ),
                    );
                  },
                  childCount: _categories.length,
                ),
              ),
            ),

            // ── Footer ───────────────────────────────────────────────
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(spacing.xl),
                child: Column(
                  children: [
                    AppDivider(),
                    SizedBox(height: spacing.md),
                    AppText.bodySmall(
                      'v0.0.3  •  Flutter ${_flutterVersion()}  •  MIT License',
                      color: colors.textDisabled,
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

  String _flutterVersion() => '3.41+';
}

// ─── Stat chip in header ────────────────────────────────────────────────────

class _StatChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const _StatChip({required this.label, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(context.appTheme.radius.full),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white.withValues(alpha: 0.9)),
          const SizedBox(width: 6),
          Text(
            label,
            style: context.labelSmallStyle.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Category card ──────────────────────────────────────────────────────────

class _CategoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final int widgetCount;
  final VoidCallback onTap;

  const _CategoryCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.widgetCount,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appTheme.radius;

    return AppCard(
      semanticLabel: title,
      onTap: onTap,
      padding: EdgeInsets.all(spacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.12),
                  borderRadius: BorderRadius.circular(radius.md),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: colors.inputBackground,
                  borderRadius: BorderRadius.circular(radius.full),
                ),
                child: Text(
                  '$widgetCount',
                  style: context.labelSmallStyle.copyWith(
                    color: colors.textSecondary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Text(
            title,
            style: context.labelLargeStyle.copyWith(
              fontWeight: FontWeight.w600,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: spacing.xxs),
          Text(
            subtitle,
            style: context.labelSmallStyle.copyWith(
              color: colors.textSecondary,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
