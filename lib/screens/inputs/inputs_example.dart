import 'package:flutter/material.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

import '../../widgets/widget_showcase.dart';

class InputsExample extends StatelessWidget {
  const InputsExample({super.key});

  @override
  Widget build(BuildContext context) {
    final spacing = context.appSpacing;

    return Scaffold(
      appBar: const AppAppBar(title: 'Inputs'),
      body: SafeContent(
        child: ListView(
          padding: EdgeInsets.all(spacing.lg),
          children: [
            const PackageImportBanner(),
            const VSpace.md(),
            WidgetShowcase(
              title: 'AppTextField',
              description:
                  'Labeled text input with optional icons, validation, multiline, and the email preset.',
              code: '''AppTextField(
  label: 'Email',
  hint: 'you@example.com',
  prefixIcon: Icon(Icons.email_outlined),
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppTextField(
                    label: 'Full Name',
                    hint: 'Enter your full name',
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                  const VSpace.md(),
                  const AppTextField(
                    label: 'Email',
                    hint: 'you@example.com',
                    prefixIcon: Icon(Icons.email_outlined),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const VSpace.md(),
                  const AppTextField(
                    label: 'Bio',
                    hint: 'Tell us about yourself...',
                    maxLines: 4,
                  ),
                  const VSpace.md(),
                  AppTextField(
                    label: 'With Error',
                    hint: 'Type something',
                    errorText: 'This field is required',
                    prefixIcon: const Icon(Icons.warning_amber),
                    validator: (v) => null,
                  ),
                  const VSpace.md(),
                  const AppTextField(
                    label: 'Disabled',
                    hint: 'Cannot edit this',
                    enabled: false,
                  ),
                  const VSpace.md(),
                  AppTextField.email(
                    label: 'Email Address',
                    hint: 'you@company.com',
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Required';
                      if (!value.contains('@')) return 'Invalid email';
                      return null;
                    },
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'PasswordTextField',
              description: 'Password entry with visibility toggle and validation.',
              code: '''PasswordTextField(
  label: 'Password',
  hint: 'Enter your password',
  validator: (value) => null,
)''',
              child: PasswordTextField(
                label: 'Password',
                hint: 'Enter your password',
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  if (value.length < 8) return 'Min 8 characters';
                  return null;
                },
              ),
            ),
            WidgetShowcase(
              title: 'SearchField',
              description: 'Search-style field with leading icon.',
              code: '''SearchField(
  hint: 'Search products...',
  onChanged: (value) {},
)''',
              child: SearchField(
                hint: 'Search products...',
                onChanged: (value) {},
              ),
            ),
            WidgetShowcase(
              title: 'PinInput',
              description: 'Fixed-length PIN or OTP boxes, with optional masking.',
              code: '''PinInput(
  length: 6,
  onCompleted: (pin) {},
)''',
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PinInput(
                    length: 6,
                    onCompleted: (pin) {},
                  ),
                  const VSpace.md(),
                  PinInput(
                    length: 4,
                    obscureText: true,
                    onCompleted: (pin) {},
                    errorText: 'Invalid PIN',
                  ),
                ],
              ),
            ),
            WidgetShowcase(
              title: 'PhoneField',
              description: 'Phone number with country picker.',
              code: '''PhoneField(
  label: 'Phone Number',
  hint: 'Enter phone number',
  onChanged: (phone, country) {},
)''',
              child: PhoneField(
                label: 'Phone Number',
                hint: 'Enter phone number',
                pickerTitle: 'Select Country',
                onChanged: (phone, country) {},
              ),
            ),
            const VSpace.xxl(),
          ],
        ),
      ),
    );
  }
}
