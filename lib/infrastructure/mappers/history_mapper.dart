import '../../domain/entities/entities.dart';
import '../models/models.dart';
import 'history_audio_mapper.dart';
import 'history_image_mapper.dart';
import 'history_text_mapper.dart';
import 'history_video_mapper.dart';

class HistoryMapper {
  static Story fromHistoryResponseToHistory(HistoryResponse historyResponse) {
    return Story(
      id: historyResponse.id,
      title: historyResponse.title,
      audio: HistoryAudioMapper.fromAudioResponseToHistoryAudio(
          historyResponse.audio),
      owner: historyResponse.owner,
      videos: historyResponse.videos
          ?.map((video) =>
              HistoryVideoMapper.fromVideoResponseToHistoryVideo(video))
          .toList(),
      texts: historyResponse.texts
          .map((text) => HistoryTextMapper.fromTextResponseToHistoryText(text))
          .toList(),
      images: historyResponse.images
          ?.map((image) =>
              HistoryImageMapper.fromHistoryImageResponseToHistoryImage(image))
          .toList(),
    );
  }
}
