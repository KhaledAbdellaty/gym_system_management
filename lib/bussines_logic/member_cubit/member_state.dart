part of 'member_cubit.dart';

enum MemberStatus {
  memberAlreadyExist,
  memberAddedFailed,
  memberAddedSuccess,
  memberLoading,
  memberLoaded,
}

abstract class MemberState {
  // Member? member;
  // MemberStatus? memberStatus;
  // String? errorMsg;
  // double totalPrice, totalPayed, totalDept;

  // MemberState({
  //   this.errorMsg,
  //   this.memberStatus,
  //   this.member,
  //   this.totalDept = 0,
  //   this.totalPayed = 0,
  //   this.totalPrice = 0,
  // });

  // MemberState copyWith(
  //     {String? errorMsg, Member? member, MemberStatus? memberStatus}) {
  //   return MemberState(
  //       errorMsg: this.errorMsg ?? errorMsg,
  //       member: this.member ?? member,
  //       memberStatus: this.memberStatus ?? memberStatus);
  // }

  // @override
  // List<Object> get props => [totalDept, totalPayed, totalPrice];
}

class MemberInit extends MemberState {}

class MemberFailed extends MemberState {
  final String errorMsg;

  MemberFailed({required this.errorMsg});
}

class MemberSuccess extends MemberState {
  final String errorMsg;

  MemberSuccess({required this.errorMsg});
}

class MemberLoading extends MemberState {}

class MemberAddedBill extends MemberState {
  final String message;
  final Bills bill;

  MemberAddedBill({required this.bill, required this.message});
}

class MemberLoaded extends MemberState {
  final Member? member;
  double? totalPrice, totalPaid, totalDept;

  MemberLoaded({this.member, this.totalDept, this.totalPaid, this.totalPrice});
}

class MemberStartSearching extends MemberState {
  final List<Member>? members;
  MemberStartSearching({this.members});
}

class MemberStopSearching extends MemberState {}

class MemberSearchingResualt extends MemberState {
  final List<Member> members;

  MemberSearchingResualt({required this.members});
}

class MemberDetails extends MemberState {
  final Member member;

  MemberDetails(this.member);
}

class MemberBillPayment extends MemberState {
  final List<Bills> bills;

   MemberBillPayment({required this.bills});

}
