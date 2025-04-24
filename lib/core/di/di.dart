import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:meal_planner/core/network/networkInfo.dart';
import 'package:meal_planner/features/Auth/login/data/data/remote_data.dart';
import 'package:meal_planner/features/Auth/login/data/repo_implement/login_repo_impl.dart';
import 'package:meal_planner/features/Auth/login/domain/repo/login_repo.dart';
import 'package:meal_planner/features/Auth/login/domain/use_case/login_use_case.dart';
import 'package:meal_planner/features/Auth/login/presentation/controller/cubit.dart';
import 'package:meal_planner/features/Auth/sing_up/data/remote_data/create_account_remote_data.dart';
import 'package:meal_planner/features/Auth/sing_up/data/repo_impl/create_account_repo_impl.dart';
import 'package:meal_planner/features/Auth/sing_up/domain/repo/create_account_repo.dart';
import 'package:meal_planner/features/Auth/sing_up/domain/use_case/create_account_use_case.dart';
import 'package:meal_planner/features/Auth/sing_up/presentation/controller/cubit.dart';
import 'package:meal_planner/features/fav/data/localData/favLocalData.dart';
import 'package:meal_planner/features/fav/data/repo_impl/fav_repo_impl.dart';
import 'package:meal_planner/features/fav/domain/repo/fav_repo.dart';
import 'package:meal_planner/features/fav/domain/useCase/get_fav_mea_use_case.dart';
import 'package:meal_planner/features/fav/domain/useCase/inset_fav_meal_use_case.dart';
import 'package:meal_planner/features/fav/domain/useCase/remove_fav_meal_use_case.dart';
import 'package:meal_planner/features/fav/presentation/controller/cubit.dart';
import 'package:meal_planner/features/gemini_chat/data/remoteData/geminRemoteData.dart';
import 'package:meal_planner/features/gemini_chat/data/repoImpl/geminiRepoImpl.dart';
import 'package:meal_planner/features/gemini_chat/domain/repo/ChatWithGeminiRepo.dart';
import 'package:meal_planner/features/gemini_chat/domain/useCase/searchUseCase.dart';
import 'package:meal_planner/features/gemini_chat/presentation/controller/cubit.dart';
import 'package:meal_planner/features/home/data/home_remote_data/get_home_recipe.dart';
import 'package:meal_planner/features/home/data/repo_impl/repo_impl.dart';
import 'package:meal_planner/features/home/domain/repo/home_recipe_repo.dart';
import 'package:meal_planner/features/home/domain/useCase/get_home_recipe_useCase.dart';
import 'package:meal_planner/features/home/presentation/controller/cubit.dart';
import 'package:meal_planner/features/profile/data/remote_data/profile_remote_data.dart';
import 'package:meal_planner/features/profile/data/repo_impl/profile_repo_impl.dart';
import 'package:meal_planner/features/profile/domain/repo/profile_repo.dart';
import 'package:meal_planner/features/profile/domain/usecase/get_user_data_usecase.dart';
import 'package:meal_planner/features/profile/domain/usecase/update_user_data_use_case.dart';
import 'package:meal_planner/features/profile/presentation/controller/cubit.dart';
import 'package:meal_planner/features/search/data/remote_data/search_remote_data.dart';
import 'package:meal_planner/features/search/data/repo_impl/search_repo_impl.dart';
import 'package:meal_planner/features/search/domain/repo/search_repo.dart';
import 'package:meal_planner/features/search/domain/usecase/search_usecase.dart';
import 'package:meal_planner/features/search/presentation/controller/cubit.dart';


final sl =GetIt.instance;


Future<void> init()async{

  //cubit
  sl.registerLazySingleton<LoginCubit>(()=>LoginCubit(loginUseCase: sl()));
  sl.registerLazySingleton<CreateAccountCubit>(()=>CreateAccountCubit(createAccountUseCase: sl()));
  sl.registerLazySingleton<HomePageCubit>(()=>HomePageCubit(getHomeRecipeUseCase: sl())..getHomeRecipe());
  sl.registerLazySingleton<GeminiChatCubit>(()=>GeminiChatCubit(chatWithGeminiUseCase: sl()));
  sl.registerLazySingleton<FavCubit>(()=>FavCubit(removeFavMealUseCase: sl(), insertFavMealUseCase: sl(), getFavMealUseCase: sl()));
  sl.registerLazySingleton<SearchCubit>(()=>SearchCubit(searchUseCase: sl()));
  sl.registerLazySingleton<ProfileCubit>(()=>ProfileCubit(updateUserDataUseCase: sl(), getUserDataUseCase:sl()));

  //useCases
  sl.registerLazySingleton<LoginUseCase>(()=>LoginUseCase(loginRepo: sl()));
  sl.registerLazySingleton<CreateAccountUseCase>(()=>CreateAccountUseCase(createAccountRepo: sl()));
  sl.registerLazySingleton<GetHomeRecipeUseCase>(()=>GetHomeRecipeUseCase(homeRecipeRepo: sl()));
  sl.registerLazySingleton<ChatWithGeminiUseCase>(()=>ChatWithGeminiUseCase(chatWithGeminiRepo: sl()));
  sl.registerLazySingleton<RemoveFavMealUseCase>(()=>RemoveFavMealUseCase(favRepo: sl()));
  sl.registerLazySingleton<InsertFavMealUseCase>(()=>InsertFavMealUseCase(favRepo: sl()));
  sl.registerLazySingleton<GetFavMealUseCase>(()=>GetFavMealUseCase(favRepo: sl()));
  sl.registerLazySingleton<SearchUseCase>(()=>SearchUseCase(searchRepo: sl()));
  sl.registerLazySingleton<UpdateUserDataUseCase>(()=>UpdateUserDataUseCase(profileRepo: sl()));
  sl.registerLazySingleton<GetUserDataUseCase>(()=>GetUserDataUseCase(profileRepo: sl()));

  //repo_impl
  sl.registerLazySingleton<LoginRepo>(()=>LoginRepoImpl(loginRemoteData: sl(), networkInfo: sl()));
  sl.registerLazySingleton<CreateAccountRepo>(()=>CreateAccountRepoImpl(createAccountRemoteData: sl(), networkInfo: sl()));
  sl.registerLazySingleton<HomeRecipeRepo>(()=>HomeRepoImpl(networkInfo: sl(), getHomeRecipeO: sl()));
  sl.registerLazySingleton<ChatWithGeminiRepo>(()=>GeminiRepoImpl(networkInfo: sl(), geminiRemoteDate: sl()));
  sl.registerLazySingleton<FavRepo>(()=>FavRepoImpl(favLocalData: sl()));
  sl.registerLazySingleton<SearchRepo>(()=>SearchRepoImpl(networkInfo: sl(), searchRemoteData: sl()));
  sl.registerLazySingleton<ProfileRepo>(()=>ProfileRepoImpl(networkInfo: sl(), proFileRemoteData:sl()));

  //home_remote_data
  sl.registerLazySingleton<LoginRemoteData>(()=>LoginRemoteData());
  sl.registerLazySingleton<CreateAccountRemoteData>(()=>CreateAccountRemoteData());
  sl.registerLazySingleton<GetHomeRecipe>(()=>GetHomeRecipe());
  sl.registerLazySingleton<GeminiRemoteDate>(()=>GeminiRemoteDate());
  sl.registerLazySingleton<SearchRemoteData>(()=>SearchRemoteData());
  sl.registerLazySingleton<ProFileRemoteData>(()=>ProFileRemoteData());

  //local data
  sl.registerLazySingleton<FavLocalData>(()=>FavLocalData());

  //network
  sl.registerLazySingleton<NetworkInfo>(()=>NetworkInfoImpl(internetConnection: InternetConnection()));
}