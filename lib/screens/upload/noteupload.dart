import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class noteupload extends StatefulWidget {
  const noteupload({Key? key}) : super(key: key);

  @override
  State<noteupload> createState() => _noteuploadState();
}

class _noteuploadState extends State<noteupload> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Center(
          child: Column(
            children: [
              Container(
                //padding: EdgeInsets.all(20),
                alignment: Alignment.bottomCenter,
                height: size.height / 9,
                width: size.width,
                decoration: BoxDecoration(
                    color: Color(0xff041E42),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
                child:Text(
                  "Quiser",
                  style: GoogleFonts.raleway(
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                      fontSize: 40,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
