import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class SelectionExample extends StatefulWidget {
  const SelectionExample({super.key});

  @override
  State<SelectionExample> createState() => _SelectionExampleState();
}

class _SelectionExampleState extends State<SelectionExample> {
  bool _notifications = true;
  bool _darkMode = false;
  bool _biometric = false;

  bool _agreeTerms = false;
  bool _newsletter = true;
  bool? _selectAll;

  String _delivery = 'standard';

  String? _country;

  Set<String> _tags = {'Flutter', 'Dart'};
  Set<String> _priority = {'Medium'};

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: const AppAppBar(title: 'Selection Controls'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppSwitch',
              description:
                  'Toggle with optional subtitle; disabled state when onChanged is omitted.',
              code: '''AppSwitch(
  value: _notifications,
  onChanged: (v) => setState(() => _notifications = v),
  label: 'Push Notifications',
  subtitle: 'Receive alerts for new messages',
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSwitch(
                    value: _notifications,
                    onChanged: (v) => setState(() => _notifications = v),
                    label: 'Push Notifications',
                    subtitle: 'Receive alerts for new messages',
                  ),
                  AppSwitch(
                    value: _darkMode,
                    onChanged: (v) => setState(() => _darkMode = v),
                    label: 'Dark Mode',
                  ),
                  AppSwitch(
                    value: _biometric,
                    onChanged: (v) => setState(() => _biometric = v),
                    label: 'Biometric Login',
                    subtitle: 'Use fingerprint or face ID',
                  ),
                  const AppSwitch(
                    value: true,
                    label: 'Disabled switch',
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppCheckbox',
              description:
                  'Binary and tristate checkboxes with optional subtitle.',
              code: '''AppCheckbox(
  value: _agreeTerms,
  onChanged: (v) => setState(() => _agreeTerms = v!),
  label: 'I agree to the terms and conditions',
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppCheckbox(
                    value: _agreeTerms,
                    onChanged: (v) => setState(() => _agreeTerms = v!),
                    label: 'I agree to the terms and conditions',
                  ),
                  AppCheckbox(
                    value: _newsletter,
                    onChanged: (v) => setState(() => _newsletter = v!),
                    label: 'Subscribe to newsletter',
                    subtitle: 'Get weekly updates about new features',
                  ),
                  AppCheckbox(
                    value: _selectAll,
                    tristate: true,
                    onChanged: (v) => setState(() => _selectAll = v),
                    label: 'Select all (tristate)',
                  ),
                  const AppCheckbox(
                    value: true,
                    label: 'Disabled checkbox',
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppRadioGroup',
              description:
                  'Vertical radio list with optional subtitles and disabled options.',
              code: '''AppRadioGroup<String>(
  value: _delivery,
  onChanged: (v) => setState(() => _delivery = v),
  options: const [
    AppRadioOption(value: 'standard', label: 'Standard Delivery'),
    AppRadioOption(value: 'express', label: 'Express', enabled: false),
  ],
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppRadioGroup<String>(
                    value: _delivery,
                    onChanged: (v) => setState(() => _delivery = v),
                    options: const [
                      AppRadioOption(
                        value: 'standard',
                        label: 'Standard Delivery',
                        subtitle: '5-7 business days',
                      ),
                      AppRadioOption(
                        value: 'express',
                        label: 'Express Delivery',
                        subtitle: '2-3 business days',
                      ),
                      AppRadioOption(
                        value: 'overnight',
                        label: 'Overnight',
                        subtitle: 'Next business day',
                      ),
                      AppRadioOption(
                        value: 'disabled',
                        label: 'Unavailable option',
                        enabled: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppDropdown',
              description:
                  'Searchable-style dropdown with label, hint, icons, and error text.',
              code: '''AppDropdown<String>(
  value: _country,
  label: 'Country',
  hint: 'Select a country',
  options: const [
    AppDropdownOption(value: 'us', label: 'United States', icon: Icons.flag),
  ],
  onChanged: (v) => setState(() => _country = v),
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppDropdown<String>(
                    value: _country,
                    label: 'Country',
                    hint: 'Select a country',
                    options: const [
                      AppDropdownOption(value: 'us', label: 'United States', icon: Icons.flag),
                      AppDropdownOption(value: 'uk', label: 'United Kingdom', icon: Icons.flag),
                      AppDropdownOption(value: 'in', label: 'India', icon: Icons.flag),
                      AppDropdownOption(value: 'jp', label: 'Japan', icon: Icons.flag),
                    ],
                    onChanged: (v) => setState(() => _country = v),
                  ),
                  const VSpace.md(),
                  AppDropdown<String>(
                    value: null,
                    label: 'With Error',
                    hint: 'Required field',
                    errorText: 'Please select an option',
                    options: const [
                      AppDropdownOption(value: 'a', label: 'Option A'),
                      AppDropdownOption(value: 'b', label: 'Option B'),
                    ],
                    onChanged: (_) {},
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'AppChipGroup',
              description:
                  'Multi- or single-select chip rows; pair with AppChip for custom chips.',
              code: '''AppChipGroup(
  options: const ['Flutter', 'Dart', 'Web'],
  selected: _tags,
  onChanged: (v) => setState(() => _tags = v),
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText.bodySmall(
                    'Multi-select tags:',
                    color: context.appColors.textSecondary,
                  ),
                  const VSpace.sm(),
                  AppChipGroup(
                    options: const ['Flutter', 'Dart', 'iOS', 'Android', 'Web', 'Desktop'],
                    selected: _tags,
                    onChanged: (v) => setState(() => _tags = v),
                  ),
                  const VSpace.lg(),
                  AppText.bodySmall(
                    'Single-select priority:',
                    color: context.appColors.textSecondary,
                  ),
                  const VSpace.sm(),
                  AppChipGroup(
                    options: const ['Low', 'Medium', 'High', 'Critical'],
                    selected: _priority,
                    singleSelect: true,
                    onChanged: (v) => setState(() => _priority = v),
                  ),
                  const VSpace.lg(),
                  AppText.bodySmall(
                    'Individual chip with icon and delete:',
                    color: context.appColors.textSecondary,
                  ),
                  const VSpace.sm(),
                  Wrap(
                    spacing: spacing.sm,
                    children: [
                      AppChip(
                        label: 'With Icon',
                        leadingIcon: Icons.star,
                        selected: true,
                        onSelected: (_) {},
                      ),
                      AppChip(
                        label: 'Deletable',
                        onDeleted: () {},
                      ),
                    ],
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
