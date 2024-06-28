/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 6/27/2024, Thursday

abstract class BaseState {}

class BaseInitial implements BaseState {}

class BaseLoading implements BaseState {}

class BaseSuccess implements BaseState {
  final dynamic data;
  BaseSuccess({required this.data});
}

class BaseError implements BaseState {}
