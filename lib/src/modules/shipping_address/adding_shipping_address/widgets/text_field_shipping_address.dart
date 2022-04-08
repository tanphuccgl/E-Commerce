import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:flutter/material.dart';

class XTextFieldShippingAddress extends StatefulWidget {
  final String label;
  final TextInputType textInputType;
  final bool isShowPopUp;

  final Function(String) onChanged;
  final String errorText;
  final String value;
  final bool readOnly;
  final bool isAction;
  final Function()? onTap;
  const XTextFieldShippingAddress(
      {Key? key,
      required this.value,
      required this.label,
      required this.onChanged,
      required this.errorText,
      this.onTap,
      this.isAction = true,
      this.readOnly = false,
      this.isShowPopUp = false,
      this.textInputType = TextInputType.text})
      : super(key: key);

  @override
  State<XTextFieldShippingAddress> createState() =>
      _XTextFieldShippingAddressState();
}

class _XTextFieldShippingAddressState extends State<XTextFieldShippingAddress> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool isShowPopUp = false;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    isShowPopUp = widget.isShowPopUp;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant XTextFieldShippingAddress oldWidget) {
    if (_controller.text != widget.value) {
      _controller.text = widget.value;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget? _buildAction() {
    final List<Widget> actions = [];
    if (value.isNotEmpty && widget.isAction) {
      actions.add(IconButton(
        icon: const Icon(
          Icons.cancel,
          color: MyColors.colorGray,
        ),
        onPressed: () {
          widget.onChanged.call("");
        },
      ));
    }
    if (widget.isShowPopUp && widget.isAction) {
      actions.add(
        IconButton(
          iconSize: 15,
          icon: const Icon(
            Icons.arrow_forward_ios_rounded,
            color: MyColors.colorBlack,
          ),
          onPressed: widget.onTap,
        ),
      );
    }
    if (actions.isEmpty) {
      return null;
    }
    if (actions.length == 1) {
      return actions[0];
    }
    return Row(
      children: actions,
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Container(
        height: 80,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 8,
              offset: const Offset(0, 1),
              color: MyColors.colorWhite.withOpacity(0.05),
              spreadRadius: 1)
        ], borderRadius: BorderRadius.circular(4)),
        child: TextField(
          style: const TextStyle(
              fontSize: 14,
              height: 1.5,
              color: MyColors.colorBlack,
              fontWeight: FontWeight.w400),
          readOnly: widget.readOnly,
          controller: _controller,
          onChanged: widget.onChanged,
          decoration: InputDecoration(
              labelText: widget.label,
              suffixIcon: _buildAction(),
              errorText: widget.errorText,
              errorStyle: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
              border: InputBorder.none,
              hintText: widget.label,
              labelStyle: const TextStyle(
                  fontSize: 14,
                  height: 0.1,
                  color: MyColors.colorGray,
                  fontWeight: FontWeight.w500),
              hintStyle: const TextStyle(
                  fontSize: 11,
                  height: 1,
                  color: MyColors.colorGray,
                  fontWeight: FontWeight.normal),
              fillColor: MyColors.colorWhite,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 22)),
          keyboardType: widget.textInputType,
          maxLines: 1,
          minLines: 1,
          onTap: widget.onTap,
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
