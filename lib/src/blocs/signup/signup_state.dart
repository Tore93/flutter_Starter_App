part of 'signup_bloc.dart';

class SignUpState extends Equatable {
  const SignUpState({
    @required this.isEmailValid,
    @required this.isPasswordValid,
    @required this.isTOSPrivacyAccepted,
    @required this.isSubmitting,
    @required this.isSuccess,
    @required this.user,
    this.exceptionRaised,
  });

  factory SignUpState.empty() {
    return const SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  factory SignUpState.loading() {
    return const SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: true,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  factory SignUpState.failure(AppException exception) {
    return SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: exception,
    );
  }

  factory SignUpState.success(FirebaseUser user) {
    return SignUpState(
      isEmailValid: true,
      isPasswordValid: true,
      isTOSPrivacyAccepted: true,
      isSubmitting: false,
      isSuccess: true,
      user: user,
      exceptionRaised: null,
    );
  }

  final bool isEmailValid, isPasswordValid;
  final bool isTOSPrivacyAccepted, isSubmitting, isSuccess;
  final FirebaseUser user;
  final AppException exceptionRaised;

  @override
  List<Object> get props => <Object>[
        isEmailValid,
        isPasswordValid,
        isTOSPrivacyAccepted,
        isSubmitting,
        isSuccess,
        user,
        exceptionRaised,
      ];

  bool get isFormValid => isEmailValid && isPasswordValid;

  bool get isFailure => exceptionRaised != null;

  SignUpState update({
    bool isEmailValid,
    bool isPasswordValid,
    bool isTOSPrivacyAccepted,
  }) {
    return copyWith(
      isEmailValid: isEmailValid,
      isPasswordValid: isPasswordValid,
      isTOSPrivacyAccepted: isTOSPrivacyAccepted,
      isSubmitting: false,
      isSuccess: false,
      user: null,
      exceptionRaised: null,
    );
  }

  SignUpState copyWith({
    bool isEmailValid,
    bool isPasswordValid,
    bool isTOSPrivacyAccepted,
    bool isSubmitEnabled,
    bool isSubmitting,
    FirebaseUser user,
    bool isSuccess,
    AppException exceptionRaised,
  }) {
    return SignUpState(
      isEmailValid: isEmailValid ?? this.isEmailValid,
      isPasswordValid: isPasswordValid ?? this.isPasswordValid,
      isTOSPrivacyAccepted: isTOSPrivacyAccepted ?? this.isTOSPrivacyAccepted,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      user: user,
      exceptionRaised: exceptionRaised,
    );
  }

  @override
  String toString() => '''SignUpState {
      isEmailValid: $isEmailValid,
      isPasswordValid: $isPasswordValid,
      isTOSPrivacyAccepted: $isTOSPrivacyAccepted,
      isSubmitting: $isSubmitting,
      isSuccess: $isSuccess,
      user: $user,
      isFailure: $isFailure - "${exceptionRaised.toString()}",
    }''';
}
