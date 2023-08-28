import 'image.dart';
import 'text.dart';

class History {
  final String id;
  final String title;
  final String audioUrl;
  final List<HistouricText> texts;
  final List<HistouricImage> images;

  History({
    required this.id,
    required this.title,
    required this.audioUrl,
    required this.texts,
    required this.images,
  });
}
