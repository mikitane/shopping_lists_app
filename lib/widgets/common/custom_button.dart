import 'package:flutter/material.dart';
import 'package:shopping_lists_app/theme.dart';

enum ButtonKind { primary, secondary, error }
enum ButtonSize { normal }
// enum ButtonColorFamily { primary }

class CustomButton extends StatelessWidget {
  CustomButton(
      {required this.onTap,
      this.label,
      this.icon,
      this.kind = ButtonKind.primary,
      this.size = ButtonSize.normal})
      : assert(label != null || icon != null);

  // Assert icon and label is null

  final void Function() onTap;
  final String? label;
  final IconData? icon;
  final ButtonKind kind;
  final ButtonSize size;
  // final ButtonColorFamily colorFamily;

  bool get _isIconButton => this.label == null && this.icon != null;
  bool get _isIconLabelButton => this.icon != null && this.label != null;

  double get _height {
    switch (this.size) {
      case ButtonSize.normal:
        return 50;
    }
  }

  double? get _width {
    if (_isIconButton) {
      return _height;
    }

    return null;
  }

  EdgeInsets get _padding {
    if (_isIconButton) {
      return EdgeInsets.all(0);
    }

    switch (this.size) {
      case ButtonSize.normal:
        return EdgeInsets.symmetric(horizontal: 20);
    }
  }

  Icon? get _iconContent {
    if (this.icon == null) return null;

    return Icon(icon, color: _contentColor, size: _iconSize);
  }

  double get _iconSize {
    switch (this.size) {
      case ButtonSize.normal:
        return 28;
    }
  }

  Text? get _labelContent {
    if (this.label == null) return null;

    return Text(
      this.label!,
      style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    );
  }

  Color get _contentColor {
    switch (this.kind) {
      case ButtonKind.primary:
        return colorScheme.onPrimary;
      case ButtonKind.secondary:
        return colorScheme.primary;
      case ButtonKind.error:
        return colorScheme.onError;
    }
  }

  Color get _backgroundColor {
    switch (this.kind) {
      case ButtonKind.primary:
        return colorScheme.primary;
      case ButtonKind.secondary:
        return PrimaryColor.pc200;
      case ButtonKind.error:
        return colorScheme.error;
    }
  }

  Widget get _content {
    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _iconContent ?? SizedBox.shrink(),
          _isIconLabelButton
              ? SizedBox(
                  width: 8,
                )
              : SizedBox.shrink(),
          _labelContent ?? SizedBox.shrink()
        ]);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _height,
      width: _width,
      child: ElevatedButton(
        onPressed: onTap,
        child: _content,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(_backgroundColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: defaultBorderRadius,
          )),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(_padding),
        ),
      ),
    );
  }
}
