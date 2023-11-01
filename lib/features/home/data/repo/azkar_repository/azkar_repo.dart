import 'package:dartz/dartz.dart';
import 'package:quraan_app/features/home/data/models/azkar_model/azkar_details_model.dart';
import 'package:quraan_app/features/home/data/models/azkar_model/azkar_model.dart';

import '../../../../../core/constants/failure.dart';

abstract class AzkarRepo {
  Future<Either<Failure, List<AzkarModel>>> fetchAzkar();
  Future<Either<Failure, List<AzkarDetailsModel>>> fetchAzkarDetails(
      {required int id});
}
