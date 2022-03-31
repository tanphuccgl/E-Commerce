import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_widget.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/error_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/init_loader.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/load_more_widget.dart';
import 'package:flutter/material.dart';

class Paginate extends StatefulWidget {
  final Function() fetchNextData;
  final Function() reloadData;
  final Function() fetchData;
  final Widget? header;
  final Widget? footer;
  final Widget body;
  final bool isLoadMore;
  final bool isEndList;

  final XHandle handle;
  const Paginate(
      {Key? key,
      this.header,
      required this.fetchData,
      required this.isLoadMore,
      required this.isEndList,
      required this.handle,
      this.footer,
      required this.reloadData,
      required this.body,
      required this.fetchNextData})
      : super(key: key);

  @override
  State<Paginate> createState() => _PaginateState();
}

class _PaginateState extends State<Paginate> {
  late ScrollController controller = ScrollController();

  @override
  void initState() {
    super.initState();
    controller.addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.handle.isInitial || widget.handle.isLoading) {
      if (widget.handle.isInitial) {
        widget.fetchData();
      }
      return const InitialLoader();
    } else if (widget.handle.isCompleted) {
      return NestedScrollView(
        controller: controller,
        body: RefreshIndicator(
          onRefresh: () => widget.reloadData(),
          child: CustomScrollView(
            slivers: [
              ((widget.handle.data ?? []).isEmpty)
                  ? const EmptyDisplay()
                  : widget.body,
              widget.isLoadMore ? const LoadMoreWidget() : const EmptyWidget(),
              widget.footer ?? const EmptyWidget(),
            ],
          ),
        ),
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
            [widget.header ?? const EmptyWidget()],
      );
    } else {
      return ErrorDisplay(exception: Exception('Please try again later'));
    }
  }

  void _scrollListener() {
    if ((controller.offset >= controller.position.maxScrollExtent)) {
      widget.isEndList ? null : widget.fetchNextData();
    }
  }
}
