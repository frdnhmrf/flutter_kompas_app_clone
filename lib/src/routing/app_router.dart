import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/account/edit_profile_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/account/profile_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/account/setting_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/onboarding/onboarding_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/signIn/sign_in_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/signUp/sign_up_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/authentication/presentation/splash/splash_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/menu/presentasion/detail_menu_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/menu/presentasion/menu_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/news/presentation/detail_news_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/saved/presentation/saved_screen.dart';
import 'package:flutter_kompas_app_clone/src/features/search/presentation/search_screen.dart';
import 'package:flutter_kompas_app_clone/src/routing/main_screen.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  splash,
  home,
  account,
  signIn,
  signUp,
  onboarding,
  profile,
  editProfile,
  detailNews,
  detailMenu,
  setting,
  search,
}

final goRouter = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routerNeglect: true,
  routes: [
    GoRoute(
      path: '/',
      name: AppRoute.splash.name,
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'onboarding',
          name: AppRoute.onboarding.name,
          builder: (context, state) => const OnboardingScreen(),
        ),
        GoRoute(
          path: 'sign-in',
          name: AppRoute.signIn.name,
          builder: (context, state) => const SignInScreen(),
        ),
        GoRoute(
          path: 'sign-up',
          name: AppRoute.signUp.name,
          builder: (context, state) => const SignUpScreen(),
        ),
        GoRoute(
          path: 'edit-profile',
          name: AppRoute.editProfile.name,
          builder: (context, state) => const EditProfileScreen(),
        ),
        GoRoute(
          name: AppRoute.setting.name,
          path: 'setting',
          builder: (context, state) => const SettingScreen(),
        ),
        GoRoute(
            path: 'main',
            name: AppRoute.home.name,
            builder: (context, state) => const MainScreen(),
            routes: [
              GoRoute(
                path: 'detail-news/:id',
                name: AppRoute.detailNews.name,
                builder: (context, state) {
                  return const DetailNewsScreen();
                },
              ),
              GoRoute(
                  name: AppRoute.profile.name,
                  path: 'profile/:id',
                  builder: (context, state) {
                    String? id = state.params['id'];

                    return ProfileScreen(
                      idUser: id.toString(),
                    );
                  }),
            ]),
        GoRoute(
          path: 'saved',
          builder: (context, state) => const SavedScreen(),
        ),
        GoRoute(
          path: 'menu',
          builder: (context, state) => const MenuScreen(),
        ),
        GoRoute(
          path: 'detail-menu',
          name: AppRoute.detailMenu.name,
          builder: (context, state) => const DetailMenuScreen(),
        ),
        GoRoute(
          name: AppRoute.search.name,
          path: 'search',
          builder: (context, state) => const SearchScreen(),
        ),
      ],
    ),
  ],
);
