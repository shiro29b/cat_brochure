import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Constants/constants.dart';

class InfoPage extends StatefulWidget {
  final Map<String, dynamic> catData;
  const InfoPage({super.key, required this.catData});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        //leadingWidth: 12,
        //iconTheme: const IconThemeData(color: Colors.brown),
        backgroundColor: Palette.bgcolor,
        title: Text('     ${widget.catData['breeds'][0]['name']} 🐾',
            style: GoogleFonts.montserrat(
              textStyle: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black)),
                  child: Image.network(
                    widget.catData['url'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Text('${widget.catData['breeds'][0]['name']} 🐾',
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                          color: Colors.brown,
                          fontSize: 28,
                          fontWeight: FontWeight.w600),
                    )),
              ),
              const Divider(
                thickness: 1,
                color: Palette.bgcolor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Origin :- ',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )),
                  Text(widget.catData['breeds'][0]['origin'],
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Palette.bgcolor,
              ),
              Text('Description :-',
                  style: GoogleFonts.playfairDisplay(
                    textStyle: const TextStyle(
                        color: Colors.brown,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  )),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Palette.bgcolor)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(widget.catData['breeds'][0]['description'],
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            color: Colors.brown,
                            fontSize: 15,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              ),
              const Divider(
                thickness: 1,
                color: Palette.bgcolor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('LifeSpan :- ',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )),
                  Text('${widget.catData['breeds'][0]['life_span']} years',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Palette.bgcolor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Weight :- ',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            color: Colors.brown,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )),
                  Text('${widget.catData['breeds'][0]['weight']['metric']} Kgs',
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                            color: Colors.brown,
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      )),
                ],
              ),
              const Divider(
                thickness: 1,
                color: Palette.bgcolor,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
