import 'dart:core';

import 'package:e_commerce/src/models/result.dart';

class XPaginate<T> {
  final String? message;

  final List<T>? data;

  final Status status;

  // hasMore
  // canNext
  // hiện tại là trang nào. và làm sao để load trang tiếp theo
  //

  XPaginate({
    this.message,
    this.data,
    this.status = Status.initial,
  });

  factory XPaginate.initial() {
    return XPaginate();
  }

  bool get isInitial => status == Status.initial;

  bool get isLoading => status == Status.loading;

  bool get isCompleted => status == Status.success;

  bool get isError => status == Status.error;

  XPaginate loading(XResult<List<T>> result) {
    // TODO:
  }

  XPaginate result(XResult<List<T>> result) {
    final items = [
      ...[data ?? []],
      ...[result.data ?? []],
    ];
    // hasMore
    // canNext
    return XPaginate(status: result.status, message: result.error, data: items);
  }
}

enum Status { initial, loading, error, success }
