import 'package:histouric_mobile_frontend/domain/datasources/bic_datasource.dart';
import 'package:histouric_mobile_frontend/domain/entities/bic.dart';

class SpringBootBICDatasource implements BICDatasource {

  @override
  Future<List<BIC>> getBICs() {
    List<BIC> bics = [];
    bics.add(BIC(
      bicId: "1",
      name: "Universidad Icesi",
      latitude: 3.342006981361799,
      longitude: -76.53061478816689,
      description: "Universidad Icesi",
      exists: true,
      nicknames: ["Icesi", "La icesi"],
    ));

    bics.add(BIC(
      bicId: "2",
      name: "Biblioteca Icesi",
      latitude: 3.341867743197723,
      longitude: -76.52992814165417,
      description: "Biblioteca Icesi",
      exists: true,
      nicknames: ["Biblio", "La biblio"],
    ));

    bics.add(BIC(
      bicId: "3",
      name: "Edificio L",
      latitude: 3.3414928713096415,
      longitude: -76.52941315641976,
      description: "Edificio L",
      exists: true,
      nicknames: ["El L"],
    ));

    bics.add(BIC(
      bicId: "4",
      name: "Edificio E",
      latitude: 3.340737775278267,
      longitude: -76.53057187340244,
      description: "BIC 4",
      exists: true,
      nicknames: ["BIC 4", "BIC 4"],
    ));
    return Future.value(bics);
  }

}