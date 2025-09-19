import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:imperialtv/utils/Widgets/theme_controller.dart';
import '../custom_widget/dimensions.dart';
import '../custom_widget/label_text.dart';
import '../custom_widget/my_color.dart';
import '../custom_widget/style.dart';
import '../utils.dart';


class CustomTextField extends StatefulWidget {
  final String? labelText;
  final TextStyle? labelTextStyle;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final Function? onChanged;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final FormFieldValidator<String>? validator;
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
  final TextStyle? autofillHintStyle;
  Color? focusColor = MyColor.getTextFieldEnableBorder();
  final bool isRequired;
  List<String>? autofillHints;

  // edited /20-7-23
  final Widget? prefixIcon;
  final Widget? suffixWidget;
  final BoxConstraints? suffixIconConstraints;
  final bool? isDense;
  final bool? isPin;

  // edited /29-7-2023
  final bool isborderNone;
  final VoidCallback? onSubmit;

  // edited /28-10-2023
  List<TextInputFormatter>? inputFormatters;
  final bool shadowBox;
  double? radius;

  // NEW: SVG suffix icon support
  final String? suffixSvgIcon;
  final Color? suffixSvgColor;
  final double? suffixSvgSize;
  final bool clearTextOnSuffixTap; // NEW: Option to clear text on tap

  //
  final bool isShowInstructionWidget;
  final String? instructions;
  final bool showLabel;
  final EdgeInsetsGeometry? contentPadding;
  final bool enableInteractiveSelection;


  CustomTextField({
    super.key,
    this.showLabel = true,
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
    this.isShowInstructionWidget = true,
    this.instructions,
    this.autofillHintStyle,
    this.contentPadding,
    // NEW: SVG suffix icon parameters
    this.suffixSvgIcon,
    this.suffixSvgColor,
    this.suffixSvgSize = 22,
    this.clearTextOnSuffixTap = false,
    this.enableInteractiveSelection = true,

  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool obscureText = true;

  //ThemeController themeController = Get.find<ThemeController>();

  // Helper method to handle suffix icon tap
  void _handleSuffixTap() {
    if (widget.clearTextOnSuffixTap && widget.controller != null) {
      // Clear the text field
      widget.controller!.clear();
      if (widget.onChanged != null) {
        widget.onChanged!('');
      }
    }

    // Call the original onSuffixTap callback if provided
    if (widget.onSuffixTap != null) {
      widget.onSuffixTap!();
    }
  }

  // Helper method to build SVG suffix icon
  Widget? _buildSuffixIcon() {
    // Show clear icon when text is present and clearTextOnSuffixTap is enabled
    final bool showClearIcon = widget.clearTextOnSuffixTap &&
        widget.controller != null &&
        widget.controller!.text.isNotEmpty;
   print("showClearIcon: ${showClearIcon}");
    if (showClearIcon || (widget.suffixSvgIcon != null && widget.suffixSvgIcon!.isNotEmpty)) {
      return GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: _handleSuffixTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 12.0),
          child:
          showClearIcon
              ? SvgPicture.asset(
            widget.suffixSvgIcon!,
            color: widget.suffixSvgColor ?? MyColor.getPrimaryColor(),
            width: widget.suffixSvgSize,
            height: widget.suffixSvgSize,
          )
              :SizedBox(),
        ),
      );
    }

    if (widget.isShowSuffixIcon) {
      if (widget.isPassword) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _toggle,
          child: Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: Center(
                child: obscureText
                    ? Icon(Icons.visibility_off_outlined,
                    color: MyColor.textcolorsubtitle, size: 16)
                    : Icon(Icons.visibility_outlined,
                    color: MyColor.textcolorsubtitle, size: 16)
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
      }
    }

    return widget.suffixWidget;
  }

  @override
  Widget build(BuildContext context) {
    return widget.needOutlineBorder
        ? widget.animatedLabel
        ? widget.shadowBox == false
        ? Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyMedium: widget.autofillHintStyle ??
              TextStyle(
                fontSize: 14,
                color: MyColor.primaryButtonColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'digital_font',
              ),
        ),
      ),
      child: TextFormField(
        enableInteractiveSelection: widget.enableInteractiveSelection,
        autofillHints: widget.autofillHints,
        maxLines: widget.maxLines,
        readOnly: widget.readOnly,
        style: regularDefault.copyWith(
            color: MyColor.getTextColor()),
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

          contentPadding: widget.contentPadding ??
              EdgeInsetsDirectional.only(
                  top: 0, start: 15, end: 15, bottom: 0),
          labelText: widget.labelText?.tr ?? '',
          labelStyle: widget.labelTextStyle ??
              regularDefault.copyWith(
                  color: MyColor.getRideSubTitleColor()),
          fillColor: widget.fillColor,
          filled: true,
          hintText: widget.hintText?.tr ?? '',
          hintStyle: widget.hintTextStyle ??
              TextStyle(
                  color: MyColor.getRideSubTitleColor()),
          border: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1.5,
              color: MyColor.secondaryColor
                  .withValues(alpha: 0.9),
            ),
            borderRadius: BorderRadius.circular(widget.radius!),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                width: 0.5,
                color: widget.focusColor ??
                    MyColor.getTextFieldEnableBorder()),
            borderRadius: BorderRadius.circular(widget.radius!),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  width: 1.5,
                  color: MyColor.secondaryColor
                      .withValues(alpha: 0.9)),
              borderRadius: BorderRadius.circular(widget.radius!)),
          prefixIconConstraints:
          BoxConstraints.loose(Size(40, 40)),
          prefixIcon: widget.prefixIcon,
          suffixIconConstraints: widget.suffixIconConstraints ??
              BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 70,
                  minHeight: 40,
                  minWidth: 50),
          suffixIcon: _buildSuffixIcon(),
        ),
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : null,
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
          // Update the UI to show/hide clear icon based on text presence
          if (widget.clearTextOnSuffixTap) {
            setState(() {});
          }
        },
      ),
    )
        : Stack(
      children: [
        Container(
          height: 47,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: MyColor.getCardBgColor(),
              borderRadius: BorderRadius.circular(widget.radius!),
              boxShadow: MyUtils.getShadow2(blurRadius: 5)),
        ),
        Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyMedium: widget.autofillHintStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: MyColor.primaryButtonColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'digital_font',
                  ),
            ),
          ),
          child: TextFormField(
            enableInteractiveSelection: widget.enableInteractiveSelection,
            autofillHints: widget.autofillHints,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            style: regularDefault.copyWith(
                color: MyColor.getTextColor()),
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
              contentPadding: widget.contentPadding ??
                  EdgeInsets.only(
                      top: 0, left: 15, right: 15, bottom: 0),
              labelText: widget.labelText,
              labelStyle: regularDefault.copyWith(
                  color: MyColor.getLabelTextColor()),
              fillColor: widget.fillColor,
              filled: true,
              hintStyle: widget.hintTextStyle ??
                  TextStyle(
                      color: MyColor.getRideSubTitleColor()),
              border: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.textFieldDisableBorderColor,
                      width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.textFieldEnableBorderColor,
                      width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: MyColor.getTextFieldDisableBorder(),
                      width: 0.5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.colorRed, width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                      color: MyColor.colorRed, width: .5),
                  borderRadius:
                  BorderRadius.circular(widget.radius!)),
              prefixIconConstraints:
              BoxConstraints.loose(Size(40, 40)),
              suffixIcon: _buildSuffixIcon(),
            ),
            onFieldSubmitted: (text) => widget.nextFocus != null
                ? FocusScope.of(context)
                .requestFocus(widget.nextFocus)
                : null,
            onChanged: (text) {
              if (widget.onChanged != null) {
                widget.onChanged!(text);
              }
              // Update the UI to show/hide clear icon based on text presence
              if (widget.clearTextOnSuffixTap) {
                setState(() {});
              }
            },
          ),
        ),
      ],
    )
        : Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showLabel &&
            widget.labelText != null &&
            widget.labelText!.isNotEmpty)
          LabelText(
            text: widget.labelText.toString(),
            isRequired: widget.isRequired,
          ),
        Theme(
          data: Theme.of(context).copyWith(
            textTheme: Theme.of(context).textTheme.copyWith(
              bodyMedium: widget.autofillHintStyle ??
                  TextStyle(
                    fontSize: 14,
                    color: MyColor.primaryButtonColor,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'digital_font',
                  ),
            ),
          ),
          child: TextFormField(
            enableInteractiveSelection: widget.enableInteractiveSelection,
            autofillHints: widget.autofillHints,
            maxLines: widget.maxLines,
            readOnly: widget.readOnly,
            style: TextStyle(
              fontSize: 14,
              color:
              // themeController.isDarkMode.value
              //     ? MyColor.colorWhite
              //     :
              MyColor.primaryColor,
              fontWeight: FontWeight.w500,
              fontFamily: 'digital_font',
            ),
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
              contentPadding: widget.contentPadding ??
                  EdgeInsetsDirectional.only(
                      top: 0, start: 15, end: 15, bottom: 0),
              hintText:
              widget.hintText != null ? widget.hintText!.tr : '',
              hintStyle: widget.hintTextStyle ??
                  regularLarge.copyWith(
                    color:
                    // themeController.isDarkMode.value
                    //     ? MyColor.colorWhite
                    //     :
                    MyColor.getHintTextColor()
                        .withValues(alpha: 0.7),
                  ),
              fillColor: widget.fillColor,
              filled: true,
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      width: 1.5, color: MyColor.secondaryColor),
                  borderRadius: BorderRadius.circular(widget.radius!)),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color:
                  widget.focusColor ?? MyColor.secondaryColor,
                ),
                borderRadius: BorderRadius.circular(widget.radius!),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      width:
                      // themeController.isDarkMode.value
                      //     ? 0.5
                      //     :
                      0.5,
                      color: MyColor.getTextFieldDisableBorder()),
                  borderRadius: BorderRadius.circular(widget.radius!)),
              prefixIcon: widget.prefixIcon,
              prefixIconConstraints:
              BoxConstraints.loose(Size(40, 40)),
              isDense: widget.isDense,
              suffixIconConstraints: widget.suffixIconConstraints ??
                  BoxConstraints(
                      maxHeight: 50,
                      maxWidth: 70,
                      minHeight: 40,
                      minWidth: 50),
              suffixIcon: _buildSuffixIcon(),
            ),
            onFieldSubmitted: (text) => widget.nextFocus != null
                ? FocusScope.of(context).requestFocus(widget.nextFocus)
                : widget.onSubmit != null
                ? widget.onSubmit!()
                : null,
            onChanged: (text) {
              if (widget.onChanged != null) {
                widget.onChanged!(text);
              }
              // Update the UI to show/hide clear icon based on text presence
              if (widget.clearTextOnSuffixTap) {
                setState(() {});
              }
            },
          ),
        )
      ],
    )
        : widget.isborderNone
        ? Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyMedium: widget.autofillHintStyle ??
              TextStyle(
                fontSize: 14,
                color: MyColor.primaryButtonColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'digital_font',
              ),
        ),
      ),
      child: TextFormField(
        enableInteractiveSelection: widget.enableInteractiveSelection,
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
          contentPadding: widget.contentPadding ??
              EdgeInsetsDirectional.only(
                  top: 0, start: 0, end: 0, bottom: 0),
          labelText: widget.labelText?.tr,
          labelStyle: regularDefault.copyWith(
              color: MyColor.getLabelTextColor()),
          fillColor: widget.fillColor,
          filled: true,
          border: InputBorder.none,
          hintText: widget.hintText != null ? widget.hintText!.tr : '',
          hintStyle: regularLarge.copyWith(
              color: MyColor.getHintTextColor()
                  .withValues(alpha: 0.7)),
          prefixIconConstraints: BoxConstraints.loose(Size(40, 40)),
          suffixIconConstraints: widget.suffixIconConstraints ??
              BoxConstraints(
                  maxHeight: 50,
                  maxWidth: 70,
                  minHeight: 40,
                  minWidth: 50),
          suffixIcon: _buildSuffixIcon(),
        ),
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : null,
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
          // Update the UI to show/hide clear icon based on text presence
          if (widget.clearTextOnSuffixTap) {
            setState(() {});
          }
        },
      ),
    )
        : Theme(
      data: Theme.of(context).copyWith(
        textTheme: Theme.of(context).textTheme.copyWith(
          bodyMedium: widget.autofillHintStyle ??
              TextStyle(
                fontSize: 14,
                color: MyColor.primaryButtonColor,
                fontWeight: FontWeight.w500,
                fontFamily: 'digital_font',
              ),
        ),
      ),
      child: TextFormField(
        enableInteractiveSelection: widget.enableInteractiveSelection,
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
          contentPadding: widget.contentPadding ??
              EdgeInsetsDirectional.only(
                  top: 0, start: 0, end: 0, bottom: 0),
          labelText: widget.labelText?.tr,
          labelStyle: regularDefault.copyWith(
              color: MyColor.getLabelTextColor()),
          fillColor: widget.fillColor,
          filled: true,
          border: UnderlineInputBorder(
            borderSide: BorderSide(
                width: 0.5,
                color: MyColor.getTextFieldDisableBorder()),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 0.5,
              color: widget.focusColor ??
                  MyColor.getTextFieldEnableBorder(),
            ),
            borderRadius: BorderRadius.circular(widget.radius!),
          ),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                  width: 0.5,
                  color: MyColor.getTextFieldDisableBorder())),
          prefixIconConstraints: BoxConstraints.loose(Size(40, 40)),
          suffixIcon: _buildSuffixIcon(),
        ),
        onFieldSubmitted: (text) => widget.nextFocus != null
            ? FocusScope.of(context).requestFocus(widget.nextFocus)
            : null,
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
          // Update the UI to show/hide clear icon based on text presence
          if (widget.clearTextOnSuffixTap) {
            setState(() {});
          }
        },
      ),
    );
  }

  void _toggle() {
    setState(() {
      obscureText = !obscureText;
    });
  }
}