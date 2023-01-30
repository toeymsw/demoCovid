import 'dart:ui';

import 'package:codeproj/model/card_covid.dart';
import 'package:codeproj/model/covid_data.dart';
import 'package:codeproj/setting/text_setting.dart';
import 'package:flutter/material.dart';

class SymptomsCard extends StatelessWidget {
  SymptomsCard({super.key});
  List<CardCovid> lstSymptoms = [
    CardCovid(
        image: 'assets/icons/symptoms/short-breath.png',
        description: 'Shortness of breath'),
    CardCovid(
        image: 'assets/icons/symptoms/sore-throat.png',
        description: 'Sore throat'),
    CardCovid(
        image: 'assets/icons/symptoms/headache.png', description: 'Headache'),
    CardCovid(
        image: 'assets/icons/symptoms/dry-cough.png', description: 'Cough'),
    CardCovid(
        image: 'assets/icons/symptoms/asthma.png', description: 'Tiredness'),
    CardCovid(
        image: 'assets/icons/symptoms/muscle-pain.png',
        description: 'Muscle pain'),
    CardCovid(
        image: 'assets/icons/symptoms/diarrhoea.png', description: 'Diarrhoea'),
    CardCovid(
        image: 'assets/icons/symptoms/sneezing.png', description: 'Sneezing'),
    CardCovid(image: 'assets/icons/symptoms/fever.png', description: 'Fever'),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          Stack(
            children: [
              Container(
                height: 740,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                    color: Colors.yellow.shade50,
                    border: Border.all(color: Colors.yellow.shade900, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      'Symptoms of Covid 19',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.deepOrange.shade800,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 675,
                    child: GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2, childAspectRatio: 1.3),
                        itemCount: lstSymptoms.length,
                        itemBuilder: (context, index) => SymptomsInfo(
                              item: lstSymptoms[index],
                            )),
                  ),
                ]),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class SymptomsInfo extends StatelessWidget {
  SymptomsInfo({super.key, required this.item});
  CardCovid item;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.yellow.shade50,
      margin: const EdgeInsets.all(2),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(8),
            height: 90,
            width: 90,
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
                color: Colors.purple.shade100,
                shape: BoxShape.circle,
                image: DecorationImage(
                    alignment: Alignment.bottomCenter,
                    scale: 6.2,
                    image: AssetImage('${item.image}'))),
          ),
          Text(
            item.description.toString(),
            style: desText,
          )
        ],
      ),
    );
  }
}
