import '../../domain/entities/entities.dart';
import '../models/models.dart';

class HistoryImageMapper {
  static HistoryImage fromHistoryImageResponseToHistoryImage(
      HistoryImageResponse historyImageResponse) {
    return HistoryImage(
      id: historyImageResponse.id,
      imageUri: historyImageResponse.imageUri,
      startTime: historyImageResponse.startTime,
      historyId: historyImageResponse.historyId,
    );
  }
}
