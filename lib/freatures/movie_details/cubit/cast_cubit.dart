import 'package:bloc/bloc.dart';
import 'package:golcoin_movies/freatures/movie_details/cubit/cast_state.dart';
import 'package:golcoin_movies/freatures/movie_details/repositories/cast_repository.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CastCubit extends Cubit<CastState> {
  final CastRepository _castRepository;

  CastCubit(this._castRepository) : super(const CastState.initial());

  getCredit(int movieId) async {
    emit(const CastState.loading());
    (await _castRepository.getCredit(movieId))
        .fold((l) => emit(CastState.error(l)), (r) => emit(CastState.loaded(r)));
  }
}
