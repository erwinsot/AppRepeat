import 'package:apprepeat/components/timer.dart';
import 'package:apprepeat/controllers/patronBlock.dart';
import 'package:apprepeat/models/models.dart';
import 'package:apprepeat/service/notificationServer.dart';
import 'package:apprepeat/utils/utils.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:apprepeat/utils/globals.dart' as globals;


Cartas(BuildContext context, List<CheckWordsData> datos) {
  // "animation: false" does the trick
  // "index" is the initial value when the swiper is shown

  return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width,
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Swiper(
          itemCount: datos.length,
          itemBuilder: (BuildContext context, int index) {
            //  Future.delayed(Duration(milliseconds: 1000), () {
            //   return Center(child: CircularProgressIndicator());
            // });

            return InkWell(
              onLongPress: () {
                showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                          alignment: Alignment.center,
                          content: const Text(
                            "Delete?",
                            textAlign: TextAlign.center,
                          ),
                          actions: [
                            OutlinedButton(
                                onPressed: () async {
                                  await block.deleteWord(
                                      datos[index].rowid, datos[index]);
                                  Navigator.pop(context);
                                },
                                child: const Text("Delete")),
                            const SizedBox(
                              width: 90,
                            ),
                            OutlinedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text("Cancel"))
                          ],
                        ));
              },
              onDoubleTap: (){
                showDialog(
                  context: context,
                  builder: (_)=> AlertDialog(
                    content: const Text("Create Notification?",textAlign: TextAlign.center,),
                    alignment: Alignment.center,
                    actions: [
                      Container(
                        alignment: Alignment.center,
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         OutlinedButton(onPressed: (){                        
                        showTimerPicker(context);                                                
                      }, child: const Text("Interval",textAlign: TextAlign.center,),),

                      OutlinedButton(onPressed: (){
                        if(globals.minutos.abs().inMinutes<1){
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                              backgroundColor: Colors.pinkAccent,
                                                  content: Text("Minimum interval 1 minutes")));
                                      }
                        else{
                        Map<String, String> payload={datos[index].word:datos[index].answer};
                        String image=getImagesNoti();
                        //NotificationService.showNotification(title: "xx", body: "fdfd",payload: payload);
                        NotificationService.createRepeatNotification(payload, datos[index].word, image,globals.minutos.inSeconds);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                              backgroundColor: Colors.pinkAccent,
                                              content: Text("Interval of ${globals.minutos.abs().inMinutes} minutes created")));
                        Navigator.pop(context);
                        }
                        
                         
                      }, child: Text("Create",textAlign: TextAlign.center,),),

                      OutlinedButton(onPressed: (){
                         Navigator.pop(context);
                      }, child: Text("Cancel"))

                      ],),)
                      
                     
                    ],
                  ));
              },
              child: FlipCard(
                front: Container(
                    color: Colors.deepOrangeAccent,
                    child: Center(
                      child: Text(datos[index].word,
                          style: const TextStyle(
                              fontStyle: FontStyle.normal, fontSize: 20)),
                    )),
                back: Container(
                  color: Colors.amber,
                  child: Center(
                    child: Text(
                      datos[index].answer,
                      style: const TextStyle(
                          fontStyle: FontStyle.normal, fontSize: 20),
                    ),
                  ),
                ),
              ),
            );
          },
          pagination: const SwiperPagination(),
          control: const SwiperControl(),
          viewportFraction: 0.8,
          scale: 0.9,
        ),
      ));
}
