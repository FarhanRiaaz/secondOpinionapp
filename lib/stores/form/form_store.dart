import 'package:second_opinion_app/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:validators/validators.dart';

part 'form_store.g.dart';

class FormStore = _FormStore with _$FormStore;

abstract class _FormStore with Store {
  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  _FormStore() {
    _setupValidations();
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupValidations() {
    _disposers = [
      reaction((_) => userEmail, validateUserEmail),
      reaction((_) => name, validateName),
      reaction((_) => password, validatePassword),
      reaction((_) => confirmPassword, validateConfirmPassword)
    ];
  }

  // store variables:-----------------------------------------------------------
  @observable
  bool showPassword = true;

  @observable
  bool showPasswordRegistration = true;

  @observable
  bool showConfirmPasswordRegistration = true;

  @observable
  String userEmail = '';

  @observable
  String name = '';

  @observable
  bool checkBox = false;

  @observable
  String password = '';

  @observable
  String confirmPassword = '';

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @computed
  bool get canLogin => !formErrorStore.hasErrorsInLogin && userEmail.isNotEmpty && password.isNotEmpty;

  @computed
  bool get canRegister =>
      !formErrorStore.hasErrorsInRegister &&
      userEmail.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty &&
      name.isNotEmpty &&
      checkBox != false;

  @computed
  bool get canForgetPassword => !formErrorStore.hasErrorInForgotPassword && userEmail.isNotEmpty;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    userEmail = value;
  }

  @action
  void toggleCheckbox(bool value) {
    checkBox = value;
  }

  @action
  void toggleShowPassword() {
    this.showPassword = !this.showPassword;
  }

  @action
  void toggleShowPasswordRegistration() {
    this.showPasswordRegistration = !this.showPasswordRegistration;
  }

  @action
  void toggleShowConfirmPasswordRegistration() {
    this.showConfirmPasswordRegistration = !this.showConfirmPasswordRegistration;
  }

  @action
  void setName(String value) {
    name = value;
  }

  @action
  void setPassword(String value) {
    password = value;
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  @action
  void validateUserEmail(String value) {
    if (value.isEmpty) {
      formErrorStore.userEmail = "Email can't be empty";
    } else if (!isEmail(value)) {
      formErrorStore.userEmail = 'Please enter a valid email address';
    } else {
      formErrorStore.userEmail = null;
    }
  }

  @action
  void validateName(String value) {
    if (value.isEmpty) {
      formErrorStore.name = "Name can't be empty";
    } else if (value.length < 4) {
      formErrorStore.name = "Name must be at-least 4 characters long";
    } else {
      formErrorStore.name = null;
    }
  }

  @action
  void validatePassword(String password) {
    if (password.isEmpty) {
      formErrorStore.password = "Password can't be empty";
    } else if (password.length < 8) {
      formErrorStore.password = "Password must be at least 8 characters long";
    }
    //todo shahzaib uncommnet this
    // else if (!RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=]?)[a-zA-Z\d@#$%^&+=]{8,}$').hasMatch(password)) {
    //   formErrorStore.password =
    //   "Password must contain at least 1 uppercase letter, 1 lowercase letter, 1 number, and may include special characters";
    // }
    else {
      formErrorStore.password = null;
    }
  }


  @action
  void validateConfirmPassword(String value) {
    if (value.isEmpty) {
      formErrorStore.confirmPassword = "Confirm password can't be empty";
    } else if (value != password) {
      formErrorStore.confirmPassword = "Password does not match";
    } else {
      formErrorStore.confirmPassword = null;
    }
  }

  @action
  Future register() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 2000)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future login() async {
    loading = true;

    Future.delayed(Duration(milliseconds: 250)).then((future) {
      loading = false;
      success = true;
    }).catchError((e) {
      loading = false;
      success = false;
      errorStore.errorMessage = e.toString().contains("ERROR_USER_NOT_FOUND")
          ? "Username and password doesn't match"
          : "Something went wrong, please check your internet connection and try again";
      print(e);
    });
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future logout() async {
    loading = true;
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }

  void validateAll() {
    validatePassword(password);
    validateUserEmail(userEmail);
    validateName(name);
  }
}

class FormErrorStore = _FormErrorStore with _$FormErrorStore;

abstract class _FormErrorStore with Store {
  @observable
  String? userEmail;

  @observable
  String? password;

  @observable
  String? name;

  @observable
  String? confirmPassword;

  @observable
  bool? checkBox;

  @computed
  bool get hasErrorsInLogin => userEmail != null || password != null;

  @computed
  bool get hasErrorsInRegister =>
      name != null || userEmail != null || password != null || confirmPassword != null || checkBox != null;

  @computed
  bool get hasErrorInForgotPassword => userEmail != null;
}
