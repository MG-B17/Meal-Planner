import 'package:dartz/dartz.dart';
import 'package:meal_planner/features/search/domain/repo/search_repo.dart';

import '../../../../core/errors/failure.dart';
import '../entity/search_entity.dart';

class SearchUseCase {

  final SearchRepo searchRepo;

  SearchUseCase({required this.searchRepo});

  Future<Either<Failure,List<SearchEntity>>>call({required String mealName})async{
    return await searchRepo.search(mealName: mealName);
  }
}