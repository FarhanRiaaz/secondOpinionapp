import 'package:flutter/material.dart';
import 'package:second_opinion_app/models/authentication/login_user_response.dart';
import 'package:second_opinion_app/models/authentication/register_user_response.dart';
import 'package:second_opinion_app/stores/error/error_store.dart';
import 'package:mobx/mobx.dart';
import 'package:another_flushbar/flushbar_helper.dart';
import '../../data/repository/repository.dart';
import '../../utils/locale/app_localization.dart';
import '../form/form_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  // repository instance
  final Repository _repository;

  // store for handling form errors
  final FormErrorStore formErrorStore = FormErrorStore();

  // store for handling error messages
  final ErrorStore errorStore = ErrorStore();

  // bool to check if current user is logged in
  bool isLoggedIn = false;

  // constructor:---------------------------------------------------------------
  _UserStore(Repository repository) : this._repository = repository {
    // setting up disposers
    _setupDisposers();

    // checking if user is logged in
    repository.isLoggedIn.then((value) {
      this.isLoggedIn = value;
    });
  }

  // disposers:-----------------------------------------------------------------
  late List<ReactionDisposer> _disposers;

  void _setupDisposers() {
    _disposers = [
      reaction((_) => success, (_) => success = false, delay: 200),
    ];
  }

  // empty responses:-----------------------------------------------------------
  static ObservableFuture<LoginUserResponse> emptyLoginResponse = ObservableFuture.value(LoginUserResponse());

  static ObservableFuture<RegisterUserResponse> emptyRegisterResponse = ObservableFuture.value(RegisterUserResponse());

  // store variables:-----------------------------------------------------------
  @observable
  bool success = false;

  @observable
  User currentUser = User();

  @observable
  ObservableFuture<RegisterUserResponse> registerUserFuture = emptyRegisterResponse;

  @observable
  ObservableFuture<LoginUserResponse> loginFuture = emptyLoginResponse;

  @computed
  bool get isRegistrationInProcess => registerUserFuture.status == FutureStatus.pending;

  @computed
  bool get isLoginInProcess => loginFuture.status == FutureStatus.pending;

  // actions:-------------------------------------------------------------------

  @action
  Future register(String email, String password, String name, BuildContext context) async {
    final future = _repository.register(name, password, email);
    registerUserFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value.name != null) {
        currentUser = User(email: value.email, name: value.name);
      } else {
        print('failed to register\nEmail already exists!');
      }
    }).catchError((e) {
      print(e);
      FlushbarHelper.createError(
        message: 'Failed to register, Email Already Exists',
        title: AppLocalizations.of(context).translate('home_tv_error'),
        duration: Duration(seconds: 3),
      )..show(context);
      print('failed to register\nEmail already exists!\n ${e.toString()}');
      throw e;
    });
  }

  @action
  Future login(String email, String password, BuildContext context) async {
    final future = _repository.login(email, password);
    loginFuture = ObservableFuture(future);
    await future.then((value) async {
      if (value.token != null) {
        // saving informtion here
        _repository.saveAuthenticationToken(value.token!);
        print('You are logged IN!\n Tokken: ${value.token}');
      } else {
        print('failed to login\nInvalid creds are provided!');
      }
    }).catchError((e) {
      print(e);
      FlushbarHelper.createError(
        message: 'Invalid Credentials',
        title: AppLocalizations.of(context).translate('home_tv_error'),
        duration: Duration(seconds: 3),
      )..show(context);
      print('failed to login\nInvalid creds are provided!\n${e.toString()}');
      throw e;
    });
  }

  logout() {
    this.isLoggedIn = false;
    _repository.saveIsLoggedIn(false);
  }

  // general methods:-----------------------------------------------------------
  void dispose() {
    for (final d in _disposers) {
      d();
    }
  }
}
