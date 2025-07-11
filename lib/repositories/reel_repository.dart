import 'package:chatbox/models/reel_model.dart';
import 'package:chatbox/services/reel_service.dart';
import 'package:chatbox/services/storage_service.dart';

class ReelRepository {
  final ReelService _reelService;
  final StorageService _storageService;

  ReelRepository({
    required ReelService reelService,
    required StorageService storageService,
  })  : _reelService = reelService,
        _storageService = storageService;

  Future<List<ReelModel>> getReels() async {
    try {
      final reels = await _reelService.getReels();
      return reels;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> likeReel({
    required String reelId,
    required String userId,
  }) async {
    try {
      await _reelService.likeReel(reelId: reelId, userId: userId);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> addComment({
    required String reelId,
    required String userId,
    required String comment,
  }) async {
    try {
      await _reelService.addComment(
        reelId: reelId,
        userId: userId,
        comment: comment,
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<String> uploadReelVideo(String filePath) async {
    try {
      final downloadUrl = await _storageService.uploadFile(
        filePath: filePath,
        storagePath: 'reel_videos',
      );
      return downloadUrl;
    } catch (e) {
      rethrow;
    }
  }
}