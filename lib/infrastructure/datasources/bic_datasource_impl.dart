import '../../domain/domain.dart';

final List<HistoryBIC> histories = [
  HistoryBIC(
    historyId: "1",
    title: "Historia 1",
    description: "Descripción 1 de la historia 1",
    image: "https://picsum.photos/200",
  ),
  HistoryBIC(
    historyId: "2",
    title: "Historia 2",
    description: "Descripción 2 de la historia 2",
    image: "https://picsum.photos/201",
  ),
  HistoryBIC(
    historyId: "3",
    title: "Historia 3",
    description: "Descripción 3 de la historia 3",
    image: "https://picsum.photos/202",
  ),
  HistoryBIC(
    historyId: "4",
    title: "Historia 4",
    description: "Descripción 4 de la historia 4",
    image: "https://picsum.photos/203",
  ),
];

final List<BIC> bics = [
  BIC(
    bicId: "1",
    name: "La ermita",
    latitude: 3.4578385679577623,
    longitude: -76.53064306373778,
    description:
        "La iglesia La Ermita es un templo católico ubicada en Santiago de Cali, Colombia. Originalmente fue una construcción pajiza de comienzos del siglo XVII, establecida en las cercanías del río Cali y dedicada a Nuestra Señora de la Soledad y al Señor de la Caña.",
    exists: true,
    nicknames: ["Iglesia La Ermita"],
    images: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/2/2f/Ermita_cali.jpg/300px-Ermita_cali.jpg',
      'https://images.mnstatic.com/a9/f3/a9f36d28a6458cdc67726fd09ea08674.jpg',
      'https://www.elpais.com.co/resizer/WtXtPEaGFNQoo2BSOPV18x5AKUA=/arc-anglerfish-arc2-prod-semana/public/6HIDALNZSVGVNNVOWZFUJ6LZBA.jpg',
    ],
    histories: histories,
  ),
  BIC(
    bicId: "2",
    name: "Antiguo Matadero de Calí",
    latitude: 3.4415465517324257,
    longitude: -76.52977456110938,
    description: "Antiguo Matadero de Calí",
    exists: false,
    nicknames: ["El Matadero"],
    images: [
      'https://audiovisuales.icesi.edu.co/audiovisuales/retrieve/210777/Fdo%20009948.jpg.preview.jpg',
    ],
    histories: histories,
  ),
  BIC(
    bicId: "3",
    name: "Edificio Otero",
    latitude: 3.451929471542798,
    longitude: -76.5319398863662,
    description:
        "El Edificio Otero es un edificio localizado en la ciudad de Cali, Valle del Cauca. Está catalogado como monumento nacional",
    exists: true,
    nicknames: ["Edificio Otero"],
    images: [
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1d/8e/c6/0a/edificio-otero-ubicado.jpg?w=1200&h=-1&s=1',
      'https://upload.wikimedia.org/wikipedia/commons/thumb/1/11/Otero_konstrua%C4%B5o_WLM_2013_05.JPG/675px-Otero_konstrua%C4%B5o_WLM_2013_05.JPG',
    ],
    histories: histories,
  ),
  BIC(
    bicId: "4",
    name: "Complejo religioso de San Francisco",
    latitude: 3.4505256236841015,
    longitude: -76.53364473071245,
    description:
        "La iglesia de San Francisco es un templo de la comunidad franciscana ubicado en Santiago de Cali (Colombia). Fue construido entre los siglos XVIII y XIX, y actualmente se encuentra en el centro de la ciudad. Hace parte del Complejo Religioso de San Francisco, que también incluye el convento de San Joaquín, la capilla de la Inmaculada, la Torre Mudéjar y un museo de arte religioso.",
    exists: true,
    nicknames: ["BIC 4", "BIC 4"],
    images: [
      'https://upload.wikimedia.org/wikipedia/commons/thumb/7/7b/Aleko_Plaza_de_San_Francisco.jpg/420px-Aleko_Plaza_de_San_Francisco.jpg',
      'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/16/1b/1a/a2/iglesia-san-francisco.jpg?w=1200&h=1200&s=1',
    ],
    histories: histories,
  ),
];

class BICDatasourceImpl implements BICDatasource {
  @override
  Future<List<BIC>> getBICs() {
    return Future.value(bics);
  }

  @override
  Future<BIC> getBICById(String bicId) {
    return Future.value(bics[int.parse(bicId) - 1]);
  }
}
