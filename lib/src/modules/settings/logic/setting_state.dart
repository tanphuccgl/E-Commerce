part of 'setting_bloc.dart';

class SettingState extends AccountState {
   final String name;
  final bool pureName;
  final String birthDay;
  final bool pureBirthDay;

  String get isValidName {
    return pureName ? XUtils.isValidName(name) : "";
  }

  String get isValidBirthDay {
    return pureBirthDay ? XUtils.isValidBirthDay(birthDay) : "";
  }

  bool get isValidChangeInfo {
    return (XUtils.isValidBirthDay(birthDay) == "" &&
            XUtils.isValidName(name) == "")
        ? true
        : false;
  }

  SettingState({
    this.name = "",
    this.pureName = false,
    this.birthDay = "",
    this.pureBirthDay = false,
    XUser? data,
    bool isLoading = false,
  }) : super(data: data ?? XUser.empty(), isLoading: isLoading);

  @override
  List<Object?> get props => [name, pureName, birthDay, pureBirthDay,data,isLoading];

  @override
  SettingState copyWith({
    String? name,
    bool? pureName,
    String? birthDay,
    bool? pureBirthDay,
    XUser? data,
    bool? isLoading,
  }) {
    return SettingState(
        name: name ?? this.name,
        pureName: pureName ?? this.pureName,
        birthDay: birthDay ?? this.birthDay,
        pureBirthDay: pureBirthDay ?? this.pureBirthDay,
        data: data ?? this.data,
        isLoading: isLoading ?? this.isLoading);
  }
}
