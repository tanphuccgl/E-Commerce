import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/review_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'review_state.dart';
//TODO
class ReviewBloc extends Cubit<ReviewState> {
  ReviewBloc() : super(ReviewState());
}
