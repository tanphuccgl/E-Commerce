import 'dart:io';

import 'package:e_commerce/src/models/handle.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

  void changeWithPhoto(bool value) {
    emit(state.copyWithItem(checkBoxWithPhoto: value));
  }
}
