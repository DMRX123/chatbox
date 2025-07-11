import 'package:flutter/material.dart';
import 'package:chatbox/screens/auth/login_screen.dart';
import 'package:chatbox/screens/auth/signup_screen.dart';
import 'package:chatbox/screens/main/home_screen.dart';
import 'package:chatbox/screens/main/chat_screen.dart';
import 'package:chatbox/screens/main/reels_screen.dart';
import 'package:chatbox/screens/main/profile_screen.dart';
import 'package:chatbox/screens/main/pic_contest_screen.dart';
import 'package:chatbox/screens/create/create_post_screen.dart';
import 'package:chatbox/screens/create/create_reel_screen.dart';
import 'package:chatbox/screens/create/create_story_screen.dart';
import 'package:chatbox/screens/settings/settings_screen.dart';
import 'package:chatbox/screens/settings/badge_screen.dart';

class Routes {
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String chat = '/chat';
  static const String reels = '/reels';
  static const String profile = '/profile';
  static const String picContest = '/pic-contest';
  static const String createPost = '/create-post';
  static const String createReel = '/create-reel';
  static const String createStory = '/create-story';
  static const String settings = '/settings';
  static const String badges = '/badges';

  static Route<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case signup:
        return MaterialPageRoute(builder: (_) => const SignupScreen());
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case chat:
        return MaterialPageRoute(builder: (_) => const ChatScreen());
      case reels:
        return MaterialPageRoute(builder: (_) => const ReelsScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      case picContest:
        return MaterialPageRoute(builder: (_) => const PicContestScreen());
      case createPost:
        return MaterialPageRoute(builder: (_) => const CreatePostScreen());
      case createReel:
        return MaterialPageRoute(builder: (_) => const CreateReelScreen());
      case createStory:
        return MaterialPageRoute(builder: (_) => const CreateStoryScreen());
      case settings:
        return MaterialPageRoute(builder: (_) => const SettingsScreen());
      case badges:
        return MaterialPageRoute(builder: (_) => const BadgeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${routeSettings.name}'),
              ),
            ));
    }
  }
}