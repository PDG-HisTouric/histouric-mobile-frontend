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

  @override
  Future<History> getHistory(String historyId) {
    List<HistouricImage> images = [];
    List<BIC> bics = [];

    images.add(HistouricImage(
      id: '1',
      imageUrl:
          'https://blogger.googleusercontent.com/img/b/R29vZ2xl/AVvXsEgkGUf5dm_XtQk5m8uQeDmrGu5ijihwMMP20zmgAjrCnEogMkdm0R4jB2y45WJv4PgTVhbE7im9_7U32wOt5qYaOHpbuT4uSuePEO_Z6I6tDFkF1ZfqKe-gB0OAs8jX7sKkD3CCuPCE7Rr5LuaEkJz7mvRPxtAVbuOeOUsm7HK0St9fhr92zIbjEqnFYEjE/s1501/13.%20Por%20obra%20y%20gracia%20de%20Micaela%20%282%29.jpg',
      section: '1',
    ));

    List<HistouricText> texts = [];

    texts.add(HistouricText(
      id: '1',
      text:
          'El terremoto del 7 de junio de 1925 la dejó reducida a una pila de tierra y hojas de palma. “Se acabó la Ermita”, decía la gente ante la evidencia del desastre, sin saber que este solo sería la “excusa” para construir un ícono de la ciudad. Micaela Castro Borrero no iba a permitir su fin, por eso había rescatado de los escombros lo que milagrosamente se salvó: el lienzo del Señor de la Caña y la estatua de Nuestra Señora de la Soledad del Rio, dos imágenes que siempre han acompañado al templo.',
      startTime: 0,
    ));

    texts.add(HistouricText(
      id: '2',
      text:
          'La primera Ermita se construyó alrededor de 1590 con el fin de poner a la Virgen como custodia de la ciudad ante los frecuentes desbordamientos del río Cali. Se ubicó, como su nombre lo indica, alejada de todo, junto al rio, a varios metros de su localización actual.\n\nPero a pesar de los rezos y las encomiendas, el problema de los desbordamientos del río no se solucionó. Y cada vez que decidía salirse de su cauce, la Ermita sufría las consecuencias.',
      startTime: 29,
    ));

    texts.add(HistouricText(
      id: '3',
      text:
          'Para 1678 la capilla ya se había ganado un lugar en el corazón de los caleños, se decidió entonces protegerla trasladándola de sitio... y de paso, aprovechar para remozarla. Si bien esta segunda versión fue mejor, su aspecto no tenía nada que ver con la iglesia actual, era una capilla sencilla, de bahareque y techo de palma, muy básica ¡Ese fue el templo que destruyó el terremoto!',
      startTime: 56,
    ));

    texts.add(HistouricText(
      id: '4',
      text:
          'Mover el templo tampoco resolvió el problema, si el río se salía, la capilla se inundaba. Fue por esto que en 1741, aprovechando la presencia de un emisario del rey Felipe V, se aprobó desviar ligeramente su cauce, lo necesario para garantizar la conservación de la capilla. Por esta decisión, diez años después, el río Cali tomaría en ese sector su trayecto actual y se formaría la gran zona verde que hoy ocupa el parque Uribe Uribe ¡La Ermita quedó así a salvo de las inundaciones!',
      startTime: 78,
    ));

    texts.add(HistouricText(
      id: '5',
      text:
          'La construcción de la actual Ermita empezó en 1930 y estuvo a cargo de Pablo Emilio Páez, un ingeniero del Ferrocarril del Pacífico.\n\n—Ni usted me pregunta cuánto tengo en caja para esta obra ni yo le pregunto cuánto va a costar―, fue la condición de Micaela al empezar la obra.\n\nEs que la señora solo tenía trescientos pesos y la obra valía muchísimo más. Ella lo sabía, pero se sentía capaz de conseguir los fondos.',
      startTime: 108,
    ));

    texts.add(HistouricText(
      id: '6',
      text:
          'Su primer reto fue convencer a la Iglesia. Monseñor Heladio Perlaza, el primer obispo que tuvo la Diócesis de Cali, no estaba muy convencido de que el proyecto fuera factible ―trescientos pesos no compraban ni el hierro―, pero aceptó al verse “arrollado” por la convicción de Micaela.\n\nUna vez conseguido el permiso, ella se reunió con Alfredo Vásquez Cobo, el administrador del Ferrocarril del Pacífico, y consiguió que aportara al diseñador de la obra, el ingeniero Páez.',
      startTime: 133,
    ));

    texts.add(HistouricText(
      id: '7',
      text:
          'Con el diseño en mano, Micaela empezó el recaudo de fondos. Y se organizó de modo que no se le escapara nadie. Su “libro de oro de los cooperadores”, donde registraba cuidadosamente quién ya había aportado y cuánto, causaba terror entre algunos, pues ella no tenía ningún empacho en acercarse de frente y decir “usted no figura en mi libro, con cuánto me va a colaborar”.',
      startTime: 157,
    ));

    texts.add(HistouricText(
      id: '8',
      text:
          'Alfonso Caicedo Roa, una de las billeteras más robustas de la Cali de esa época, fue una de sus “victimas” más notables, respondió a las demandas de Micaela con generosidad: aportó hierro “todo el que haga falta” y dinero para poner al día el pago de la mano de obra. Eran los primeros días de la Segunda Guerra Mundial y por efecto de ella el hierro era escaso y muy costoso.',
      startTime: 178,
    ));

    texts.add(HistouricText(
      id: '9',
      text:
          'Pero hubo también aportes anónimos. El más llamativo ocurrió justo al final de la obra, cuando solo hacía falta el altar.\n\n―Hay que traerlo de Italia y cuesta diez mil pesos, había dicho el ingeniero.\n\nY la preocupación de Micaela fue enorme, al cuaderno ya no le cabían más nombres y las arcas estaban vacías. Recibió entonces un mensaje del director del banco,\n\n―el ganador de la lotería me ha encargado decirle que hizo una promesa y que para honrarla le envía este aporte para la Ermita― Eran diez mil pesos.',
      startTime: 198,
    ));

    texts.add(HistouricText(
      id: '10',
      text:
          'Desde antes de su inauguración, su tardío estilo neogótico, muy de moda en la Europa de mediados del siglo XVIII, pero inimaginable para la primera mitad del siglo XX, generó gran expectativa. Todo el mundo estaba atento a su evolución. “Es una réplica en pequeña escala de una catedral alemana”, se decía.',
      startTime: 227,
    ));

    texts.add(HistouricText(
      id: '11',
      text:
          'La expectativa creció cuando la edificación tuvo forma y aumentó con la llegada de los detalles: el juego de seis campanas construido en París; el reloj de la torre; los vitrales, el de los doce apóstoles –incluido Pablo, excluido Judas–, para el frente del atrio, y el del Jesús crucificado, para el campanario.',
      startTime: 244,
    ));

    texts.add(HistouricText(
      id: '12',
      text:
          'La Ermita se reinauguró el 25 de noviembre de 1942 y durante tres décadas formó parte de las mejores postales de la ciudad; junto con el Hotel Alférez Real, el teatro Jorge Isaacs, el edificio de la Colombiana de Tabaco y el puente Ortiz formaron la zona rosa. Todo lo elegante, todo lo importante, sucedía ahí.',
      startTime: 261,
    ));

    texts.add(HistouricText(
      id: '13',
      text:
          'A fines de los sesenta el uso del suelo cambió, el comercio se adueñó del espacio, la zona perdió su elegancia, se llenó de paraderos de buses; el Alférez Real fue demolido, ahí se construyó el parque de los Poetas, a la larga un refugio de indigentes y atracadores. Solo la construcción del boulevard del río en 2012 le dio un nuevo aire al sector, la iglesia volvió a ser un sitio obligado para los turistas, una fotografía que no puede faltar. Pero aún el sector es frágil.\n\nMicaela murió el 8 de junio de 1964 dejándonos un enorme legado. Pero ni la muerte la apartó de la Ermita ¡Ahí, al fondo a la izquierda, reposan sus restos!',
      startTime: 283,
    ));

    return Future.value(History(
      id: '2',
      title: 'Por obra y gracia de Micaela',
      audioUrl:
          'https://drive.google.com/file/d/1ZdWv52KLT5SSkjrLMIfptrFw57-6HBC2/view',
      texts: texts,
      images: images,
    ));
  }
}
