import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/modules/home/logic/product_bloc.dart';
import 'package:e_commerce/src/modules/product_by_category/widgets/search_text_filed.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchProductsByCategoryPage extends StatelessWidget {
  const SearchProductsByCategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      var items = state.searchList ?? [];
      return Scaffold(
          appBar: AppBar(
              backgroundColor: MyColors.colorPrimary,
              title: Container(
                width: double.infinity,
                height: 40,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                child: Center(
                  child: SearchTextField(
                    onChanged: (value) =>
                        context.read<ProductBloc>().searchProduct(value),
                    value: state.searchText,
                  ),
                ),
              )),
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
                title: Text(item.name),
                subtitle: Text(item.type),
              );
            },
            itemCount: items.length,
          ));
    });
  }
}
