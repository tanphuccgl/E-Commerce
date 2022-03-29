import 'dart:core';
import 'package:e_commerce/src/models/result.dart';

class XHandlePaginate<T> {
  String? message;

  T? _data;

  T? get data => _data;

  StatusPaginate _status = StatusPaginate.initial;
  bool get isInitial => _status == StatusPaginate.initial;

  bool get isLoading => _status == StatusPaginate.loading;

  bool get isLoader => _status == StatusPaginate.loader;

  bool get isError => _status == StatusPaginate.error;

  XHandlePaginate.initial() {
    _status = StatusPaginate.initial;
  }
  XHandlePaginate.loading({this.message}) {
    _status = StatusPaginate.loading;
  }

  XHandlePaginate.completed(T data) {
    _data = data;
    message = '';
    _status = StatusPaginate.loader;
  }

  XHandlePaginate.error(this.message) {
    _data = null;
    _status = StatusPaginate.error;
  }

  XHandlePaginate.result(XResult<T> result) {
    message = result.error;
    _data = result.data;
    _status = result.isError ? StatusPaginate.error : StatusPaginate.loader;
  }
}

enum StatusPaginate {
  initial,
  loading,
  loader,
  error,
}
