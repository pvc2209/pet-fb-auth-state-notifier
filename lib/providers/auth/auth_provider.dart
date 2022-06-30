import 'package:firebase_auth/firebase_auth.dart' as fbAuth;
import 'package:state_notifier/state_notifier.dart';

import '../../repositories/auth_repository.dart';
import 'auth_state.dart';

class AuthProvider extends StateNotifier<AuthState> with LocatorMixin {
  AuthProvider() : super(AuthState.unknown());

  @override
  void update(Locator watch) {
    final fbAuth.User? user = watch<fbAuth.User?>();
    if (user != null) {
      state = state.copyWith(
        user: user,
        authStatus: AuthStatus.authenticated,
      );
    } else {
      state = state.copyWith(authStatus: AuthStatus.unauthenticated);
    }

    print("state: $state");

    super.update(watch);
  }

  Future<void> signout() async {
    await read<AuthRepository>().signout();
  }
}
