import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'PhotoEvent.freezed.dart';
@freezed
abstract class PhotoEvent with _$PhotoEvent {
  const factory PhotoEvent.loadMovie() = LoadMovies;
}