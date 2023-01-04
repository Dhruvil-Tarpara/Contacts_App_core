import 'dart:io';
import 'package:contacts/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:image_picker/image_picker.dart';

class Pagetwo extends StatefulWidget {
  const Pagetwo({Key? key}) : super(key: key);

  @override
  State<Pagetwo> createState() => _PagetwoState();
}

class _PagetwoState extends State<Pagetwo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: (Globals.mode) ? Brightness.dark : Brightness.light,
      ),
      themeMode: ThemeMode.dark,
      home: const Addcontact(),
    );
  }
}

class Addcontact extends StatefulWidget {
  const Addcontact({Key? key}) : super(key: key);

  @override
  State<Addcontact> createState() => _AddcontactState();
}

class _AddcontactState extends State<Addcontact> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            (Globals.mode) ? Brightness.light : Brightness.dark,
        statusBarColor:
            (Globals.mode) ? Globals.darkappbar : Globals.lightappbar,
      ),
    );
  }

  final ImagePicker myimage = ImagePicker();

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  TextEditingController NameController = TextEditingController();
  TextEditingController SurnameController = TextEditingController();
  TextEditingController NumberController = TextEditingController();
  TextEditingController EmailController = TextEditingController();

  late String Name;
  late String Surname;
  late String Number;
  late String Email;
  File? Image;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            (Globals.mode) ? Brightness.light : Brightness.dark,
        statusBarColor:
            (Globals.mode) ? Globals.darkappbar : Globals.lightappbar,
      ),
    );
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            (Globals.mode) ? Globals.darkappbar : Globals.lightappbar,
        centerTitle: true,
        elevation: 1,
        title: Text(
          "Create contacts",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: (Globals.mode) ? Globals.darktext : Globals.lighttext,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            setState(() {
              Navigator.of(context).pop();
            });
          },
          icon: Icon(
            Icons.close,
            size: 30,
            color: (Globals.mode) ? Globals.darktext : Globals.lighttext,
          ),
        ),
        actions: [
          Transform.scale(
            scale: 0.8,
            child: ElevatedButton(
              onPressed: () {
                if (formkey.currentState!.validate()) {
                  formkey.currentState!.save();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        "Contact is Save Successfull... ✔️",
                        style: TextStyle(color: Colors.green),
                      ),
                      backgroundColor:
                          (Globals.mode) ? Globals.darktext : Globals.lighttext,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                  Map data = {
                    'name': Name,
                    'surname': Surname,
                    'number': Number,
                    'email': Email,
                    'image': Image,
                  };
                  setState(() {
                    Globals.Contacts.add(data);
                  });
                  Future.delayed(
                    Duration(seconds: 2),
                        (){
                      Navigator.of(context).pushNamed('/');
                    },
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Failed... ❌",
                          style: TextStyle(color: Colors.red)),
                      backgroundColor:
                          (Globals.mode) ? Globals.darktext : Globals.lighttext,
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                }
              },
              child: Text(
                "Save",
                style: TextStyle(
                  fontSize: 20,
                  color:
                      (Globals.mode) ? Globals.darkbutton : Globals.lightbutton,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  (Globals.mode) ? Globals.darkicon : Globals.lighticon,
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.03,
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        height: size.height,
        width: size.width,
        color: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Center(
                          child: Text("Image pick"),
                        ),
                        backgroundColor:
                            (Globals.mode) ? Globals.darkbg : Globals.lightbg,
                        content: Text("Pick Image in Camera or Gallery"),
                        actions: [
                          ElevatedButton(
                            onPressed: () async {
                              XFile? image = await myimage.pickImage(
                                  source: ImageSource.camera);
                              setState(() {
                                Image = File(image!.path);
                              });
                            },
                            child: Text("Camera"),
                          ),
                          OutlinedButton(
                            onPressed: () async {
                              XFile? image = await myimage.pickImage(
                                  source: ImageSource.gallery);
                              setState(() {
                                Image = File(image!.path);
                              });
                            },
                            child: Text("Gallery"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: (Image != null)
                    ? CircleAvatar(
                        radius: 60,
                        foregroundImage: FileImage(Image!),
                        backgroundColor: (Globals.mode)
                            ? Globals.darkappbar
                            : Globals.lightbutton,
                        child: Icon(
                          Icons.image_outlined,
                          size: 38,
                          color: (Globals.mode)
                              ? Globals.lightbutton
                              : Globals.darkbg,
                        ),
                      )
                    : CircleAvatar(
                        radius: 60,
                        backgroundColor: (Globals.mode)
                            ? Globals.darkappbar
                            : Globals.lightbutton,
                        child: Icon(
                          Icons.image_outlined,
                          size: 38,
                          color: (Globals.mode)
                              ? Globals.lightbutton
                              : Globals.darkbg,
                        ),
                      ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text(
                "Add photo",
                style: TextStyle(
                  color: (Globals.mode) ? Globals.lightbutton : Globals.darkbg,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: size.height * 0.04,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Form(
                  key: formkey,
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          controller: NameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter first name..";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) {
                            Name = NameController.text;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightappbar
                                    : Globals.darkappbar,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightbutton
                                    : Globals.darkbutton,
                              ),
                            ),
                            icon: Icon(
                              Icons.person,
                              size: 32,
                              color: (Globals.mode)
                                  ? Globals.lightappbar
                                  : Globals.darkappbar,
                            ),
                            hintText: "Deniyal",
                            labelText: "First name",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: (Globals.mode)
                                  ? Globals.lightappbar
                                  : Globals.darkappbar,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          controller: SurnameController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Surname..";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) {
                            Surname = SurnameController.text;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightappbar
                                    : Globals.darkappbar,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightappbar
                                    : Globals.darkbutton,
                              ),
                            ),
                            icon: Icon(
                              Icons.power_input_sharp,
                              size: 28,
                            ),
                            hintText: "Drego",
                            labelText: "Surname",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: (Globals.mode)
                                  ? Globals.lightappbar
                                  : Globals.darkappbar,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          controller: NumberController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (val) {
                            if (val!.isEmpty) {
                              return "Enter Number..";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (val) {
                            Number = NumberController.text;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightappbar
                                    : Globals.darkappbar,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightbutton
                                    : Globals.darkbutton,
                              ),
                            ),
                            icon: Icon(
                              Icons.call,
                              size: 32,
                              color: (Globals.mode)
                                  ? Globals.lightappbar
                                  : Globals.darkappbar,
                            ),
                            hintText: "9909938928",
                            labelText: "Phone",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: (Globals.mode)
                                  ? Globals.lightappbar
                                  : Globals.darkappbar,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        TextFormField(
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.emailAddress,
                          controller: EmailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: MultiValidator(
                            [
                              EmailValidator(
                                errorText: "Enter valid email",
                              ),
                              RequiredValidator(errorText: "Enter Email"),
                            ],
                          ),
                          onSaved: (val) {
                            Email = EmailController.text = val!;
                          },
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightappbar
                                    : Globals.darkappbar,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: (Globals.mode)
                                    ? Globals.lightbutton
                                    : Globals.darkbutton,
                              ),
                            ),
                            icon: Icon(
                              Icons.email_outlined,
                              size: 32,
                              color: (Globals.mode)
                                  ? Globals.lightappbar
                                  : Globals.darkappbar,
                            ),
                            hintText: "abc@gmail.com",
                            labelText: "Email",
                            labelStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: (Globals.mode)
                                  ? Globals.lightappbar
                                  : Globals.darkappbar,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
