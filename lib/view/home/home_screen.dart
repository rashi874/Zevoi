import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/view/profile/profile_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
  });
  final controller = PageController(viewportFraction: 0.8, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Hero(
                  tag: 'logo',
                  child: Text(
                    'Zevoi',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    log('');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ScreenProfile()));
                  },
                  child: const CircleAvatar(
                    // backgroundColor: Color.fromRGBO(136, 215, 170, 1.000),
                    child: Text(
                      'Z',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                // Text(user.email)
              ],
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              const Divider(),
              kbox10,
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Material(
                  borderRadius: BorderRadius.circular(30),
                  elevation: 10.5,
                  shadowColor: const Color.fromARGB(89, 118, 118, 118),
                  child: TextFormField(
                      scrollPadding: const EdgeInsets.all(2),
                      // controller: controller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                      // obscureText: obscure,
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 2, horizontal: 15),
                        fillColor: Colors.white,
                        hintStyle: const TextStyle(
                            fontWeight: FontWeight.w400, fontSize: 15),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        hintText: 'Search Products,Brands and More',
                        suffixIcon: const Icon(Icons.search),
                      )),
                ),
              ),
              kbox20,
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadiusDirectional.circular(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    kbox20,
                    kbox20,
                    CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1.0,
                        aspectRatio: 4.2,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        autoPlay: true,
                      ),
                      items: imageSliders,
                    ),
                    kbox20,
                    const Divider(),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Top Brands',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 27,
                                    backgroundImage:
                                        NetworkImage(imgList[index]),
                                  ),
                                  kbox10,
                                  Text(
                                    text[index],
                                    style: const TextStyle(fontSize: 11),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Latest Products',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextButton(
                              onPressed: () {}, child: const Text('View all'))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 220,
                      child: ListView.builder(
                          itemCount: 6,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 140,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(imgList[index]),
                                            fit: BoxFit.cover),
                                        // color:
                                        //     Color.fromARGB(255, 54, 200, 244),
                                        borderRadius: BorderRadius.circular(8)),
                                  ),
                                  kbox10,
                                  Text(
                                    text2[index],
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              // padding: EdgeInsets.all(8),
              height: 55,
              decoration: BoxDecoration(
                // color: Colors.black,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.home_outlined,
                        color: Color.fromARGB(255, 172, 172, 172),
                        // size: 35,
                      ),
                    ),
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.shopping_cart_outlined,
                        color: Color.fromARGB(255, 172, 172, 172),
                        // size: 35,
                      ),
                    ),
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.widgets_outlined,
                        color: Color.fromARGB(255, 172, 172, 172),
                        // size: 35,
                      ),
                    ),
                    IconButton(
                      enableFeedback: false,
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings_outlined,
                        color: Color.fromARGB(255, 172, 172, 172),
                        // size: 35,
                      ),
                    ),
                  ])),
        ));
  }
}
