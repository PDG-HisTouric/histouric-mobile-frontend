import 'bic.dart';
import 'histouric_user.dart';

class HistouricRoute {
  final String id;
  final String name;
  final String description;
  final HistouricUser owner;
  final List<BIC> bics;

  HistouricRoute({
    required this.id,
    required this.name,
    required this.description,
    required this.owner,
    required this.bics,
  });
}
