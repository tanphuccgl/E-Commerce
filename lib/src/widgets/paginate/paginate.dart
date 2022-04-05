import 'dart:core';

import 'package:e_commerce/src/models/result.dart';

class XPaginate<T> {
  final String? message;

  final List<T>? data;

  PageStatus status;
  int page;

  bool hasMore;

  bool get canNext => hasMore == true && isLoading == false;

  T? get lastDoc {
    if (data?.isNotEmpty == true) {
      return data!.last;
    }
    return null;
  }

  // hasMore // còn sản phẩm
  // canNext  //có thể tải trang tiếp theo

  XPaginate(
      {this.message,
      this.hasMore = true,
      this.data,
      this.status = PageStatus.initial,
      this.page = 0});

  factory XPaginate.initial() {
    return XPaginate();
  }

  bool get isInitial => status == PageStatus.initial;

  bool get isLoading => status == PageStatus.loading;

  bool get isCompleted => status == PageStatus.success;

  bool get isError => status == PageStatus.error;

  XPaginate loading() {
    return XPaginate(data: data, page: page, status: PageStatus.loading);
  }

  XPaginate result(XResult<List<T>> result) {
    hasMore = (result.data ?? []).isEmpty ? false : true;
    status = result.status;

    final items = [
      ...data ?? [],
      ...result.data ?? [],
    ];
    if (canNext) {
      page++;
    }
    return XPaginate(
        status: status,
        message: result.error,
        data: items,
        page: page,
        hasMore: hasMore);
  }
}

enum PageStatus { initial, loading, error, success }
