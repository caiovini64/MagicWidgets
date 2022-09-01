import 'package:devmagic_widgets/devmagic_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

class DMPasswordField extends StatefulWidget {
  final String labelText;
  final String emptyErrorText;
  final String invalidPasswordErrorText;
  final Function(String)? onChanged;
  final TextEditingController controller;
  final Key? formKey;

  final int maxLength;
  final String? hintText;
  final String? helperText;
  final TextStyle? hintStyle;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  final Color? fillColor;
  final InputBorder? border;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final TextCapitalization textCapitalization;
  final String? initialValue;
  final FormFieldValidator<String>? validator;
  final Widget? suffixChild;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixIconTap;
  final Color? suffixIconColor;
  final String? errorText;
  final bool obscureText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final void Function()? submitForm;
  final TextInputAction? textInputAction;
  final bool? enabled;

  const DMPasswordField({
    Key? key,
    required this.labelText,
    required this.emptyErrorText,
    required this.invalidPasswordErrorText,
    required this.controller,
    required this.formKey,
    this.onChanged,
    this.maxLength = 24,
    this.initialValue,
    this.hintText,
    this.helperText,
    this.hintStyle,
    this.textAlign,
    this.textStyle,
    this.fillColor,
    this.border,
    this.enabledBorder,
    this.focusedBorder,
    this.validator,
    this.errorText,
    this.obscureText = false,
    this.submitForm,
    this.suffixChild,
    this.suffixIcon,
    this.suffixIconColor,
    this.onSuffixIconTap,
    this.keyboardType,
    this.inputFormatters,
    this.textInputAction,
    this.enabled = true,
    this.textCapitalization = TextCapitalization.none,
  }) : super(key: key);

  @override
  State<DMPasswordField> createState() => _DMPasswordFieldState();
}

class _DMPasswordFieldState extends State<DMPasswordField> {
  final _controller = TextEditingController();
  String? errorText;
  @override
  Widget build(BuildContext context) {
    return DMTextField(
      formKey: widget.formKey,
      keyboardType: TextInputType.number,
      labelText: widget.labelText,
      maxLength: widget.maxLength,
      controller: _controller,
      onChanged: widget.onChanged,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: _validateForm,
      border: widget.border,
      enabledBorder: widget.enabledBorder,
      focusedBorder: widget.focusedBorder,
      fillColor: widget.fillColor,
      helperText: widget.helperText,
      hintStyle: widget.hintStyle,
      hintText: widget.hintText,
      initialValue: widget.initialValue,
      obscureText: widget.obscureText,
      onSuffixIconTap: widget.onSuffixIconTap,
      submitForm: widget.submitForm,
      suffixChild: widget.suffixChild,
      suffixIcon: widget.suffixIcon,
      suffixIconColor: widget.suffixIconColor,
      textAlign: widget.textAlign,
      textCapitalization: widget.textCapitalization,
      textInputAction: widget.textInputAction,
      textStyle: widget.textStyle,
      enabled: widget.enabled,
    );
  }

  String? _validateForm(String? text) {
    if (text == null || text.isEmpty) {
      errorText = widget.emptyErrorText;
      SchedulerBinding.instance!.addPostFrameCallback((duration) {
        setState(() {});
      });
    } else if (!_passwordValidator(text)) {
      errorText = widget.invalidPasswordErrorText;
      SchedulerBinding.instance!.addPostFrameCallback((duration) {
        setState(() {});
      });
    } else {
      errorText = null;
      SchedulerBinding.instance!.addPostFrameCallback((duration) {
        setState(() {});
      });
    }
    return errorText;
  }

  bool _passwordValidator(String text) {
    if (text.length < 8) return false;
    final regExp = RegExp(
        r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$");
    return regExp.hasMatch(text);
  }
}
