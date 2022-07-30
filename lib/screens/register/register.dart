import 'package:flutter/material.dart';
import 'package:quiser/components/background.dart';
import 'package:quiser/screens/login/login.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  bool isHiddenPassword = true;
  // Form
  final GlobalKey<FormState> _form = GlobalKey<FormState>();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();

  List<dynamic> departments = [];
  List<dynamic> semesterMaster = [];
  List<dynamic> semester = [];
  List<dynamic> year = [];

  String? _did;
  String? _sid;
  String? _yid;

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

    this.year.add({"ID": 1, "year": "2022"});
    this.year.add({"ID": 2, "year": "2023"});
    this.year.add({"ID": 3, "year": "2024"});
    this.year.add({"ID": 4, "year": "2025"});
    this.year.add({"ID": 5, "year": "2026"});

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.fromLTRB(40, 40, 0, 0),
                  child: const Text(
                    'REGISTER',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                        fontSize: 36),
                    textAlign: TextAlign.left,
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
                    if(value!.isEmpty){
                        return 'Please enter valid user name';
                    }
                    if(!RegExp(r'^[a-zA-Z]+$').hasMatch(value)){
                      return 'Please enter valid user name';
                    }
                    return null;
                    },
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      icon: Icon(Icons.person),
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
                      if(value!.isEmpty){
                        return 'Please enter valid enrollment number';
                      }if(value.length != 16){
                        return 'Enrollment number must be 16 digits';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Enrollment Number',
                      icon: Icon(Icons.numbers_outlined),
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
                      if(value!.isEmpty)
                        return "Email is required";
                      if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return "Please enter valid email('@ or .')";
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: [AutofillHints.email],
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      icon: Icon(Icons.mail_outline_rounded),
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
                  height: size.height * 0.01,
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
                   (onValidate){
                     if (onValidate == null) {
                       return "Please select department";
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
                  height: size.height * 0.01,
                ),


                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 18),
                  child: FormHelper.dropDownWidget(
                    context,
                    "Passing Year",
                    this._yid,
                    this.year,
                        (onChangeVal) {
                      this._yid = onChangeVal;
                      print("Select Year: $onChangeVal");
                    },
                        (onValidateVall) {
                      if (onValidateVall == null) {
                        return "Please select Year";
                      } else {
                        return null;
                      }
                    },
                    borderColor: Theme.of(context).primaryColor,
                    borderFocusColor: Theme.of(context).primaryColor,
                    borderRadius: 12,
                    optionLabel: "year",
                    optionValue: "ID",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _pass,
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'Please enter valid password';
                      }if(value.length < 9){
                        return "Password must be more than 8 character";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      labelText: 'Password',
                      icon: Icon(Icons.lock_outline_rounded),
                      suffixIcon: InkWell(
                        onTap: (){_togglePasswordView();},
                        child: Icon(Icons.visibility_rounded),
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: isHiddenPassword,
                    // enableSuggestions: false,
                    // autocorrect: false,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),

                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  child: TextFormField(
                    controller: _confirmPass,
                    validator: (val){
                      if(val!.isEmpty)
                        return "This field can't be empty";
                      if(val != _pass.text)
                        return "Password doesn't match";
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Confirm Passwrod',
                      icon: Icon(Icons.password_rounded),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),

                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
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
                        'SIGN UP',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginScreen()));
                    },
                    child: const Text(
                      "Already have an account? Sign In",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    if(isHiddenPassword == true){
      isHiddenPassword = false;
    }else{
      isHiddenPassword = true;
    }
    setState(() {

    });
  }
}
