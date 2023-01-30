import 'package:codeproj/model/card_covid.dart';
import 'package:codeproj/setting/text_setting.dart';
import 'package:flutter/material.dart';

class DetailCovid extends StatelessWidget {
  final List<CardCovid> payload;
  const DetailCovid({super.key, required this.payload});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 2.3,
            padding: const EdgeInsets.all(8),
            child: GridView.builder(
              //physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5,
                childAspectRatio: 1.8,
              ),
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  elevation: 4,
                  shadowColor: Colors.green.shade600,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12))),
                  child: Container(
                    decoration: BoxDecoration(
                        color: payload[index].color?.withOpacity(0.25) ??
                            Colors.white,
                        border: Border.all(
                            ////////////// check null type color?
                            width: 2,
                            color: payload[index].color ?? Colors.white),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12))),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            ///////////////////// check null type string
                            payload[index].title ?? '',
                            style: headTitle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            payload[index].subtitle ?? '',
                            style: numInfo,
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Image.asset(
                        //     'assets/icons/bacteria.png',
                        //     height: 20,
                        //   ),
                        // )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
