import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:simplemessage/controller/ui/usertextboxcontroller.dart';

part 'userfrom_event.dart';
part 'userfrom_state.dart';
class UserfromBloc extends Bloc<UserfromEvent, UserfromState> {
  UserfromBloc() : super(UserfromState()) {
    on<ToggleIsSubmitting>(_toggleIsSubmitting);
  }

  void _toggleIsSubmitting(ToggleIsSubmitting event, Emitter<UserfromState> emit) {
    emit(
      state.copyWith(isSubmit: event.isSubmiting),
    );
  }
}
