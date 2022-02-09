part of "bottom_bar_bloc.dart";

class BottomBarState extends Equatable {
  final PageIndex index;

  const BottomBarState({this.index = PageIndex.home});

  @override
  List<Object> get props => [index];

  BottomBarState copyWith({
    PageIndex? index,
  }) {
    return BottomBarState(
      index: index ?? this.index,
    );
  }
}

enum PageIndex {
  home,
  shop,
  bag,
  favorite,
  profile,
}

extension PageIndexExt on PageIndex {
  String lableOf() {
    // TODO
    return 'TODO';
  }

  Widget iconOf() {
    switch (this) {
      case PageIndex.home:
        return const Icon(Icons.home_outlined);
      // TODO
      default:
        return const Icon(Icons.abc);
    }
  }
}
