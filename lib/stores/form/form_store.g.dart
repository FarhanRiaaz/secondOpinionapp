// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$FormStore on _FormStore, Store {
  Computed<bool>? _$canLoginComputed;

  @override
  bool get canLogin => (_$canLoginComputed ??=
          Computed<bool>(() => super.canLogin, name: '_FormStore.canLogin'))
      .value;
  Computed<bool>? _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister,
              name: '_FormStore.canRegister'))
          .value;
  Computed<bool>? _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??= Computed<bool>(
          () => super.canForgetPassword,
          name: '_FormStore.canForgetPassword'))
      .value;

  late final _$showPasswordAtom =
      Atom(name: '_FormStore.showPassword', context: context);

  @override
  bool get showPassword {
    _$showPasswordAtom.reportRead();
    return super.showPassword;
  }

  @override
  set showPassword(bool value) {
    _$showPasswordAtom.reportWrite(value, super.showPassword, () {
      super.showPassword = value;
    });
  }

  late final _$showPasswordRegistrationAtom =
      Atom(name: '_FormStore.showPasswordRegistration', context: context);

  @override
  bool get showPasswordRegistration {
    _$showPasswordRegistrationAtom.reportRead();
    return super.showPasswordRegistration;
  }

  @override
  set showPasswordRegistration(bool value) {
    _$showPasswordRegistrationAtom
        .reportWrite(value, super.showPasswordRegistration, () {
      super.showPasswordRegistration = value;
    });
  }

  late final _$showConfirmPasswordRegistrationAtom = Atom(
      name: '_FormStore.showConfirmPasswordRegistration', context: context);

  @override
  bool get showConfirmPasswordRegistration {
    _$showConfirmPasswordRegistrationAtom.reportRead();
    return super.showConfirmPasswordRegistration;
  }

  @override
  set showConfirmPasswordRegistration(bool value) {
    _$showConfirmPasswordRegistrationAtom
        .reportWrite(value, super.showConfirmPasswordRegistration, () {
      super.showConfirmPasswordRegistration = value;
    });
  }

  late final _$userEmailAtom =
      Atom(name: '_FormStore.userEmail', context: context);

  @override
  String get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$nameAtom = Atom(name: '_FormStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$checkBoxAtom =
      Atom(name: '_FormStore.checkBox', context: context);

  @override
  bool get checkBox {
    _$checkBoxAtom.reportRead();
    return super.checkBox;
  }

  @override
  set checkBox(bool value) {
    _$checkBoxAtom.reportWrite(value, super.checkBox, () {
      super.checkBox = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormStore.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormStore.confirmPassword', context: context);

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$successAtom = Atom(name: '_FormStore.success', context: context);

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

  late final _$loadingAtom = Atom(name: '_FormStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('_FormStore.register', context: context);

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$loginAsyncAction =
      AsyncAction('_FormStore.login', context: context);

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$forgotPasswordAsyncAction =
      AsyncAction('_FormStore.forgotPassword', context: context);

  @override
  Future<dynamic> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  late final _$logoutAsyncAction =
      AsyncAction('_FormStore.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$_FormStoreActionController =
      ActionController(name: '_FormStore', context: context);

  @override
  void setUserId(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleCheckbox(bool value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.toggleCheckbox');
    try {
      return super.toggleCheckbox(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowPassword() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.toggleShowPassword');
    try {
      return super.toggleShowPassword();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowPasswordRegistration() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.toggleShowPasswordRegistration');
    try {
      return super.toggleShowPasswordRegistration();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void toggleShowConfirmPasswordRegistration() {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.toggleShowConfirmPasswordRegistration');
    try {
      return super.toggleShowConfirmPasswordRegistration();
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo =
        _$_FormStoreActionController.startAction(name: '_FormStore.setName');
    try {
      return super.setName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.setConfirmPassword');
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateUserEmail');
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateName(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateName');
    try {
      return super.validateName(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String password) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validatePassword');
    try {
      return super.validatePassword(password);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_FormStoreActionController.startAction(
        name: '_FormStore.validateConfirmPassword');
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_FormStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showPassword: ${showPassword},
showPasswordRegistration: ${showPasswordRegistration},
showConfirmPasswordRegistration: ${showConfirmPasswordRegistration},
userEmail: ${userEmail},
name: ${name},
checkBox: ${checkBox},
password: ${password},
confirmPassword: ${confirmPassword},
success: ${success},
loading: ${loading},
canLogin: ${canLogin},
canRegister: ${canRegister},
canForgetPassword: ${canForgetPassword}
    ''';
  }
}

mixin _$FormErrorStore on _FormErrorStore, Store {
  Computed<bool>? _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??= Computed<bool>(
          () => super.hasErrorsInLogin,
          name: '_FormErrorStore.hasErrorsInLogin'))
      .value;
  Computed<bool>? _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister,
              name: '_FormErrorStore.hasErrorsInRegister'))
      .value;
  Computed<bool>? _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword,
              name: '_FormErrorStore.hasErrorInForgotPassword'))
      .value;

  late final _$userEmailAtom =
      Atom(name: '_FormErrorStore.userEmail', context: context);

  @override
  String? get userEmail {
    _$userEmailAtom.reportRead();
    return super.userEmail;
  }

  @override
  set userEmail(String? value) {
    _$userEmailAtom.reportWrite(value, super.userEmail, () {
      super.userEmail = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: '_FormErrorStore.password', context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$nameAtom = Atom(name: '_FormErrorStore.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$confirmPasswordAtom =
      Atom(name: '_FormErrorStore.confirmPassword', context: context);

  @override
  String? get confirmPassword {
    _$confirmPasswordAtom.reportRead();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String? value) {
    _$confirmPasswordAtom.reportWrite(value, super.confirmPassword, () {
      super.confirmPassword = value;
    });
  }

  late final _$checkBoxAtom =
      Atom(name: '_FormErrorStore.checkBox', context: context);

  @override
  bool? get checkBox {
    _$checkBoxAtom.reportRead();
    return super.checkBox;
  }

  @override
  set checkBox(bool? value) {
    _$checkBoxAtom.reportWrite(value, super.checkBox, () {
      super.checkBox = value;
    });
  }

  @override
  String toString() {
    return '''
userEmail: ${userEmail},
password: ${password},
name: ${name},
confirmPassword: ${confirmPassword},
checkBox: ${checkBox},
hasErrorsInLogin: ${hasErrorsInLogin},
hasErrorsInRegister: ${hasErrorsInRegister},
hasErrorInForgotPassword: ${hasErrorInForgotPassword}
    ''';
  }
}
