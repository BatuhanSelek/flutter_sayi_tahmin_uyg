import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_sayi_tahmin_uyg/SonucEkrani.dart';

class Tahminekrani extends StatefulWidget {
  const Tahminekrani({super.key});

  @override
  State<Tahminekrani> createState() => _TahminekraniState();
}

class _TahminekraniState extends State<Tahminekrani> {
  var tfTahmin = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = "";

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    print("Rastgele Sayı : $rastgeleSayi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Tahmin Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Kalan Hak : $kalanHak",
              style: const TextStyle(
                  color: Colors.red, fontSize: 36, fontWeight: FontWeight.bold),
            ),
            Text(
              "Yardım : $yonlendirme",
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(9.0),
              child: TextField(
                controller: tfTahmin,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: "Tahmin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text("TAHMİN ET"),
                onPressed: () {
                  setState(() {
                    kalanHak = kalanHak - 1;
                  });
                  int tahmin = int.parse(tfTahmin.text);
                  if (tahmin == rastgeleSayi) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Sonucekrani(
                                  sonuc: true,
                                )));
                    return;
                  }
                  if (tahmin > rastgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini AZALT";
                    });
                  }
                  if (tahmin < rastgeleSayi) {
                    setState(() {
                      yonlendirme = "Tahmini ARTTIR";
                    });
                  }
                  if (kalanHak == 0) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Sonucekrani(
                                  sonuc: false,
                                )));
                  }
                  tfTahmin.text = "";
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
