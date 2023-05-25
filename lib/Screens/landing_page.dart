import 'dart:convert';

import 'package:cat_brochure/Constants/constants.dart';
import 'package:cat_brochure/Screens/info_page.dart';
import 'package:cat_brochure/Services/get_services.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  List<dynamic> catData = [];

  GetServices gs = GetServices();

  getCatData() async {
    var temp = await gs.getCatsData();
    catData = jsonDecode(temp.body);
    //print(catData[0]['url']);
    setState(() {});
  }

  @override
  void initState() {
    getCatData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.bgcolor,
        title: Center(
            child: Text('Meow 🐾',
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                ))),
      ),
      body: catData.isEmpty
          ? const Center(
              child: CircularProgressIndicator(
              color: Colors.brown,
            ))
          : GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: catData.length,
              itemBuilder: (BuildContext context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => InfoPage(
                                  catData: catData[index],
                                )));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(width: 2, color: Colors.brown)),
                      child: Column(children: [
                        AspectRatio(
                          aspectRatio: 1.2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12.0),
                            child: Image.network(
                              catData[index]['url'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Flexible(
                          child: Text(catData[index]['breeds'][0]['name'],
                              style: GoogleFonts.montserrat(
                                textStyle: const TextStyle(
                                    color: Colors.brown,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              )),
                        ),
                      ]),
                    ),
                  ),
                );
              }),
    ));
  }
}
