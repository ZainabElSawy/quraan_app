import 'package:dartz/dartz.dart';
import 'package:quraan_app/core/constants/failure.dart';
import 'package:quraan_app/features/home/data/models/quran_models/sur_model/sur_model.dart';

import '../../models/quran_models/surah_model/surah_model.dart';

abstract class QuranRepo {
  Future<Either<Failure, List<SurModel>>> fetchSur();
  Future<Either<Failure, SurahModel>> fetchSurah({required int numberOfSurah});
}
