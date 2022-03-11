import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/config/themes/style.dart';
import 'package:e_commerce/src/modules/cart/widgets/icon_circle_button.dart';
import 'package:flutter/material.dart';

class PromoCodeWidget extends StatefulWidget {
  final Function(String) onChanged;

  final String value;

  final bool isAction;

  const PromoCodeWidget({
    Key? key,
    required this.value,
    required this.onChanged,
    this.isAction = true,
  }) : super(key: key);

  @override
  State<PromoCodeWidget> createState() => _PromoCodeWidgetState();
}

class _PromoCodeWidgetState extends State<PromoCodeWidget> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool obscureText = false;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant PromoCodeWidget oldWidget) {
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
    const radiusRight = Radius.circular(35);
    const radiusLeft = Radius.circular(8);
    // TODO: show clear text
    return SizedBox(
      height: 36,
      child: Stack(
        children: [
          Container(
            height: 36,
            decoration: BoxDecoration(
                color: MyColors.colorWhite,
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 1),
                      blurRadius: 25,
                      color: MyColors.colorShadowCircle.withOpacity(0.08),
                      spreadRadius: 1)
                ],
                borderRadius: const BorderRadius.only(
                    bottomLeft: radiusLeft,
                    bottomRight: radiusRight,
                    topLeft: radiusLeft,
                    topRight: radiusRight)),
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: TextField(
                style: XStyle.textTheme().titleSmall,
                controller: _controller,
                onChanged: widget.onChanged,
                decoration: InputDecoration(
                  suffixIcon: _buildAction(),
                  border: InputBorder.none,
                  hintText: 'Enter your promo code',
                  labelStyle: XStyle.textTheme().labelLarge,
                  hintStyle: const TextStyle(
                      color: MyColors.colorGray,
                      height: 1.42,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  fillColor: MyColors.colorWhite,
                ),
                maxLines: 1,
                minLines: 1,
              ),
            ),
          ),
          Positioned(
            right: 0,
            child: SizedBox(
              width: 36,
              height: 36,
              child: IconCircleButton(
                icon:
                    const Icon(Icons.arrow_forward, color: MyColors.colorWhite),
                primary: MyColors.colorBlack,
                onPressed: () {},
                onPrimary: MyColors.colorWhite,
              ),
            ),
          )
        ],
      ),
    );
  }
}
