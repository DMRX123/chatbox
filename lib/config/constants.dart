class AppConstants {
  static const String appName = 'ChatBox';
  static const String appVersion = '1.0.0';
  
  // Firebase collections
  static const String usersCollection = 'users';
  static const String chatsCollection = 'chats';
  static const String reelsCollection = 'reels';
  static const String postsCollection = 'posts';
  static const String storiesCollection = 'stories';
  static const String notificationsCollection = 'notifications';
  
  // Storage paths
  static const String profilePicturesPath = 'profile_pictures/';
  static const String postImagesPath = 'post_images/';
  static const String reelVideosPath = 'reel_videos/';
  static const String storyMediaPath = 'story_media/';
  
  // Shared preferences keys
  static const String isLoggedInKey = 'is_logged_in';
  static const String currentUserIdKey = 'current_user_id';
  static const String currentZoneKey = 'current_zone';
  
  // Animation durations
  static const Duration defaultAnimationDuration = Duration(milliseconds: 300);
}