import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';

/// Wraps a live widget demo with its class name, description, and
/// a collapsible code snippet so developers can quickly identify
/// and copy-paste the widget into their own project.
class WidgetShowcase extends StatefulWidget {
  final String title;
  final String? description;
  final String? code;
  final Widget child;
  final EdgeInsets? padding;

  const WidgetShowcase({
    super.key,
    required this.title,
    this.description,
    this.code,
    required this.child,
    this.padding,
  });

  @override
  State<WidgetShowcase> createState() => _WidgetShowcaseState();
}

class _WidgetShowcaseState extends State<WidgetShowcase> {
  bool _showCode = false;
  bool _copied = false;

  void _copyCode() {
    if (widget.code == null) return;
    Clipboard.setData(ClipboardData(text: widget.code!));
    setState(() => _copied = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _copied = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final spacing = context.appSpacing;
    final radius = context.appTheme.radius;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header row: class name + code toggle
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: colors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(radius.sm),
              ),
              child: Text(
                widget.title,
                style: context.labelMediumStyle.copyWith(
                  color: colors.primary,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'monospace',
                ),
              ),
            ),
            const Spacer(),
            if (widget.code != null)
              GestureDetector(
                onTap: () => setState(() => _showCode = !_showCode),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _showCode
                        ? colors.primary.withValues(alpha: 0.1)
                        : colors.inputBackground,
                    borderRadius: BorderRadius.circular(radius.sm),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        _showCode ? Icons.code_off : Icons.code,
                        size: 14,
                        color:
                            _showCode ? colors.primary : colors.textSecondary,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _showCode ? 'Hide Code' : 'Show Code',
                        style: context.labelSmallStyle.copyWith(
                          color: _showCode
                              ? colors.primary
                              : colors.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),

        if (widget.description != null) ...[
          SizedBox(height: spacing.xxs),
          Text(
            widget.description!,
            style: context.bodySmallStyle.copyWith(color: colors.textSecondary),
          ),
        ],

        // Code block (collapsible)
        if (_showCode && widget.code != null) ...[
          SizedBox(height: spacing.sm),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(spacing.md),
            decoration: BoxDecoration(
              color: context.appTheme.isDark
                  ? const Color(0xFF1E1E2E)
                  : const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(radius.md),
              border: Border.all(color: colors.border),
            ),
            child: Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    widget.code!,
                    style: TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 12,
                      height: 1.5,
                      color:
                          context.appTheme.isDark ? const Color(0xFFCDD6F4) : colors.textPrimary,
                    ),
                  ),
                ),
                Positioned(
                  top: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _copyCode,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: colors.inputBackground,
                        borderRadius: BorderRadius.circular(radius.sm),
                      ),
                      child: Icon(
                        _copied ? Icons.check : Icons.copy,
                        size: 14,
                        color:
                            _copied ? colors.success : colors.textSecondary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],

        SizedBox(height: spacing.sm),

        // Live widget demo
        Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: widget.child,
        ),

        SizedBox(height: spacing.xl),
      ],
    );
  }
}

/// Displays the import statement for the package at the top of a screen.
class PackageImportBanner extends StatelessWidget {
  const PackageImportBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final radius = context.appTheme.radius;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: colors.primary.withValues(alpha: 0.06),
        borderRadius: BorderRadius.circular(radius.md),
        border: Border.all(color: colors.primary.withValues(alpha: 0.15)),
      ),
      child: Row(
        children: [
          Icon(Icons.info_outline, size: 14, color: colors.primary),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              "import 'package:mobintix_ui_kit/mobintix_ui_kit.dart';",
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 11,
                color: colors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
