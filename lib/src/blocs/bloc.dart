import 'dart:async';
import 'validators.dart';
import 'package:rxdart/rxdart.dart';

class Bloc extends Validators {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();

  // Add data to stream
  Function(String) get changeEmail => _email.sink.add;
  Function(String) get changePassword => _password.sink.add;

  // Retrieve data from stream
  Stream<String> get getEmailValue => _email.stream.transform(validateEmail);
  Stream<String> get getPasswordValue =>
      _password.stream.transform(validatePassword);

  Stream<bool> get submitValid =>
      Rx.combineLatest2(getEmailValue, getPasswordValue, (e, p) => true);

  submitValue() {
    final validEmail = _email.value;
    final validPassword = _password.value;

    print('Email is $validEmail');
    print('Password is $validPassword');
  }

  // controller Cleanup
  dispose() {
    _email.close();
    _password.close();
  }
}
