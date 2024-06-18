part of 'userfrom_bloc.dart';


sealed class UserfromEvent {}
class ToggleIsSubmitting extends UserfromEvent {
  bool isSubmiting;
  ToggleIsSubmitting({required this.isSubmiting });
}

