import '../../domain/entities/entities.dart';
import '../models/models.dart';

class HistoryTextMapper {
  static HistoryText fromTextResponseToHistoryText(TextResponse textResponse) {
    return HistoryText(
      id: textResponse.id,
      content: textResponse.content,
      startTime: textResponse.startTime,
      historyId: textResponse.historyId,
    );
  }
}
