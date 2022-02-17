import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_state.dart';

class SignBloc<T extends SignState> extends Cubit<T> {
  SignBloc(T initialState) : super(initialState);
}
