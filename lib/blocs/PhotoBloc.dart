import 'package:dar_sudan/models/empl.dart';
import 'package:dar_sudan/resources/APIRepository.dart';
import 'package:dar_sudan/resources/api_result.dart';
import 'package:dar_sudan/resources/network_exceptions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'PhotoEvent.dart';
import 'PhotoState.dart';
class PhotoBloc extends Bloc<PhotoEvent, PhotoState<List<Employee>>> {
  final APIRepository apiRepository;

  PhotoBloc({this.apiRepository})
      : assert(apiRepository != null),
        super(Idle());

  @override
  Stream<PhotoState<List<Employee>>> mapEventToState(PhotoEvent event) async* {
    yield PhotoState.loading();

    if (event is LoadMovies) {

      ApiResult<List<Employee>> apiResult = await apiRepository.fetchPhotosList();

      yield* apiResult.when(success: (List<Employee> data) async* {

        yield PhotoState.data(data: data);

      }, failure: (NetworkExceptions error) async* {

        yield PhotoState.error(error: error);

      });
    }
  }
}