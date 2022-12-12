import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kbox10 = SizedBox(
  height: 10,
);
const kbox20 = SizedBox(
  height: 20,
);
const kboxw20 = SizedBox(
  width: 20,
);
final List<String> imgList = [
  'https://theaxo.com/wp-content/uploads/2021/03/Untitled-design-5-1.jpg',
  'https://gagadget.com/media/post_big/Realme_GT_Master_Edition_and_Realme_GT_Explorer_Master_Edition.png',
  'https://static.garumax.com/wp-content/uploads/2022/10/28130819/Redmi-Note-12-1.jpg',
  'https://members.gentingrewards.com/Uploads/Images/Promotions/VQo_iPhone-14-Banner-1.jpg',
  'https://g6j4a6i4.stackpathcdn.com/wp-content/uploads/2021/08/Portada-del-articulo-imagen-principal.jpg',
  'https://www.oppo.com/content/dam/oppo-campaign-site/my/pages/store-pre-openning/oppo-a95-launch/oppo-A95-main-banner-1.jpg'
];
final List<String> text = [
  'Samsung',
  'Realme',
  'Redmi',
  'Iphone',
  'Motorola',
  'Oppo',
];
final List<String> text2 = [
  'Samsung\n₹ 20000',
  'Realme\n₹ 40000',
  'Redmi\n₹ 10000',
  'Iphone\n₹ 30000',
  'Motorola\n₹ 25000',
  'Oppo\n₹ 18000',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(2.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.network(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      //   padding: const EdgeInsets.symmetric(
                      //       vertical: 10.0, horizontal: 20.0),
                      //   child: Text(
                      //     'No. ${imgList.indexOf(item)} image',
                      //     style: const TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 20.0,
                      //       fontWeight: FontWeight.bold,
                      //     ),
                      //   ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();
