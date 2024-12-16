import 'package:flutter/material.dart';

enum ButtonVariant { outlined, filled, text }

class Button extends StatelessWidget {
  final String label;
  final Function()? onPressed;
  final Widget? icon;
  final ButtonVariant variant;

  const Button({
    super.key,
    this.onPressed,
    required this.label,
    this.icon,
    this.variant = ButtonVariant.filled,
  });

  Widget getWidget() {
    switch (variant) {
      case ButtonVariant.filled:
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: FilledButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(
                Colors.blueAccent,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            icon: icon,
            label: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      case ButtonVariant.outlined:
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            icon: icon,
            label: Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
      case ButtonVariant.text:
        return SizedBox(
          width: double.infinity,
          height: 56,
          child: TextButton.icon(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: const WidgetStatePropertyAll(
                Colors.blueAccent,
              ),
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            icon: icon,
            label: Text(
              label,
              style: const TextStyle(
                color: Colors.black87,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return getWidget();
  }
}
