part of 'userfrom_bloc.dart';
class UserfromState extends Equatable {
  final bool isSubmit;

  final UserTextBoxController sch = UserTextBoxController();

  UserfromState({this.isSubmit = false});

  UserfromState copyWith({bool? isSubmit}) {
    return UserfromState(
      isSubmit: isSubmit ?? this.isSubmit,

    );
  }

  @override
  List<Object> get props => [isSubmit];
}
