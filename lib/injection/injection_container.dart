import 'package:chat_2/core/feature_button_nav_bar/presentation/bootom_navigation_tab_bar_cubit/bootom_tab_bar_cubit.dart';
import 'package:chat_2/core/network/network_info.dart';
import 'package:chat_2/features/auth/data/repository/auth_repository_impl.dart';
import 'package:chat_2/features/auth/domin/usecases/image_usecase.dart';
import 'package:chat_2/features/auth/domin/usecases/signup_usecase.dart';
import 'package:chat_2/features/auth/presentation/cubit/auth_cubit/login_cubit.dart';
import 'package:chat_2/features/auth/presentation/cubit/image_cubit/image_partner_cubit.dart';
import 'package:chat_2/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:chat_2/features/chat_partner/data/datasources/chat_bubble_remote_data.dart';
import 'package:chat_2/features/chat_partner/data/repositories/chat_bubble_repository_impl.dart';
import 'package:chat_2/features/chat_partner/domain/repositories/chat_bubble_repository.dart';
import 'package:chat_2/features/chat_partner/domain/usecases/get_chat_bubble_usecase.dart';
import 'package:chat_2/features/chat_partner/domain/usecases/get_chat_dialog_usecase.dart';
import 'package:chat_2/features/chat_partner/domain/usecases/get_chat_info_usecase.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_dialog_cubit/chat_dialog_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_partner_cubit/chat_partner_bubble_cubit.dart';
import 'package:chat_2/features/chat_partner/presentation/cubits/chat_partner_info_cubit/chat_partner_info_cubit.dart';
import 'package:chat_2/features/ragone/data/datasources/country_remote_data.dart';
import 'package:chat_2/features/ragone/data/repositories/country_repository_impl.dart';
import 'package:chat_2/features/ragone/domain/repositories/country_repository.dart';
import 'package:chat_2/features/ragone/domain/usecases/city_useCases.dart';
import 'package:chat_2/features/ragone/domain/usecases/country_useCases.dart';
import 'package:chat_2/features/ragone/presentation/cubit/city_cubit.dart';
import 'package:chat_2/features/ragone/presentation/cubit/country_cubit.dart';
import 'package:chat_2/features/search_partner/data/datasources/search_partner_remote_data.dart';
import 'package:chat_2/features/search_partner/data/repository/partner_repository_impl.dart';
import 'package:chat_2/features/search_partner/domain/repositories/search_partner_repository.dart';
import 'package:chat_2/features/search_partner/domain/usecases/get_all_partner_useCase.dart';
import 'package:chat_2/features/search_partner/presentation/cubit/search_partner_cubit.dart';

import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../features/auth/data/datasources/remote/auth_remote.dart';
import '../features/auth/domin/repository/auth_repository.dart';
import '../features/auth/domin/usecases/login_usecase.dart';

final sl = GetIt.instance;
Future<void> init() async {
//
//---------------------------------------------------------
  //! Features - Global

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImplemntes(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());

  //! Features - Global Finished
//-------------------------------------------------------------------
  //! Features - Auth
// cubit
  sl.registerFactory(() => LoginCubit(sl()));
  sl.registerFactory(() => SignUpCubit(sl()));
  sl.registerFactory(() => ImagePartnerCubit(sl()));
// Usecase
  sl.registerLazySingleton(() => LoginUsecase(repository: sl()));
  sl.registerLazySingleton(() => SigninUseCase(repository: sl()));
  sl.registerLazySingleton(() => ImagePartnerUseCase(repository: sl()));
// Repository
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(networkInformation: sl(), auhtRemote: sl()));

// DataSources
  sl.registerLazySingleton<AuhtRemote>(() => AuthRemoteImp());

//------------------------------------------------------------------------------
  //! Feature_country
// bloc
  sl.registerFactory(() => CityCubit(sl()));
  sl.registerFactory(() => CountryCubit(sl()));
// useCase
  sl.registerLazySingleton(() => GetAllCityUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllCountryUseCase(repository: sl()));
// repository
  sl.registerLazySingleton<CountryAndCityRepository>(
      () => CountryRepositoryImpl(remoteData: sl(), networkInformation: sl()));
// Data source
  sl.registerLazySingleton<CountryRemoteDataSource>(
      () => CountryRemoteDataSourceImpl());
//------------------------------------------------------------------------------
  //! search feauture
//cubit
  sl.registerFactory(() => SearchPartnerCubit(sl()));
//useCase
  sl.registerLazySingleton(() => GetAllPartnerUseCase(partnerRepository: sl()));
//repository
  sl.registerLazySingleton<SearchPartnerRepository>(
      () => SearchPartnerRepositoryImpl(networkInfo: sl(), remoteData: sl()));
//Data source
  sl.registerLazySingleton<SearchPartnerRemoteData>(
      () => SearchPartnerRemoteDataImpl());
//------------------------------------------------------------------------------
  //! chat partner
//cubit
  sl.registerFactory(() => ChatPartnerBubbleCubit(sl()));
  sl.registerFactory(() => ChatDialogCubit(sl()));
  sl.registerFactory(() => ChatPartnerInfoCubit(sl()));

//useCase
  sl.registerLazySingleton(() => ChatBubbleUseCases(repository: sl()));
  sl.registerLazySingleton(() => ChatDialogUseCase(repository: sl()));
  sl.registerLazySingleton(() => GetAllChatPartnerUseCase(repository: sl()));
//repository
  sl.registerLazySingleton<ChatBubbleRepository>(
      () => ChatBubbleRepositoryImpl(remoteData: sl(), networkInfo: sl()));
//Data Source
  sl.registerLazySingleton<ChatBubbleRemoteData>(
      () => ChatBubbleRemoteDataImpl());
//------------------------------------------------------------------------------
//! cubit tabBar pages
  sl.registerFactory(() => BootomTabBarCubit());
}
