import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/modules/dashboard/router/dashboard_router.dart';
import 'package:e_commerce/src/modules/product/logic/list_products_filter_bloc.dart';
import 'package:e_commerce/src/widgets/app_bar/search_app_bar.dart';
import 'package:e_commerce/src/widgets/state/state_error_widget.dart';
import 'package:e_commerce/src/widgets/state/state_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsByCategoryPage extends StatelessWidget {
  const SearchProductsByCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListProductsFilterBloc, ListProductsFilterState>(
        builder: (context, state) {
      var items = state.searchList.data ?? [];
      XHandle handle = XHandle.result(XResult.success(items));
      if (handle.isCompleted) {
        return Scaffold(
            appBar: XSearchAppBar(
              onChanged: (value) =>
                  context.read<ListProductsFilterBloc>().searchProduct(value),
              value: state.searchText,
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  leading: Image.network(
                    item.image ?? '',
                    fit: BoxFit.fill,
                    width: 50,
                    height: 50,
                  ),
                  onTap: () => DashboardCoordinator.showDetailsProduct(context,
                      data: item, id: item.id),
                  title: Text(item.name),
                  subtitle: Text(item.type),
                );
              },
              itemCount: items.length,
            ));
      } else if (handle.isLoading) {
        return const XStateLoadingWidget();
      } else {
        return const XStateErrorWidget();
      }
    });
  }
}
