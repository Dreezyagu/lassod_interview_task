part of 'signup_cubit.dart';

@immutable
abstract class SignupState {}


// various state of the SignUpCubit
class SignupInitial extends SignupState {}

class SignupLoading extends SignupState {}

class SignupLoaded extends SignupState {}

class SignupError extends SignupState {}
