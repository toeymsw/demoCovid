import 'package:codeproj/model/card_covid.dart';
import 'package:codeproj/setting/text_setting.dart';
import 'package:flutter/material.dart';

class MedicalCard extends StatelessWidget {
  MedicalCard({super.key});
  List<CardCovid> lstMedical = [
    CardCovid(
        title: '1422',
        image: 'assets/icons/medical/dodc.png',
        description: 'Department of\nDisease Control'),
    CardCovid(
        title: '1330',
        image: 'assets/icons/medical/nhso.png',
        description: 'National Health\nSecurity Office'),
    CardCovid(
        title: '1669',
        image: 'assets/icons/medical/nifem.png',
        description: 'National Institute for\nEmergency Medicine'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(children: [
          Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  padding: const EdgeInsets.only(top: 10, left: 50, bottom: 10),
                  child: Text(
                    'Hotline',
                    style: headMedical,
                  ),
                ),
              ),
              SizedBox(
                height: 520,
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: lstMedical.length,
                    itemBuilder: (BuildContext context, int index) =>
                        MedicalInfo(
                          item: lstMedical[index],
                        )),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}

class MedicalInfo extends StatelessWidget {
  MedicalInfo({super.key, required this.item});

  CardCovid item;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            height: 50,
            width: MediaQuery.of(context).size.width / 1.27,
            padding: const EdgeInsets.only(
              left: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.indigo.shade700,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(15)),
            ),
            child: Row(children: [
              Image.asset(
                'assets/icons/medical/phone-call.png',
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  item.title.toString(),
                  style: const TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w900),
                ),
              )
            ]),
          ),
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width / 1.27,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.indigo.shade700, width: 2),
              borderRadius: const BorderRadius.vertical(bottom: Radius.circular(15)),
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Image.asset(
                    //'assets/icons/medical/dodc.png',
                    '${item.image}',
                    width: 70,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.description.toString(),
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.indigo.shade700),
                    textAlign: TextAlign.start,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
