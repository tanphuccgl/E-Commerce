import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/widgets/paginate/handle_paginate.dart';
import 'package:e_commerce/src/widgets/paginate/logic/paginate_bloc.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/bottom_loader.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/empty_widget.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/error_display.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/init_loader.dart';
import 'package:e_commerce/src/widgets/paginate/widgets/top_loader.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//TODO
class Paginate extends StatefulWidget {
  final List list;
  final Function() fetchNextData;
  final Widget? header;
  final Widget? footer;
  final Widget body;
  const Paginate(
      {Key? key,
      this.header,
      required this.list,
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
    var items = widget.list;

    return BlocProvider(
      create: (context) => PaginateBloc(),
      child: BlocBuilder<PaginateBloc, PaginateState>(
        builder: (context, state) {
          if (state.paginationStatus == PaginationStatus.initial) {
            context.read<PaginateBloc>().getItems(items: items);
            return const InitialLoader();
          } else if (state.paginationStatus == PaginationStatus.empty) {
            return CustomScrollView(
              slivers: [
                widget.header ?? const EmptyWidget(),
                state.isRefresh ? const TopLoader() : const EmptyWidget(),
                const EmptyDisplay(),
                widget.footer ?? const EmptyWidget(),
              ],
            );
          } else if (state.paginationStatus == PaginationStatus.loading) {
            return const InitialLoader();
          } else if (state.paginationStatus == PaginationStatus.loader) {
            return CustomScrollView(
              controller: controller,
              physics: const BouncingScrollPhysics(),
              slivers: [
                widget.header ?? const EmptyWidget(),
                state.isRefresh ? const TopLoader() : const EmptyWidget(),
                widget.body,
                state.isLoadingMore
                    ? const BottomLoader()
                    : const EmptyWidget(),
                widget.footer ?? const EmptyWidget(),
              ],
            );
          } else {
            return ErrorDisplay(exception: Exception('Please try again later'));
          }
        },
      ),
    );
  }

  void _scrollListener() {
    if (controller.offset >= controller.position.maxScrollExtent &&
        !controller.position.outOfRange) {
      widget.fetchNextData();
    }
  }
}
