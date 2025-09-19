import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:imperialtv/utils/custom_widget/style.dart';
import '../../utils/utils.dart';
import 'dimensions.dart';
import 'label_text.dart';
import 'my_color.dart';

class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Function? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final FormFieldValidator? validator;
  final TextInputType? textInputType;
  final bool isEnable;
  final bool isPassword;
  final bool isShowSuffixIcon;
  final bool isIcon;
  final VoidCallback? onSuffixTap;
  final VoidCallback? onTap;
  final bool isSearch;
  final bool isCountryPicker;
  final TextInputAction inputAction;
  final bool needOutlineBorder;
  final bool readOnly;
  final bool needRequiredSign;
  final int maxLines;
  final bool animatedLabel;
  final Color fillColor;
  Color? focusColor = MyColor.getTextFieldEnableBorder();
  final bool isRequired;
  List<String>? autofillHints;

  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;
  final bool? isPin;

  final bool isborderNone;
  final VoidCallback? onSubmit;

  List<TextInputFormatter>? inputFormatters;
  final bool shadowBox;
  final double? radius; // Changed to final

  CustomTextField({
    super.key,
    this.labelText,
    this.labelTextStyle,
    this.readOnly = false,
    this.fillColor = MyColor.colorWhite,
    this.focusColor,
    required this.onChanged,
    this.hintText,
    this.hintTextStyle,
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.validator,
    this.textInputType,
    this.isEnable = true,
    this.isPassword = false,
    this.isShowSuffixIcon = false,
    this.isIcon = false,
    this.onSuffixTap,
    this.onTap,
    this.isSearch = false,
    this.isCountryPicker = false,
    this.inputAction = TextInputAction.next,
    this.needOutlineBorder = false,
    this.needRequiredSign = false,
    this.maxLines = 1,
    this.animatedLabel = false,
    this.isRequired = false,
    this.prefixIcon,
    this.suffixWidget,
    this.suffixIconConstraints,
    this.isDense,
    this.isborderNone = false,
    this.isPin = false,
    this.onSubmit,
    this.radius = Dimensions.mediumRadius,
    this.inputFormatters,
    this.shadowBox = false,
    this.autofillHints,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(widget.radius ?? Dimensions.mediumRadius);

    return widget.needOutlineBorder
        ? widget.animatedLabel
        ? widget.shadowBox == false
        ? TextFormField(
      autofillHints: widget.autofillHints,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      style: regularDefault.copyWith(color: MyColor.getTextColor()),
      onTap: widget.onTap,
      cursorColor: MyColor.getTextColor(),
      controller: widget.controller,
      autofocus: false,
      textInputAction: widget.inputAction,
      enabled: widget.isEnable,
      focusNode: widget.focusNode,
      validator: widget.validator,
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword ? obscureText : false,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsetsDirectional.only(
            top: 0, start: 15, end: 15, bottom: 0),
        labelStyle: widget.labelTextStyle ??
            regularDefault.copyWith(color: MyColor.getRideSubTitleColor()),
        fillColor: widget.fillColor,
        filled: true,
        hintText: widget.hintText?.tr ?? '',
        hintStyle: widget.hintTextStyle ??
            TextStyle(color: MyColor.getRideSubTitleColor()),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            width: 1.5,
            color: MyColor.primaryColor.withValues(alpha: 0.9),
          ),
          borderRadius: borderRadius,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 0.5,
              color: widget.focusColor ?? MyColor.getTextFieldEnableBorder()),
          borderRadius: borderRadius,
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 1, color: MyColor.borderColor.withValues(alpha: 0.9)),
            borderRadius: borderRadius),
        prefixIconConstraints: BoxConstraints.loose(const Size(40, 40)),
        prefixIcon: widget.prefixIcon,
        suffixIconConstraints: widget.suffixIconConstraints ??
            const BoxConstraints(
                maxHeight: 50, maxWidth: 70, minHeight: 40, minWidth: 50),
        suffixIcon: _buildSuffixIcon(),
      ),
      onFieldSubmitted: (text) => _handleFieldSubmitted(),
      onChanged: (text) => widget.onChanged!(text),
    )
        : Stack(
      children: [
        Container(
          height: 47,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: MyColor.getCardBgColor(),
              borderRadius: borderRadius,
              boxShadow: MyUtils.getShadow2(blurRadius: 5)),
        ),
        TextFormField(
          autofillHints: widget.autofillHints,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          style: regularDefault.copyWith(color: MyColor.getTextColor()),
          textAlign: TextAlign.left,
          cursorColor: MyColor.colorBlack,
          controller: widget.controller,
          autofocus: false,
          textInputAction: widget.inputAction,
          enabled: widget.isEnable,
          focusNode: widget.focusNode,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          obscureText: widget.isPassword ? obscureText : false,
          onTap: widget.onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
                top: 15, left: 15, right: 15, bottom: 15),
            labelStyle: regularDefault.copyWith(color: MyColor.getLabelTextColor()),
            fillColor: widget.fillColor,
            filled: true,
            hintStyle: widget.hintTextStyle ??
                TextStyle(color: MyColor.getRideSubTitleColor()),
            border: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: MyColor.textFieldDisableBorderColor, width: .5),
                borderRadius: borderRadius),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: MyColor.textFieldEnableBorderColor, width: .5),
                borderRadius: borderRadius),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: MyColor.getTextFieldDisableBorder(), width: 0.5),
                borderRadius: borderRadius),
            focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyColor.colorRed, width: .5),
                borderRadius: borderRadius),
            errorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: MyColor.colorRed, width: .5),
                borderRadius: borderRadius),
            prefixIconConstraints: BoxConstraints.loose(const Size(40, 40)),
            suffixIcon: _buildSuffixIcon(),
          ),
          onFieldSubmitted: (text) => _handleFieldSubmitted(),
          onChanged: (text) => widget.onChanged!(text),
        ),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofillHints: widget.autofillHints,
          maxLines: widget.maxLines,
          readOnly: widget.readOnly,
          style: regularDefault.copyWith(color: MyColor.getTextColor()),
          cursorColor: MyColor.getTextColor(),
          controller: widget.controller,
          autofocus: false,
          textInputAction: widget.inputAction,
          enabled: widget.isEnable,
          focusNode: widget.focusNode,
          validator: widget.validator,
          keyboardType: widget.textInputType,
          obscureText: widget.isPassword ? obscureText : false,
          inputFormatters: widget.inputFormatters,
          onTap: widget.onTap,
          decoration: InputDecoration(
            contentPadding: const EdgeInsetsDirectional.only(
                top: 15, start: 15, end: 15, bottom: 15),
            hintText: widget.hintText != null ? widget.hintText!.tr : '',
            hintStyle: widget.hintTextStyle ??
                regularLarge.copyWith(
                  color: MyColor.getHintTextColor().withValues(alpha: 0.7),
                ),
            fillColor: widget.fillColor,
            filled: true,
            border: OutlineInputBorder(
                borderSide:
                BorderSide(width: 1.5, color: MyColor.primaryColor),
                borderRadius: borderRadius),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1.5,
                color: widget.focusColor ?? MyColor.primaryColor,
              ),
              borderRadius: borderRadius,
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 0.5, color: MyColor.getTextFieldDisableBorder()),
                borderRadius: borderRadius),
            prefixIcon: widget.prefixIcon,
            prefixIconConstraints: BoxConstraints.loose(const Size(40, 40)),
            isDense: widget.isDense,
            suffixIconConstraints: widget.suffixIconConstraints ??
                const BoxConstraints(
                    maxHeight: 50, maxWidth: 70, minHeight: 40, minWidth: 50),
            suffixIcon: _buildSuffixIcon(),
          ),
          onFieldSubmitted: (text) => _handleFieldSubmitted(),
          onChanged: (text) => widget.onChanged!(text),
        )
      ],
    )
        : widget.isborderNone
        ? TextFormField(
      autofillHints: widget.autofillHints,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      style: regularDefault.copyWith(color: MyColor.getTextColor()),
      cursorColor: MyColor.getPrimaryColor(),
      controller: widget.controller,
      autofocus: false,
      textInputAction: widget.inputAction,
      enabled: widget.isEnable,
      focusNode: widget.focusNode,
      validator: widget.validator,
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword ? obscureText : false,
      inputFormatters: widget.inputFormatters,
      onTap: widget.onTap,
      decoration: InputDecoration(
        isDense: widget.isDense,
        contentPadding: const EdgeInsetsDirectional.only(
            top: 0, start: 0, end: 0, bottom: 0),
        labelStyle:
        regularDefault.copyWith(color: MyColor.getLabelTextColor()),
        fillColor: widget.fillColor,
        filled: true,
        border: InputBorder.none,
        hintText: widget.hintText != null ? widget.hintText!.tr : '',
        hintStyle: regularLarge.copyWith(
            color: MyColor.getHintTextColor().withValues(alpha: 0.7)),
        prefixIconConstraints: BoxConstraints.loose(const Size(40, 40)),
        suffixIconConstraints: widget.suffixIconConstraints ??
            const BoxConstraints(
                maxHeight: 50, maxWidth: 70, minHeight: 40, minWidth: 50),
        suffixIcon: _buildSuffixIcon(),
      ),
      onFieldSubmitted: (text) => _handleFieldSubmitted(),
      onChanged: (text) => widget.onChanged!(text),
    )
        : TextFormField(
      autofillHints: widget.autofillHints,
      maxLines: widget.maxLines,
      readOnly: widget.readOnly,
      style: regularDefault,
      onTap: widget.onTap,
      cursorColor: MyColor.getHintTextColor(),
      controller: widget.controller,
      autofocus: false,
      textInputAction: widget.inputAction,
      enabled: widget.isEnable,
      focusNode: widget.focusNode,
      validator: widget.validator,
      keyboardType: widget.textInputType,
      obscureText: widget.isPassword ? obscureText : false,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        isDense: widget.isDense,
        contentPadding: const EdgeInsetsDirectional.only(
            top: 0, start: 0, end: 0, bottom: 0),
        labelStyle:
        regularDefault.copyWith(color: MyColor.getLabelTextColor()),
        fillColor: widget.fillColor,
        filled: true,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              width: 0.5, color: MyColor.getTextFieldDisableBorder()),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: widget.focusColor ?? MyColor.getTextFieldEnableBorder(),
          ),
          borderRadius: borderRadius,
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 0.5, color: MyColor.getTextFieldDisableBorder())),
        prefixIconConstraints: BoxConstraints.loose(const Size(40, 40)),
        suffixIcon: _buildSuffixIcon(),
      ),
      onFieldSubmitted: (text) => _handleFieldSubmitted(),
      onChanged: (text) => widget.onChanged!(text),
    );
  }

  Widget? _buildSuffixIcon() {
    if (!widget.isShowSuffixIcon) return null;

    if (widget.isPassword) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _toggle,
        child: Padding(
          padding: const EdgeInsets.only(right: 4.0),
          child: Center(
            child: obscureText ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
          ),
        ),
      );
    } else if (widget.isIcon) {
      return IconButton(
        onPressed: widget.onSuffixTap,
        icon: Icon(
          widget.isSearch
              ? Icons.search_outlined
              : widget.isCountryPicker
              ? Icons.arrow_drop_down_outlined
              : Icons.camera_alt_outlined,
          size: 25,
          color: MyColor.getPrimaryColor(),
        ),
      );
    } else {
      return widget.suffixWidget;
    }
  }

  void _handleFieldSubmitted() {
    if (widget.nextFocus != null) {
      FocusScope.of(context).requestFocus(widget.nextFocus);
    } else if (widget.onSubmit != null) {
      widget.onSubmit!();
    }
  }

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}