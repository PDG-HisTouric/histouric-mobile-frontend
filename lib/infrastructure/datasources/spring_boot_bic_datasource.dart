import 'package:histouric_mobile_frontend/domain/datasources/bic_datasource.dart';
import 'package:histouric_mobile_frontend/domain/entities/entities.dart';

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
    name: "Universidad Icesi",
    latitude: 3.342006981361799,
    longitude: -76.53061478816689,
    description:
        "La Universidad Icesi (originalmente las siglas de Instituto Colombiano de Estudios Superiores de Incolda) es una institución educativa privada en Cali (Colombia), sujeta a inspección y vigilancia por medio de la Ley 1740 de 2014 y la ley 30 de 1992 del Ministerio de Educación de Colombia. El campus está ubicado en el sector de Pance, al sur de la ciudad. Fundada en 1979 por un grupo de empresarios de la región, ofrece programas de pregrado, especializaciones, maestrías y doctorados.",
    exists: true,
    nicknames: ["Icesi", "La icesi"],
    images: [
      'https://valledellili.org/wp-content/uploads/2018/04/icesi-sl1.jpg',
      'https://img.asmedia.epimg.net/resizer/JsSMRsesLaHtE34qPQhxlcFS0R0=/736x414/filters:focal(392x115:402x125)/cloudfront-eu-central-1.images.arcpublishing.com/diarioas/OIJZJ4FFNZEXLBXT7NVALDGZ6Y.jpg',
      'https://yt3.googleusercontent.com/ytc/AOPolaSwQMN-qUqLtUgsn9omblV1qxHUDZKtW150g8dD=s900-c-k-c0x00ffffff-no-rj',
    ],
    histories: histories,
  ),
  BIC(
    bicId: "2",
    name: "Biblioteca Icesi",
    latitude: 3.341867743197723,
    longitude: -76.52992814165417,
    description: "Biblioteca Icesi",
    exists: true,
    nicknames: ["Biblio", "La biblio"],
    images: [
      'https://upload.wikimedia.org/wikipedia/commons/8/86/Biblioteca_Universidad_Icesi.jpg',
      'https://www.icesi.edu.co/biblioteca/wp-content/themes/biblioteca-icesi/video/Office-Day/SnapShots/Office-Days.jpg',
    ],
    histories: histories,
  ),
  BIC(
    bicId: "3",
    name: "Edificio L",
    latitude: 3.3414928713096415,
    longitude: -76.52941315641976,
    description: "Edificio L",
    exists: true,
    nicknames: ["El L"],
    images: [
      'https://www.icesi.edu.co/servicios/wp-content/uploads/2016/11/Edificio-de-Laboratorios-Universidad-ICESI-07-1024x683.jpg',
      'https://fastly.4sqi.net/img/general/600x600/42058579_VuDmx3B0-8h93UFFUXxK3mXzemB4HiH4ZH2m01A4gFE.jpg',
    ],
    histories: histories,
  ),
  BIC(
    bicId: "4",
    name: "Edificio E",
    latitude: 3.340737775278267,
    longitude: -76.53057187340244,
    description: "BIC 4",
    exists: true,
    nicknames: ["BIC 4", "BIC 4"],
    images: [
      'https://fastly.4sqi.net/img/general/600x600/24904355_GhEerqtebuuUy4XN1XhzhzZv8xYXeDyy8sdNsaJiVX8.jpg',
      'https://fastly.4sqi.net/img/general/600x600/45045828_0ND67x2wHrb9R1MouaFI0yI7UiitzzdU5kGhbmRMPcI.jpg',
    ],
    histories: histories,
  ),
];

class SpringBootBICDatasource implements BICDatasource {
  @override
  Future<List<BIC>> getBICs() {
    return Future.value(bics);
  }

  @override
  Future<BIC> getBICById(String bicId) {
    return Future.value(bics[int.parse(bicId) - 1]);
  }
}
