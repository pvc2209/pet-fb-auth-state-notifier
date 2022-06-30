import 'package:equatable/equatable.dart';

import '../../models/custom_error.dart';

enum SigninStatus {
  initial,
  submitting,
  success,
  error,
}

class SigninState extends Equatable {
  final SigninStatus signinStatus;
  final CustomError error;

  SigninState({
    required this.signinStatus,
    required this.error,
  });

  factory SigninState.intial() {
    return SigninState(
      signinStatus: SigninStatus.initial,
      error: CustomError(),
    );
  }

  SigninState copyWith({
    SigninStatus? signinStatus,
    CustomError? error,
  }) {
    return SigninState(
      signinStatus: signinStatus ?? this.signinStatus,
      error: error ?? this.error,
    );
  }

  @override
  List<Object> get props => [signinStatus, error];
}
