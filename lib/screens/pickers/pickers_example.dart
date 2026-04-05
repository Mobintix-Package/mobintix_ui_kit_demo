import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class PickersExample extends StatefulWidget {
  const PickersExample({super.key});

  @override
  State<PickersExample> createState() => _PickersExampleState();
}

class _PickersExampleState extends State<PickersExample> {
  DateTime? _date;
  TimeOfDay? _time;
  double _slider = 50;
  RangeValues _range = const RangeValues(200, 800);
  double _rating = 3;
  String _view = 'list';

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;
    final colors = context.appColors;

    return Scaffold(
      appBar: const AppAppBar(title: 'Pickers & Sliders'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppDatePicker',
              description:
                  'Labeled date field with calendar dialog; supports disabled state.',
              code: '''AppDatePicker(
  label: 'Date of Birth',
  hint: 'Select your date of birth',
  value: _date,
  onChanged: (d) => setState(() => _date = d),
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppDatePicker(
                    label: 'Date of Birth',
                    hint: 'Select your date of birth',
                    value: _date,
                    onChanged: (d) => setState(() => _date = d),
                  ),
                  const VSpace.md(),
                  const AppDatePicker(
                    label: 'Disabled',
                    hint: 'Cannot select',
                  ),
                ],
              ),
            ),
            const VSpace.xl(),
            WidgetShowcase(
              title: 'AppTimePicker',
              description: 'Time-of-day picker with label and optional change handler.',
              code: '''AppTimePicker(
  label: 'Appointment Time',
  value: _time,
  onChanged: (t) => setState(() => _time = t),
)''',
              child: AppTimePicker(
                label: 'Appointment Time',
                value: _time,
                onChanged: (t) => setState(() => _time = t),
              ),
            ),
            const VSpace.xl(),
            WidgetShowcase(
              title: 'AppSlider',
              description: 'Single-value slider with label, range, and optional value label.',
              code: '''AppSlider(
  value: _slider,
  label: 'Volume',
  min: 0,
  max: 100,
  divisions: 100,
  showValue: true,
  onChanged: (v) => setState(() => _slider = v),
)''',
              child: AppSlider(
                value: _slider,
                label: 'Volume',
                min: 0,
                max: 100,
                divisions: 100,
                showValue: true,
                onChanged: (v) => setState(() => _slider = v),
              ),
            ),
            const VSpace.xl(),
            WidgetShowcase(
              title: 'AppRangeSlider',
              description: 'Two-thumb range slider with formatted value labels.',
              code: r"""AppRangeSlider(
  values: _range,
  label: 'Price Range',
  min: 0,
  max: 1000,
  valueFormatter: (v) => '\$${v.round()}',
  onChanged: (v) => setState(() => _range = v),
)""",
              child: AppRangeSlider(
                values: _range,
                label: 'Price Range',
                min: 0,
                max: 1000,
                divisions: 20,
                showValues: true,
                valueFormatter: (v) => '\$${v.round()}',
                onChanged: (v) => setState(() => _range = v),
              ),
            ),
            const VSpace.xl(),
            WidgetShowcase(
              title: 'AppRatingBar',
              description: 'Star rating with optional interaction and read-only display.',
              code: '''AppRatingBar(
  value: _rating,
  onChanged: (v) => setState(() => _rating = v),
  size: 32,
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppRatingBar(
                        value: _rating,
                        onChanged: (v) => setState(() => _rating = v),
                        size: 32,
                      ),
                      SizedBox(width: spacing.md),
                      AppText.titleMedium(
                        _rating.toString(),
                        color: colors.textSecondary,
                      ),
                    ],
                  ),
                  const VSpace.md(),
                  AppText.bodySmall(
                    'Read-only:',
                    color: colors.textSecondary,
                  ),
                  const VSpace.xs(),
                  const AppRatingBar(value: 4.5, size: 20),
                  const VSpace.sm(),
                  const AppRatingBar(value: 2, size: 20),
                ],
              ),
            ),
            const VSpace.xl(),
            WidgetShowcase(
              title: 'AppSegmentedControl',
              description: 'Icon + label segments for switching a single selected value.',
              code: '''AppSegmentedControl<String>(
  value: _view,
  segments: const [
    AppSegment(value: 'list', label: 'List', icon: Icons.list),
    AppSegment(value: 'grid', label: 'Grid', icon: Icons.grid_view),
  ],
  onChanged: (v) => setState(() => _view = v),
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppSegmentedControl<String>(
                    value: _view,
                    segments: const [
                      AppSegment(
                        value: 'list',
                        label: 'List',
                        icon: Icons.list,
                      ),
                      AppSegment(
                        value: 'grid',
                        label: 'Grid',
                        icon: Icons.grid_view,
                      ),
                      AppSegment(
                        value: 'map',
                        label: 'Map',
                        icon: Icons.map,
                      ),
                    ],
                    onChanged: (v) => setState(() => _view = v),
                  ),
                  const VSpace.md(),
                  AppText.bodySmall(
                    'Selected: $_view',
                    color: colors.textSecondary,
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
