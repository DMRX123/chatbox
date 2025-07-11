import 'package:chatbox/models/story_model.dart';
import 'package:chatbox/services/storage_service.dart';

class StoryRepository {
  final StorageService _storageService;

  StoryRepository({required StorageService storageService})
      : _storageService = storageService;

  Future<List<StoryModel>> getStories() async {
    try {
      // Implementation to fetch stories from Firestore
      return [];
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addStory({
    required String userId,
    required String mediaUrl,
    required String mediaType,
  }) async {
    try {
      // Implementation to add story to Firestore
    } catch (e) {
      rethrow;
    }
  }

  Future<void> viewStory({
    required String storyId,
    required String userId,
  }) async {
    try {
      // Implementation to mark story as viewed
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadStoryMedia(String filePath, String mediaType) async {
    try {
      final downloadUrl = await _storageService.uploadFile(
        filePath: filePath,
        storagePath: 'story_media',
      );
      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }
}