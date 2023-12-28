// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserStore on _UserStore, Store {
  Computed<bool>? _$isRegistrationInProcessComputed;

  @override
  bool get isRegistrationInProcess => (_$isRegistrationInProcessComputed ??=
          Computed<bool>(() => super.isRegistrationInProcess,
              name: '_UserStore.isRegistrationInProcess'))
      .value;
  Computed<bool>? _$isLoginInProcessComputed;

  @override
  bool get isLoginInProcess => (_$isLoginInProcessComputed ??= Computed<bool>(
          () => super.isLoginInProcess,
          name: '_UserStore.isLoginInProcess'))
      .value;

  late final _$successAtom = Atom(name: '_UserStore.success', context: context);

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  late final _$currentUserAtom =
      Atom(name: '_UserStore.currentUser', context: context);

  @override
  User get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$registerUserFutureAtom =
      Atom(name: '_UserStore.registerUserFuture', context: context);

  @override
  ObservableFuture<RegisterUserResponse> get registerUserFuture {
    _$registerUserFutureAtom.reportRead();
    return super.registerUserFuture;
  }

  @override
  set registerUserFuture(ObservableFuture<RegisterUserResponse> value) {
    _$registerUserFutureAtom.reportWrite(value, super.registerUserFuture, () {
      super.registerUserFuture = value;
    });
  }

  late final _$loginFutureAtom =
      Atom(name: '_UserStore.loginFuture', context: context);

  @override
  ObservableFuture<LoginUserResponse> get loginFuture {
    _$loginFutureAtom.reportRead();
    return super.loginFuture;
  }

  @override
  set loginFuture(ObservableFuture<LoginUserResponse> value) {
    _$loginFutureAtom.reportWrite(value, super.loginFuture, () {
      super.loginFuture = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_UserStore.register', context: context);

  @override
  Future<dynamic> register(
      String email, String password, String name, BuildContext context) {
    return _$registerAsyncAction
        .run(() => super.register(email, password, name, context));
  }

  late final _$loginAsyncAction =
      AsyncAction('_UserStore.login', context: context);

  @override
  Future<dynamic> login(String email, String password, BuildContext context) {
    return _$loginAsyncAction.run(() => super.login(email, password, context));
  }

  @override
  String toString() {
    return '''
success: ${success},
currentUser: ${currentUser},
registerUserFuture: ${registerUserFuture},
loginFuture: ${loginFuture},
isRegistrationInProcess: ${isRegistrationInProcess},
isLoginInProcess: ${isLoginInProcess}
    ''';
  }
}
