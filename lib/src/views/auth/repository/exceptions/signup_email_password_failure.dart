
class SignUpEmailPasswordFaliure {
  final String message;

  const SignUpEmailPasswordFaliure([this.message = "An error is occcured"]);

  factory SignUpEmailPasswordFaliure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpEmailPasswordFaliure(
            'Please enter a strong password.');
      case 'invalid-email':
        return const SignUpEmailPasswordFaliure('Email is not valid.');
      case 'email-already-in-use':
        return const SignUpEmailPasswordFaliure(
            'An account already exits for that email.');
      case 'opration-not-allowed':
        return const SignUpEmailPasswordFaliure(
            'Opration is not allowed. Please contact support.');
      case 'user-disabled':
        return const SignUpEmailPasswordFaliure(
            'This user has been disabled.Please contact for help.');

      default:
        return const SignUpEmailPasswordFaliure();
    }
  }
}
