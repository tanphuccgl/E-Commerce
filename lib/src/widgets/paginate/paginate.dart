import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/bottom_loader.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_widget.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/error_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/init_loader.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/top_loader.dart';
import 'package:flutter/material.dart';

class Paginate extends StatefulWidget {
  final PaginationStatus paginationStatus;
  final Function() fetchNextData;
  final Function() reloadData;
  final Function() fetchData;
  final Widget? header;
  final Widget? footer;
  final Widget body;
  final bool isRefresh;
  final bool isLoadingMore;
  const Paginate(
      {Key? key,
      this.paginationStatus = PaginationStatus.initial,
      this.header,
      required this.fetchData,
      this.isLoadingMore = false,
      this.isRefresh = false,
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
    if (widget.paginationStatus == PaginationStatus.initial) {
      widget.fetchData();
      return const InitialLoader();
    } else if (widget.paginationStatus == PaginationStatus.empty) {
      return CustomScrollView(
        slivers: [
          widget.header ?? const EmptyWidget(),
          widget.isRefresh ? const TopLoader() : const EmptyWidget(),
          const EmptyDisplay(),
          widget.isLoadingMore ? const BottomLoader() : const EmptyWidget(),
          widget.footer ?? const EmptyWidget(),
        ],
      );
    } else if (widget.paginationStatus == PaginationStatus.loading) {
      return const InitialLoader();
    } else if (widget.paginationStatus == PaginationStatus.loader) {
      return CustomScrollView(
        controller: controller,
        slivers: [
          widget.header ?? const EmptyWidget(),
          widget.isRefresh ? const TopLoader() : const EmptyWidget(),
          widget.body,
          widget.isLoadingMore ? const BottomLoader() : const EmptyWidget(),
          widget.footer ?? const EmptyWidget(),
        ],
      );
    } else {
      return ErrorDisplay(exception: Exception('Please try again later'));
    }
  }

  void _scrollListener() {
    if ((controller.offset >= controller.position.maxScrollExtent &&
            !controller.position.outOfRange) ||
        controller.position.extentAfter < 200) {
      widget.fetchNextData();
    }
    if (controller.offset <= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      widget.reloadData();
    }
  }
}
