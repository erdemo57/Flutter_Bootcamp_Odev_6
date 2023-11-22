import 'package:flutter/material.dart';
import 'package:flutter_bootcamp_odev_6/renkler.dart';
import 'package:flutter_bootcamp_odev_6/sahibinden_app/data/entity/arabalar.dart';

class ArabalarSayfa extends StatefulWidget {
  const ArabalarSayfa({super.key});

  @override
  State<ArabalarSayfa> createState() => _ArabalarSayfaState();
}

class _ArabalarSayfaState extends State<ArabalarSayfa> {
  Future<List<Arabalar>>arabalariYukle() async {
    var arabalarListesi = <Arabalar>[];
    var a1 = Arabalar(id: 1, resim: "6.png", aciklama: "HATASIZ 2014 ÇIKIŞLI DÜŞÜK KİLOMETRE EKSTRALI+LANSMAN RENK ", konum: "Yalova/Merkez", fiyat: 697.155);
    var a2 = Arabalar(id: 2, resim: "7.png", aciklama: "TR nin EN UYGUNU !!! FIRSAT ARACI!!! MAKYAJLI KASA YENİ TİP !!!", konum: "İzmir/Bornova", fiyat: 538.555);
    var a3 = Arabalar(id: 3, resim: "5.png", aciklama: "2015 GİULİETTA 1.6JTD PROG.PLUS HATASIZ D.N.A. MOD DİJT KLİM.", konum: "İstanbul/Eyüpsultan", fiyat: 495.255);
    var a4 = Arabalar(id: 4, resim: "4.png", aciklama: "Alfa Romeo 2021 Giulietta 1.6 50.200 km", konum: "İzmir/Konak", fiyat: 720.355);
    var a5 = Arabalar(id: 5, resim: "2.png", aciklama: "SAHİBİNDEN TEMİZ GIULIETTA", konum: "Muğla/Fethiye", fiyat: 797.444);
    var a6 = Arabalar(id: 6, resim: "1.png", aciklama: "FARKLI OLMAK ISTEYENLERE-GEREKSİZ MUHABBET İÇİN YAZMAYIN", konum: "Tekirdağ/Çorlu", fiyat: 879.556);
    var a7 = Arabalar(id: 7, resim: "3.png", aciklama: "KURUM MÜDÜRÜNDEN SIFIR GİBİ 55binde", konum: "Balıkesir/Ayvalık", fiyat: 999.577);
    arabalarListesi.add(a1);
    arabalarListesi.add(a2);
    arabalarListesi.add(a3);
    arabalarListesi.add(a4);
    arabalarListesi.add(a5);
    arabalarListesi.add(a6);
    arabalarListesi.add(a7);

    return arabalarListesi;
  }
  @override
  Widget build(BuildContext context) {



    return  Scaffold(

      resizeToAvoidBottomInset: false,

      appBar: AppBar(

        backgroundColor: anaRenk,
        title: const Row(
          children: [
            Icon(Icons.format_align_left),

            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    Text("Arama Sonucu ",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Roboto",),),
                    Text("7 sonuc bulundu",style: TextStyle(fontSize: 16,color: Colors.white,fontFamily: "Roboto",),),

                  ],

                ),
            ),

          ],

        ),





      actions: const [
        SizedBox(width:35,child: Icon(Icons.search,color:Colors.white,)),
        SizedBox(width:35,child: Icon(Icons.share,color:Colors.white)),
        SizedBox(width:35,child: Icon(Icons.star_border,color:Colors.white)),



      ],),

      body:

      Column(
        children: [

          Image.asset("resimler/11.png"),
          Expanded(
            child: FutureBuilder<List<Arabalar>>(


              future: arabalariYukle(),

              builder: (context,snapshot){
                if(snapshot.hasData)
                {
                  var arabalarListesi = snapshot.data;
                  return

                    ListView.builder(
                      itemCount: arabalarListesi!.length,
                      itemBuilder: (context,indeks){
                        var araba = arabalarListesi[indeks];
                        return

                          Card(

                          color: arkaplan,
                          shadowColor: yaziRenk2,
                          child: SizedBox(height: 100,width: 100,
                            child:


                               Row( mainAxisAlignment: MainAxisAlignment.start,
                                children: [


                                  SizedBox(width:128,height:500,
                                      child: Image.asset("resimler/${araba.resim}")),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(araba.aciklama,style: TextStyle(fontSize: 15,color:yaziRenk1,fontFamily: "Roboto")),


                                          Row(
                                            children: [
                                              Icon(Icons.location_on_outlined,color: yaziRenk1,size: 13,),
                                              Text(araba.konum,style: TextStyle(fontSize: 13,color: yaziRenk1,fontFamily: "Roboto"),),
                                              const Spacer(),

                                              Padding(
                                                padding: const EdgeInsets.only(top: 10,right: 20),
                                                child: Text("${araba.fiyat} TL",style: TextStyle(color: anaRenk,fontWeight: FontWeight.bold,fontFamily: "Roboto"),),
                                              )
                                            ],
                                          ),


                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),

                          ),
                        );

                      });
                }else{
                  return const Center();
                }


              },
            ),
          ),
        ],
      ),


    );
  }
}
