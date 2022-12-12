import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zevoyi/controller/provider/profile_provider.dart';
import 'package:zevoyi/core/constant/const.dart';
import 'package:zevoyi/model/profile_model/profile_model.dart';
import 'package:zevoyi/view/profile/widget/profile_textfield.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<ProfileProvider>(context, listen: true);
    final TextEditingController text = TextEditingController();
    return Scaffold(
        appBar: AppBar(
          // elevation: 0,
          title: const Text(
            'Personal Information',
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
        ),
        body: Center(
            child: FutureBuilder<User?>(
                future: data.fetch('rashidrashi028@gmail.com'),
                // future: DioClient.getUser(id: '58c44173-e393-4d68-aa48-69ddeed2404c'),
                builder: (context, snapshot) {
                  return snapshot.hasData
                      ? SingleChildScrollView(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          physics: const ScrollPhysics(),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kbox20,
                              ListView.builder(
                                shrinkWrap: true,
                                physics: const ScrollPhysics(),
                                itemCount: 3,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data!.data.username
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text('Edit'),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: 200,
                                        height: 40,
                                        child: UserTextfield(
                                          hinttexts: 'Zukker Wagen',
                                          controller: text,
                                          obscure: false,
                                          msg: 'null',
                                        ),
                                      ),
                                      kbox20,
                                    ],
                                  );
                                },
                              ),
                            ],
                          ),
                        )
                      : Column(
                          children: [
                            CircularProgressIndicator(),
                            kbox20,
                            const Text(
                              'Change Password',
                              style: TextStyle(color: Colors.red),
                            ),
                            kbox20,
                            const Text(
                              'Manage Password',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            kbox20,
                            const Text(
                              'Zukker Wagen\n942562626',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            kbox20,
                            const Text(
                              'Street 231 l.America,washington\nlocal pin 43443',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                            kbox20,
                            TextButton(
                              onPressed: () {},
                              child: const Text('ADD A NEW ADDRESS'),
                            ),
                            kbox20,
                            ElevatedButton(
                              onPressed: () {},
                              child: const Text('Logout'),
                            )
                          ],
                        );
                })));
  }
}
