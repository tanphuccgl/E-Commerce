import 'package:e_commerce/src/config/themes/my_colors.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/modules/rating_and_review/logic/review_bloc.dart';
import 'package:e_commerce/src/modules/rating_and_review/widgets/bottom_sheet_add_review.dart';
import 'package:e_commerce/src/widgets/bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class XButtonWriteReview extends StatelessWidget {
  final XProduct data;
  const XButtonWriteReview({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.edit),
        onPressed: () => {
          context.read<ReviewBloc>().initAddReview(),
          XBottomSheet.show(context,
              widget: XBottomSheetAddReview(data: data),
              backgroundColor: MyColors.colorBackground),
        },
        label: const Text('Write a review',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: MyColors.colorWhite,
                fontSize: 11,
                fontWeight: FontWeight.w600,
                height: 1.2)),
      ),
    );
  }
}
