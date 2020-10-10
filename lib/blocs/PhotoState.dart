import 'package:dar_sudan/resources/network_exceptions.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'PhotoState.freezed.dart';

@freezed
abstract class PhotoState<T> with _$PhotoState<T> {
  const factory PhotoState.idle() = Idle<T>;
  const factory PhotoState.loading() = Loading<T>;
  const factory PhotoState.data({@required T data}) = Data<T>;
  const factory PhotoState.error({@required NetworkExceptions error}) =
  Error<T>;
}