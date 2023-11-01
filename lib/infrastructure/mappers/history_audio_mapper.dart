import '../../domain/entities/entities.dart';
import '../models/models.dart';

class HistoryAudioMapper {
  static HistoryAudio fromAudioResponseToHistoryAudio(
      AudioResponse audioResponse) {
    return HistoryAudio(
      id: audioResponse.id,
      audioUri: audioResponse.audioUri,
      historyId: audioResponse.historyId,
    );
  }
}
