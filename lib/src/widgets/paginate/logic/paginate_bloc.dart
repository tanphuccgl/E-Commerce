import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/src/models/products_model.dart';
import 'package:e_commerce/src/models/result.dart';
import 'package:e_commerce/src/repositories/domain.dart';
import 'package:e_commerce/src/repositories/firestore/services/auth_service.dart';
import 'package:e_commerce/src/widgets/paginate/paginate.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'paginate_state.dart';

// TODO: abstract class
abstract class PaginateBloc extends Cubit<PaginateState> {
  PaginateBloc(PaginateState initialState) : super(initialState);

  Domain domain = Domain();

  // TODO: abstract function and override when extend
  Future<void> fetchFirstData();

  // TODO: abstract function and override when extend
  Future<void> fetchNextData();
}
