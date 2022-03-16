part of 'review_bloc.dart';
//TODO
class ReviewState extends Equatable {
  double ratingScore({required XProduct data}) {
    var items = data.listReview ?? [];
    var totalStar = 0;
    for (int i = 0; i < items.length; i++) {
      totalStar = totalStar + items[i].star;
    }
    return totalStar / items.length;
  }

  int numberReview({required XProduct data}) {
    List<XReview> items =
        (data.listReview ?? []).where((e) => e.content != null).toList();
    return items.length;
  }

  @override
  List<Object?> get props => throw UnimplementedError();
}
