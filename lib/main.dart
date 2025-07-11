import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

// Firebase & Config
import 'firebase_options.dart';
import 'config/routes.dart';
import 'config/theme.dart';

// BLoCs
import 'blocs/auth_bloc.dart';
import 'blocs/chat_bloc.dart';
import 'blocs/reel_bloc.dart';
import 'blocs/post_bloc.dart';
import 'blocs/story_bloc.dart';
import 'blocs/notification_bloc.dart';

// Providers
import 'providers/user_provider.dart';
import 'providers/badge_provider.dart';

// Repositories
import 'repositories/auth_repository.dart';
import 'repositories/chat_repository.dart';
import 'repositories/reel_repository.dart';
import 'repositories/post_repository.dart';
import 'repositories/story_repository.dart';
import 'repositories/notification_repository.dart';

// Services
import 'services/auth_service.dart';
import 'services/chat_service.dart';
import 'services/storage_service.dart';
import 'services/reel_service.dart';
import 'services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Shared services
  final storageService = StorageService();

  runApp(
    MultiProvider(
      providers: [
        // Providers
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BadgeProvider()),

        // BLoCs
        BlocProvider(
          create: (_) => AuthBloc(
            authRepository: AuthRepository(
              authService: AuthService(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => ChatBloc(
            chatRepository: ChatRepository(
              chatService: ChatService(),
            ),
          ),
        ),
        BlocProvider(
          create: (_) => ReelBloc(
            reelRepository: ReelRepository(
              reelService: ReelService(),
              storageService: storageService,
            ),
          ),
        ),
        BlocProvider(
          create: (_) => PostBloc(
            postRepository: PostRepository(
              storageService: storageService,
            ),
          ),
        ),
        BlocProvider(
          create: (_) => StoryBloc(
            storyRepository: StoryRepository(
              storageService: storageService,
            ),
          ),
        ),
        BlocProvider(
          create: (_) => NotificationBloc(
            notificationRepository: NotificationRepository(
              notificationService: NotificationService(),
            ),
          ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatBox',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: Routes.login,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}