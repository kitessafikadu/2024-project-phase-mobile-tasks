import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:auth_feature/core/networks/dio_client.dart';
import 'package:go_router/go_router.dart';
import 'package:auth_feature/features/auth/presentation/pages/splash_screen.dart';
import 'package:auth_feature/features/auth/presentation/pages/auth_screen.dart';
import 'package:auth_feature/features/home/presentation/pages/home_screen.dart';
import 'package:auth_feature/features/chat/presentation/pages/chat_screen.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final dioClientProvider = Provider<DioClient>((ref) {
  final dio = ref.read(dioProvider);
  return DioClient(dio: dio);
});
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError('Override with SharedPreferences instance');
});

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/splash',
    routes: [
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/auth',
        name: 'auth',
        builder: (context, state) => AuthScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/chat/:chatName',
        name: 'chat',
        builder: (context, state) {
          final chatName = state.pathParameters['chatName']!;
          return ChatScreen(chatName: chatName);
        },
      ),
    ],
    redirect: (context, state) {
      // Add your auth redirect logic here
      return null;
    },
  );
});

Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferencesProvider.overrideWithValue(sharedPreferences);
}
