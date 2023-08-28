import '../../domain/domain.dart';

class HistoryDataSourceImpl extends HistoryDataSource {
  @override
  Future<History> getHistoryById(String historyId) {
    List<HistouricImage> images = [];

    images.add(HistouricImage(
      id: '1',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEg5Q5SoT57keFE84_5M_zQocZQF6r6cidOz4RtziVU5xnLv5awGOHkM5IbyxMrN1e2PaCRPF3gVGOmrYuUISKZMbWKStp2BFs4qrdGM5GUkVQpgAW-kaVHKxTlRgIfpy7dDrJ5rTf2jPMeXhp8lMpolAuCBHQfPTz9c6-JYKZRm4BZldZS79sTM9fYnKMiw/s1826/01.%20El%20terremoto%20de%201925%20%28baja%29.jpg',
      section: '1',
    ));

    List<HistouricText> texts = [];

    texts.add(HistouricText(
      id: '1',
      text:
          'Era una tarde de domingo bastante atípica para la soleada Cali. A eso de las cuatro y media ya el cielo presagiaba lluvia ¿Pero es junio?, se quejaban los caleños acostumbrados a sus bien marcadas temporadas de sol y agua. Minutos después iniciaba una llovizna interminable. Y como la relación de los caleños con la lluvia nunca ha sido buena, no había mucha gente en la calle. Lástima el clima, decían muchos, añorando poder salir a discutir el tema del día, la manera en que Pedro Nel Ospina, el Presidente de la República, solucionaría la crisis de ministros. Seguro incluye a Laureano Gómez, intuía acertadamente la mayoría.',
      startTime: 0,
    ));

    texts.add(HistouricText(
      id: '2',
      text:
          'Veintitrés minutos antes de las siete de la noche se sintió el primer movimiento, de lado a lado, suavecito, como en una hamaca. Y antes de que alguien pudiera decir “está temblando”, trepidó. Fueron 16 segundos que parecieron horas de movimientos irregulares, como si alguien hubiera cogido la ciudad por un costado y la estuviera zarandeando. El espanto se apoderó de la población que salió a las calles “como estaba”. Es que a quién le importa el pudor y el qué dirán ante un buen susto. Los cables de luz se reventaron y al mezclarse con la lluvia completaron un dantesco escenario.',
      startTime: 38,
    ));

    texts.add(HistouricText(
      id: '3',
      text:
          '¡San Emigdio, San Emigdio! gritaban desesperados los caleños, pero el santo italiano no escuchó esta vez. La luces se apagaron y con ello el pánico aumentó. Unos se abrazaban, otros se arrodillaban, unos más se tiraban al piso en cruz. Mientras unos rezaban y prometían a gritos componer su vida a cambio de un poco más de vida, otros solo atinaban a una risa nerviosa. El caos se apoderó de la ciudad. Cerca del matadero municipal el desmadre fue mayor, una de sus paredes se derribó y las reses previstas para el sacrificio de la madrugada siguiente salieron huyendo despavoridas en una especie de San Fermín criollo.',
      startTime: 70,
    ));

    texts.add(HistouricText(
      id: '4',
      text:
          'Los pocos edificios con que contaba la ciudad debieron ser desalojados. La torre del Colegio de Santa Librada –que funcionaba en el cruce de las actuales carrera 4 y calle 13–, quedó a “un pelo” de desprenderse y las autoridades debieron cerrar el paso. El palacio municipal se agrietó; igual suerte corrió el edificio donde funcionaba Relator, el periódico de la ciudad. Una de las atalayas del cuartel (ubicado en el sitio del actual CAM) se desplomó y otra quedó lista para ser derribada. En el edificio Otero, en ese momento en construcción, se tuvo que reemplazar una de las paredes.',
      startTime: 105,
    ));

    texts.add(HistouricText(
      id: '5',
      text:
          'Las iglesias vivieron su drama particular. Los arcos, el techo y la torre del reloj de la Catedral sufrieron daños mayores; su reloj se paró justo a las 6:37, como testigo mudo del momento mismo en que la tragedia empezó. La Ermita quedó literalmente en el suelo, solo la Virgen de la Soledad del Río, el Señor de la Caña y la luz que iluminaba a este último sobrevivieron. Como anunciando su despedida, el templo cayó en dos tramos, el segundo a mitad de la noche, con un estruendo que erizó hasta al más valiente. La torre de la iglesia de San Nicolás se rajó y de ella se desprendieron varios ladrillos, uno impactó al sacristán, quien en ese momento se aprestaba a repicar las campanas. La capilla del colegio de Santa Librada se fue cayendo, poco a poco, con el correr de las horas.',
      startTime: 138,
    ));

    texts.add(HistouricText(
      id: '6',
      text:
          'El convento de San Francisco tuvo su escena particular. Al momento del primer temblor estaban todos los padres reunidos rezando, arriba, en el lugar del coro. Y nadie se inmutó. “Dios sabe lo que hace”. Pero cuando trepidó y de la cornisa se desprendieron algunos ladrillos y uno de ellos rozó la cabeza de Fray Tomás Becerra, recordaron aquello de “A Dios rogando y con el mazo dando” ¡Todos a la escalera! Pero como no había luz, tropezarse era fácil. Uno de los padres rodó por el piso y terminó abajo con la cabeza rajada, una mano dislocada, una costilla rota y mucha vergüenza; el padre Becerra, mostrando frialdad y buen juicio se quedó tranquilo, sonriente, confiando en Dios y en la cornisa del órgano. Al día siguiente cada uno tenía su propia anécdota, uno contaba cómo un ladrillo le había tumbado, literalmente, su libro de oración de las manos; otro cómo se había congelado al ver desprenderse el pararrayos de la torre y avanzar amenazante a gran velocidad.',
      startTime: 183,
    ));

    texts.add(HistouricText(
      id: '7',
      text:
          'El terremoto no hizo distinción de clases. Las casas del sindicato popular se vinieron abajo, pero las casas de dos plantas del centro, las de las familias prestantes, también sufrieron grandes daños. El Hotel Francia quedó totalmente destruido, todavía nadie se explica cómo se logró que todos menos uno de los comensales y huéspedes alcanzaran a salir –y más aún, cómo el rezagado salió vivo de los escombros–. Las cantinas de Juanchito se derrumbaron y se quebraron las botellas de licor. Tremenda pérdida para los comerciantes, tremendo vacío para sus clientes.',
      startTime: 240,
    ));

    texts.add(HistouricText(
      id: '8',
      text:
          'Fueron tres remezones. Suficientes para llenar de pánico a una ciudad que no durmió. Las familias permanecieron en las calles, como pudieron improvisaron cambuches y se organizaron en parques y solares, todos con todos. Los enfermos de los hospitales que no salieron por sus propios medios tuvieron que ser evacuados. La noche era oscura, fría y lluviosa. Y el coro de perros aullando no ayudaba. Parecía el fin del mundo. Las pérdidas se calcularon en 400.000 dólares, una fortuna para la época. A la mañana siguiente hubo una misa campal en la Plaza de Cayzedo para agradecer al Todopoderoso haber conservado la vida. Ahí se incluyeron unos inexplicables presagios de nuevos temblores para la tarde, que solo llenaron de temor a las personas. Pero el “recen, arrepiéntanse, pidan piedad” se quedó corto ante la curiosidad: “mientras llega la tarde, vamos a ver escombros ve”.',
      startTime: 275,
    ));

    return Future.value(History(
      id: '1',
      title: 'El terremoto de 1925',
      audioUrl:
          'https://drive.google.com/file/d/1gXVOVGnUsOrLZlWOBtEqcTW9D_70i-Gi/view',
      texts: texts,
      images: images,
    ));
  }
}
