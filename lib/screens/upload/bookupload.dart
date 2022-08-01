
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiser/components/bgfile.dart';

import 'package:quiser/screens/upload/noteupload.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class bookupload extends StatefulWidget {
  const bookupload({Key? key}) : super(key: key);

  @override
  State<bookupload> createState() => _bookuploadState();
}

class _bookuploadState extends State<bookupload> {
  var color = 0xff041E42;
  List<dynamic> departments = [];
  List<dynamic> semesterMaster = [];
  List<dynamic> semester = [];

  String? _did;
  String? _sid;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    this.departments.add({"id": 1, "lable": "MCA"});
    this.departments.add({"id": 2, "lable": "MBA"});
    this.departments.add({"id": 3, "lable": "BE(IT)"});

    this.semesterMaster = [
      {"Id": 1, "Name": "Sem-1", "ParentId": 1},
      {"Id": 2, "Name": "Sem-2", "ParentId": 1},
      {"Id": 3, "Name": "Sem-3", "ParentId": 1},
      {"Id": 4, "Name": "Sem-4", "ParentId": 1},
      {"Id": 1, "Name": "Sem-1", "ParentId": 2},
      {"Id": 2, "Name": "Sem-2", "ParentId": 2},
      {"Id": 3, "Name": "Sem-3", "ParentId": 2},
    ];
  }

  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        backgroundColor: Color(0xff041E42),
        title: Text("Quiser",
            style: GoogleFonts.raleway(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w600,
                fontSize: 35,
                color: Colors.white)),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            bgForAll(
              child: Column(
                children: [
                  Card(
                    elevation: 20,
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: EdgeInsets.symmetric(horizontal: 90, vertical: 10),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Stack(
                          children: [
                            Image.asset("assets/images/Quiser.png"),
                            Positioned(
                                bottom: 10,
                                right: 10,
                                child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return imagedialogbox();
                                          });
                                    },
                                    child: Icon(Icons.camera_alt_rounded,
                                        color: Colors.teal)))
                          ],
                        )),
                  ),
                  Form(
                      key: _form,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter valid book name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Book Name',
                                prefixIcon: Icon(Icons.bookmark_outlined),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.01,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: TextFormField(
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please enter valid author name';
                                }
                                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                  return 'Please enter valid author name';
                                }
                                return null;
                              },
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: 'Author Name',
                                prefixIcon:
                                    Icon(Icons.person_add_alt_1_rounded),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: FormHelper.dropDownWidget(
                              context,
                              "Select Department",
                              this._did,
                              this.departments,
                              (onChangeVal) {
                                this._did = onChangeVal;
                                print("Select Department: $onChangeVal");

                                setState(() {
                                  this.semester = this
                                      .semesterMaster
                                      .where(
                                        (element) =>
                                            element["ParentId"].toString() ==
                                            onChangeVal.toString(),
                                      )
                                      .toList();
                                });

                                this._sid = null;
                              },
                              (onValidateVal) {
                                if (onValidateVal == null) {
                                  return "Please select department";
                                } else {
                                  return null;
                                }
                              },
                              borderColor: Theme.of(context).primaryColor,
                              borderFocusColor: Theme.of(context).primaryColor,
                              borderRadius: 12,
                              optionLabel: "lable",
                              optionValue: "id",
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 18),
                            child: FormHelper.dropDownWidget(
                              context,
                              "Select Semester",
                              this._sid,
                              this.semester,
                              (onChangeVal) async {
                                this._sid = onChangeVal;
                                print("Select Semester: $onChangeVal");
                              },
                              (onValidate) {
                                if (onValidate == null) {
                                  return "Please select semester";
                                } else {
                                  return null;
                                }
                              },
                              borderColor: Theme.of(context).primaryColor,
                              borderFocusColor: Theme.of(context).primaryColor,
                              borderRadius: 12,
                              optionLabel: "Name",
                              optionValue: "Id",
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Card(
                              color: Colors.black12,
                              margin: EdgeInsets.symmetric(horizontal: 40),
                              child: Padding(
                                padding: EdgeInsets.all(5),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Please write description';
                                    }
                                    return null;
                                  },
                                  maxLength: 30,
                                  maxLines: 3, //or null
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Description"),
                                ),
                              )),
                          SizedBox(
                            height: size.height * 0.02,
                          ),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 10),
                            child: RaisedButton(
                              onPressed: () {
                                _form.currentState!.validate();
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(80.0)),
                              textColor: Colors.white,
                              padding: const EdgeInsets.all(0),
                              child: Container(
                                alignment: Alignment.center,
                                height: 50.0,
                                width: size.width * 0.5,
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(80.0),
                                    gradient: new LinearGradient(colors: [
                                      Color.fromARGB(255, 255, 136, 34),
                                      Color.fromARGB(255, 255, 177, 41)
                                    ])),
                                padding: const EdgeInsets.all(0),
                                child: const Text(
                                  'UPLOAD',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class dialogbox extends StatelessWidget {
  const dialogbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Container(
          height: 200,
          decoration: BoxDecoration(
            color: Color(0xff456672),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                child: InkWell(
                  child: Icon(Icons.book, size: 130, color: Colors.black87),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => bookupload()));
                  },
                ),
              ),
              // ),
              Container(
                child: InkWell(
                  child: Icon(Icons.note_add_outlined,
                      size: 130, color: Colors.black87),
                  onTap: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => noteupload()));
                  },
                ),
              ),
            ],
          )),
    );
  }
}

Widget imagedialogbox() {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
        height: 150,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child:
                          Icon(Icons.camera, size: 80, color: Colors.white70),
                      onTap: () {},
                    ),
                    Text(
                      "Camera",
                      style: TextStyle(color: Colors.white70),
                    )
                  ]),
            ),
            // ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: Icon(Icons.image, size: 80, color: Colors.white70),
                    onTap: () {},
                  ),
                  Text(
                    "Gallary",
                    style: TextStyle(color: Colors.white70),
                  )
                ],
              ),
            ),
          ],
        )),
  );
}
