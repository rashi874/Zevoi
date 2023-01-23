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
const kboxw5 = SizedBox(
  width: 5,
);
final List<String> imgList = [
  'https://www.bigcmobiles.com/media/slidebanner/w/h/whatsapp_image_2022-12-16_at_10.18.02_am.jpeg',
  'https://pisces.bbystatic.com/image2/BestBuy_US/dam/SOL-91600-rainbow-hero-sv_der-33deb27e-3938-4ff5-ab24-73e3758bdf44.jpg',
  'https://m.media-amazon.com/images/S/aplus-media-library-service-media/0bd1ce80-3ba6-4862-b038-d6fa40d85618.__CR0,0,1464,600_PT0_SX1464_V1___.jpg',
  'https://images.cnbctv18.com/wp-content/uploads/2022/06/OnePlusNord2T-1019x573.jpg',
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
                    bottom: 5.0,
                    left: 2.0,
                    right: 3.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomRight,
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
