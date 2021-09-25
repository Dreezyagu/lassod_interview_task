import 'package:bloc/bloc.dart';
import 'package:lassod_interview_task/utils/network_service.dart';
import 'package:meta/meta.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignupInitial());

// function to run the sign up api call and emit Cubit states respectively
  Future signUp(
      {required String fullname,
      required String password,
      required String email}) async {
    emit(SignupLoading());
    final response = await NetworkService.signUp(
        fullname: fullname, password: password, email: email);

    if (response != null) {
      emit(SignupLoaded());
    } else {
      emit(SignupError());
    }
  }
}
