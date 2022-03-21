import 'dart:io';

import 'package:e_commerce/src/config/routes/coordinator.dart';
import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:e_commerce/src/models/users_model.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/utils/utils.dart';
import 'package:e_commerce/src/widgets/snackbar/snackbar.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'review_state.dart';

class ReviewBloc extends Cubit<ReviewState> {
  final XProduct product;
  ReviewBloc({required this.product})
      : super(ReviewState(items: XHandle.completed([]))) {
    getReviews(product: product);
  }

  final Domain domain = Domain();

  Future<void> getReviews({required XProduct product}) async {
    User? currentUser = AuthService().currentUser;
    final value = await domain.review.getAllReview(product: product);
    if (value.isSuccess) {
      List<XReview> items = [...(state.items.data ?? [])];
      items = (value.data ?? [])
          .where((e) => e.idUser == currentUser?.uid)
          .toList();
      emit(state.copyWithItem(items: XHandle.completed(items)));
    } else {}
  }

  Future<void> setReviews({required XProduct product}) async {
    final value = await domain.review.setReviews(product: product);
    if (value.isSuccess) {
      emit(state.copyWithItem(items: XHandle.completed(value.data ?? [])));
    }
  }

  Future<void> addYourReview(
    BuildContext context, {
    required XProduct product,
    required XUser user,
  }) async {
    var valueImage = await domain.review
        .uploadImageReview(list: state.imageReviewList ?? []);
    if (valueImage.isSuccess) {
      XReview xReview = XReview(
          content: state.reviewText,
          id: product.id,
          imageAvatar: user.urlAvatar,
          images: valueImage.data,
          name: user.name ?? 'N/A',
          star: state.yourRating,
          time: XUtils.dateTimeReview(),
          idUser: user.id);
      final value =
          await domain.review.addYourReview(product: product, review: xReview);

      if (value.isSuccess) {
        final List<XReview> items = [
          ...(state.items.data ?? []),
          value.data ?? XReview()
        ];
        emit(state.copyWithItem(items: XHandle.completed(items)));

        XSnackBar.show(msg: 'Add your review success');
        XCoordinator.pop(context);
      }
    } else {
      XSnackBar.show(msg: 'Add your review failure');
    }
  }

  void changeWithPhoto(bool value) {
    emit(state.copyWithItem(checkBoxWithPhoto: value));
  }

  void chooseStar(int value) {
    emit(state.copyWithItem(yourRating: value + 1));
  }

  void changeReviewText(String value) {
    emit(state.copyWithItem(reviewText: value));
  }

  Future<void> addImageToReview() async {
    final ImagePicker _picker = ImagePicker();
    XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
    );
    File _image = File((image!).path);

    final List<File> items = [...(state.fileImageList ?? []), _image];
    final List<XFile> items2 = [...(state.imageReviewList ?? []), image];

    emit(state.copyWithItem(fileImageList: items, imageReviewList: items2));
  }

  void removeImageToReview(File file) {
    final List<File> items = [...(state.fileImageList ?? [])];
    final List<XFile> items2 = [...(state.imageReviewList ?? [])];
    XFile xFile = XFile(file.path);

    items.remove(file);
    items2.remove(xFile);

    emit(state.copyWithItem(fileImageList: items, imageReviewList: items2));
  }

  Future<void> initAddReview() async {
    await Future.delayed(Duration.zero);
    emit(state.copyWithItem(
        fileImageList: [], reviewText: '', yourRating: 0, imageReviewList: []));
  }
}
