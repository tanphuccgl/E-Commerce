import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';

class Paginate extends StatefulWidget {
  final Function() fetchNextData;
  final Widget? header;
  final Widget? footer;
  final Widget body;
  final bool isLoading;
  const Paginate(
      {Key? key,
      this.header,
      this.isLoading = false,
      this.footer,
      required this.body,
      required this.fetchNextData})
      : super(key: key);

  @override
  State<Paginate> createState() => _PaginateState();
}

class _PaginateState extends State<Paginate> {
  ScrollController controller = ScrollController();
  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: controller,
      physics: const BouncingScrollPhysics(),
      slivers: [
        widget.header ?? const SliverToBoxAdapter(child: SizedBox.shrink()),
        widget.body,
        SliverToBoxAdapter(
          child: widget.isLoading
              ? const Padding(
                  padding: EdgeInsets.all(5),
                  child: SizedBox(
                    height: 40,
                    width: 30,
                    child: Center(
                      child: XStateLoadingWidget(),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),
        widget.footer ?? const SliverToBoxAdapter(child: SizedBox.shrink()),
      ],
    );
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      widget.fetchNextData();
    }
  }
}
