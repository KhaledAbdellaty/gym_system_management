part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthLoaded extends AuthState {
  final List<Users> users;

  const AuthLoaded({required this.users});

  @override
  List<Object> get props => [users];
}

class AuthLogin extends AuthState {
  final Users user;

  const AuthLogin({required this.user});
}

class AuthLogOut extends AuthState {}

class CreatedUser extends AuthState {}

class DeletedUSer extends AuthState {}
