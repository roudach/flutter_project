part of 'authentification_bloc.dart';

enum AuthentificationStatus{authentificated, unauthenticated,unknown}
 
class AuthentificationState extends Equatable {
  const AuthentificationState._({
    this.status=AuthentificationStatus.unknown,
    this.user

  });
  final AuthentificationStatus status;
  final MyUser? user;


  const AuthentificationState.unknown():this._();

  const AuthentificationState.authentificated(MyUser myUser):
  this._(status: AuthentificationStatus.authentificated,user: myUser);
  const AuthentificationState.unauthenticated():
  this._(status: AuthentificationStatus.unauthenticated);



  @override
  List<Object?> get props => [status,user];

}
