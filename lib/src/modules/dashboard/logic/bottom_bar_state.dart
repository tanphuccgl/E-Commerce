part of "bottom_bar_bloc.dart";

class BottomBarState extends Equatable {
  final String name;
  final int index;

  const BottomBarState(this.name, this.index);

  @override
  List<Object> get props => [name, index];
}
