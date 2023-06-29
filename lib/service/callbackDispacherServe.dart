import 'dart:math';
import 'package:apprepeat/service/awesomeNotifications.dart';
import 'package:workmanager/workmanager.dart';

void callbackDispatcher() async {
  Workmanager().executeTask((taskName, inputData) async {
    List<String> images = [
      "https://img.freepik.com/vector-gratis/lindo-gato-donut-estilo-dibujos-animados-plana_138676-2624.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/ilustracion-dibujos-animados-lindo-rey-cerdo-gafas-concepto-animal-aislado-caricatura-plana_138676-2291.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/lindo-gato-malo-traje-gafas-sol-ilustracion-icono-dibujos-animados-bate-beisbol-concepto-icono-moda-animal-aislado-estilo-dibujos-animados-plana_138676-2170.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/ilustracion-icono-vector-dibujos-animados-lindo-gato-mano-concepto-icono-naturaleza-animal-aislado-premium-vector-estilo-dibujos-animados-plana_138676-4085.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/kitsune-lindo-personaje-dibujos-animados-espada-objeto-arte-aislado_138676-3159.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/personaje-dibujos-animados-lindo-gato-aguacate-fruta-animal-aislada_138676-3141.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/ejemplo-lindo-icono-vector-historieta-nino-monstruo-concepto-icono-vacaciones-monstruo-aislado-vector-premium-estilo-dibujos-animados-plana_138676-3995.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/gato-lindo-ilustracion-icono-vector-dibujos-animados-hueso-pescado-concepto-icono-naturaleza-animal-aislado-premium-vector-estilo-dibujos-animados-plana_138676-4270.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/astronauta-flotando-ilustracion-icono-vector-historieta-globo-estrella-concepto-icono-tecnologia-ciencia-aislado-vector-premium-estilo-dibujos-animados-plana_138676-3404.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/lindo-astronauta-montando-cohete-agitando-mano-icono-dibujos-animados-ilustracion-concepto-icono-tecnologia-ciencia_138676-2130.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/lindo-conejo-sosteniendo-zanahoria-dibujos-animados-vector-icono-ilustracion-animal-naturaleza-icono-concepto-aislado_138676-5071.jpg?size=338&ext=jpg",
      "https://img.freepik.com/vector-gratis/ilustracion-vector-dibujos-animados-lindo-corgi-beber-leche-te-boba-bebida-animal-concepto-aislado-vector-estilo-dibujos-animados-plana_138676-1943.jpg?w=2000",
    ];
    var rng = Random();
    var num = rng.nextInt(inputData!["num"]);
    var num2 = rng.nextInt(images.length);
    createPlantFoodNotification(
        inputData["arrays"][num],
        {"word": inputData["arrays"][num], "answer": inputData["array2"][num]},
        images[num2]);
    //_showNotificationWithDefaultSound2(inputData["arrays"][num],inputData["array2"][num]);
    return Future.value(true);
  });
}
