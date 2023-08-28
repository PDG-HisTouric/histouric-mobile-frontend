import 'bic.dart';

class Route {
  final String id;
  final String name;
  final List<BIC> bics;

  Route({required this.id, required this.name, required this.bics});
}
