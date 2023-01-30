import 'dart:ui';

import 'package:codeproj/model/card_covid.dart';
import 'package:codeproj/model/covid_data.dart';
import 'package:codeproj/setting/text_setting.dart';
import 'package:flutter/material.dart';

class PreventiveCard extends StatelessWidget {
  PreventiveCard({super.key});
  List<CardCovid> lstpreventive = [
    CardCovid(
      description: 'Wash your hands',
      image: 'assets/icons/wash-your-hands.png',
    ),
    CardCovid(
      description: 'Wear a mask',
      image: 'assets/icons/protection-mask.png',
    ),
    CardCovid(
      description: 'Social distancing',
      image: 'assets/icons/social-distancing.png',
    ),
    CardCovid(
      description: 'Don\'t touch your face',
      image: 'assets/icons/no-touch.png',
    ),
    CardCovid(
      description: 'Avoid crowded places',
      image: 'assets/icons/avoid-crowded.png',
    ),
    CardCovid(
      description: 'Stay home',
      image: 'assets/icons/stay-at-home.png',
    ),
    CardCovid(
      description: 'getting the vaccine',
      image: 'assets/icons/professor.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(10),
          height: 50,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue.shade100, Colors.green.shade50]),
              border: Border.all(
                color: Colors.transparent,
                width: 2,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12))),
          child: const Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                'Preventive',
                style: headTitle,
              ),
            ),
          ),
        ),
        Container(
          height: 200,
          margin: const EdgeInsets.only(left: 10, right: 10),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: lstpreventive.length,
            itemBuilder: (BuildContext context, int index) {
              return PreventiveInfo(
                item: lstpreventive[index],
              );
            },
          ),
        )
      ],
    );
  }
}

class PreventiveInfo extends StatelessWidget {
  PreventiveInfo({super.key, required this.item});

  CardCovid item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12))),
          child: Container(
            height: 180,
            width: 140,
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.green.shade600, width: 1.5),
                borderRadius: const BorderRadius.all(Radius.circular(12))),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    item.description.toString(),
                    style: numInfo,
                    textAlign: TextAlign.center,
                  ),
                ),
                const Spacer(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white)),
                        child: Image.asset(
                          '${item.image}',
                          height: 95,
                        ),
                      )),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
