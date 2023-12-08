import 'package:flutter_bloc/flutter_bloc.dart';

// Events
abstract class UserInfoEvent {}

class UpdateUserInfoEvent extends UserInfoEvent {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String imagePath;

  UpdateUserInfoEvent({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.imagePath,
  });
}

// State
class UserInfoState {
  final String name;
  final String email;
  final String phoneNumber;
  final String password;
  final String imagePath;

  UserInfoState({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.imagePath,
  });
}

// Cubit
class UserInfoCubit extends Cubit<UserInfoState> {
  UserInfoCubit()
      : super(UserInfoState(
          name: 'John Doe',
          email: 'john.doe@example.com',
          phoneNumber: '123-456-7890',
          password: '********',
          imagePath: "Assets/Images/default_profile.jpeg",
        ));
  void updateUserInfo({
    required String name,
    required String email,
    required String phoneNumber,
    required String password,
    required String imagePath,
  }) {
    // Check if the provided values are empty, and if they are, retain the existing values
    name = name.isEmpty ? state.name : name;
    email = email.isEmpty ? state.email : email;
    phoneNumber = phoneNumber.isEmpty ? state.phoneNumber : phoneNumber;
    password = password.isEmpty ? state.password : password;
    imagePath = imagePath;

    emit(UserInfoState(
      name: name,
      email: email,
      phoneNumber: phoneNumber,
      password: password,
      imagePath: imagePath,
    ));
  }
}
