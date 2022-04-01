import 'dart:core';

import 'package:e_commerce/src/models/result.dart';

class XPaginate<T> {
  String? message;

  List<T>? _data;

  List<T>? get data => _data;

  Status _status = Status.initial;
  bool get isInitial => _status == Status.initial;

  bool get isLoading => _status == Status.loading;

  bool get isCompleted => _status == Status.success;

  bool get isError => _status == Status.error;

  XPaginate.initial() {
    _status = Status.initial;
  }

  XPaginate.loading({this.message}) {
    _status = Status.loading;
  }

  XPaginate.completed(List<T>? data) {
    _data = data;
    message = '';
    _status = Status.success;
  }

  XPaginate.error(this.message) {
    _data = null;
    _status = Status.error;
  }

  XPaginate.result(XResult<List<T>> result) {
    message = result.error;
    _data = result.data;
    _status = result.isError ? Status.error : Status.success;
  }
}

enum Status { initial, loading, error, success }
