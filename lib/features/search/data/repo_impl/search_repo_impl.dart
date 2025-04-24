import 'package:dartz/dartz.dart';
import 'package:meal_planner/core/errors/failure.dart';
import 'package:meal_planner/core/network/networkInfo.dart';
import 'package:meal_planner/features/search/data/remote_data/search_remote_data.dart';
import 'package:meal_planner/features/search/domain/entity/search_entity.dart';
import 'package:meal_planner/features/search/domain/repo/search_repo.dart';
import '../../../../core/errors/exception.dart';

class SearchRepoImpl extends SearchRepo{
  final SearchRemoteData searchRemoteData;
  final NetworkInfo networkInfo;

  SearchRepoImpl({required this.networkInfo,required this.searchRemoteData});
  @override
  Future<Either<Failure, List<SearchEntity>>> search({required String mealName})async {
    if(await networkInfo.isConnected()){
    try {
    final result = await searchRemoteData.getHomeRecipe(mealName: mealName);
    return right(result);
    }on ServerException {
    return left(ServerFailure());
    }
    }
    else{
    return left(NetworkFailure());
    }
  }
}