import 'dart:math';

import 'package:apprepeat/controllers/patronBlock.dart';

int createUniqueId() {
  return DateTime.now().microsecondsSinceEpoch.remainder(100000);
}

Future<Map<String, String>> daPayload() async {
  var bpaylod = await block.checkwordsdata;
  var rng = Random();
  var num = rng.nextInt(bpaylod.length);

  Map<String, String> payload = {
    "word": bpaylod[num].word,
    "answer": bpaylod[num].answer
  };

  return payload;
}

Future<String?> daPayload2() async {
  var bpaylod = await block.checkwordsdata;
  var rng = Random();
  var num = rng.nextInt(bpaylod.length);

  String payload = bpaylod[num].answer;

  return payload;
}

String getImagesNoti(){
  
    List<String> images=["https://img.freepik.com/vector-gratis/lindo-gato-donut-estilo-dibujos-animados-plana_138676-2624.jpg?size=338&ext=jpg",
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
    "https://img.freepik.com/vector-gratis/ilustracion-vector-dibujos-animados-lindo-corgi-beber-leche-te-boba-bebida-animal-concepto-aislado-vector-estilo-dibujos-animados-plana_138676-1943.jpg?w=2000",];
    var rng = Random();    
    var num2=rng.nextInt(images.length);
    return images[num2];
    

    

}
