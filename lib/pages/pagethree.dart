import 'package:contacts/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Pagethree extends StatefulWidget {
  int i;

  Pagethree({Key? key, required this.i}) : super(key: key);

  @override
  State<Pagethree> createState() => _PagethreeState();
}

class _PagethreeState extends State<Pagethree> {
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

  Future<void> makeCall(String number) async {
    Uri call = Uri(scheme: 'tel', path: "+91${number}");
    print(number);
    await launchUrl(call);
  }

  Future<void> sendSMS(String number) async {
    Uri sms = Uri(scheme: 'sms', path: "+91${number}");
    await launchUrl(sms);
  }

  Future<void> sendEmail(String email) async {
    Uri mail = Uri(
      scheme: 'mailto',
      path: "${email}",
      query: "",
    );
    await launchUrl(mail);
  }

  _callNumber(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
  }

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: (Globals.mode) ? Brightness.dark : Brightness.light,
      ),
      themeMode: ThemeMode.dark,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              size: 28,
            ),
            color: (Globals.mode) ? Globals.darkicon : Globals.lighticon,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          actions: [
            IconButton(
              onPressed: () {
                setState(() {
                  Globals.fav = !Globals.fav;
                });
              },
              color: (Globals.fav) ? Colors.orange : Colors.grey,
              tooltip: "Add Favorits",
              icon: Icon(
                Icons.star,
                size: 28,
              ),
            ),
            SizedBox(
              width: size.width * 0.02,
            ),
          ],
          backgroundColor:
              (Globals.mode) ? Globals.darkappbar : Globals.lightappbar,
          centerTitle: true,
          elevation: 0,
        ),
        body: Column(
          children: [
            Container(
              height: size.height * 0.28,
              width: size.width,
              alignment: Alignment.center,
              color: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
              child: (Globals.Contacts[widget.i]['image'] != null)
                  ? Image(
                      image: FileImage(Globals.Contacts[widget.i]['image']),
                      fit: BoxFit.cover,
                    )
                  : CircleAvatar(
                      radius: 46,
                      child: Text(
                        "${Globals.Contacts[widget.i]['name'][0]}",
                        style: GoogleFonts.poppins(
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
            ),
            Container(
              height: size.height * 0.08,
              width: size.width,
              alignment: Alignment.center,
              color: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
              child: Text(
                "${Globals.Contacts[widget.i]['name']} ${Globals.Contacts[widget.i]['surname']}",
                style: GoogleFonts.poppins(
                  fontSize: 32,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w500,
                  color: (Globals.mode) ? Globals.darktext : Globals.lighttext,
                ),
              ),
            ),
            Divider(
              height: 3,
              color: (Globals.mode) ? Globals.lightappbar : Globals.darkappbar,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              height: size.height * 0.14,
              width: size.width,
              color: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            makeCall(Globals.Contacts[widget.i]['number']);
                          });
                        },
                        icon: Icon(
                          Icons.call,
                          size: 32,
                        ),
                        color: (Globals.mode)
                            ? Globals.darkicon
                            : Globals.lighticon,
                      ),
                      Text(
                        "Call",
                        style: TextStyle(
                          color: (Globals.mode)
                              ? Globals.darkicon
                              : Globals.lighticon,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            sendSMS(Globals.Contacts[widget.i]['number']);
                          });
                        },
                        icon: Icon(
                          Icons.message_outlined,
                          size: 32,
                        ),
                        color: (Globals.mode)
                            ? Globals.darkicon
                            : Globals.lighticon,
                      ),
                      Text(
                        "Text",
                        style: TextStyle(
                          color: (Globals.mode)
                              ? Globals.darkicon
                              : Globals.lighticon,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Share.share(
                              "Name: ${Globals.Contacts[widget.i]['name']} ${Globals.Contacts[widget.i]['surname']}\n Modile No: ${Globals.Contacts[widget.i]['number']} ");
                        },
                        icon: Icon(
                          Icons.share_outlined,
                          size: 32,
                        ),
                        color: (Globals.mode)
                            ? Globals.darkicon
                            : Globals.lighticon,
                      ),
                      Text(
                        "Share",
                        style: TextStyle(
                          color: (Globals.mode)
                              ? Globals.darkicon
                              : Globals.lighticon,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            sendEmail(Globals.Contacts[widget.i]['email']);
                          });
                        },
                        icon: Icon(
                          Icons.mail_outline_rounded,
                          size: 32,
                        ),
                        color: (Globals.mode)
                            ? Globals.darkicon
                            : Globals.lighticon,
                      ),
                      Text(
                        "Email",
                        style: TextStyle(
                          color: (Globals.mode)
                              ? Globals.darkicon
                              : Globals.lighticon,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 3,
              color: (Globals.mode) ? Globals.lightappbar : Globals.darkappbar,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              margin: EdgeInsets.all(10),
              color: (Globals.mode) ? Globals.darkappbar : Globals.lightappbar,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    Text(
                      "Contact info",
                      style: GoogleFonts.poppins(
                        fontSize: 22,
                        letterSpacing: 1,
                        color: (Globals.mode)
                            ? Globals.darktext
                            : Globals.lighttext,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.call,
                          size: 32,
                          color: (Globals.mode)
                              ? Globals.darktext
                              : Globals.lighttext,
                        ),
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        Text.rich(
                          TextSpan(children: [
                            TextSpan(
                              text:
                                  "+91 ${Globals.Contacts[widget.i]['number']}",
                              style: GoogleFonts.poppins(
                                fontSize: 18,
                                color: (Globals.mode)
                                    ? Globals.darktext
                                    : Globals.lighttext,
                              ),
                            ),
                            TextSpan(
                              text: "\n Mobail - Default",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: (Globals.mode)
                                    ? Globals.darktext
                                    : Globals.lighttext,
                              ),
                            ),
                          ]),
                        ),
                        Spacer(),
                        Icon(
                          Icons.message_outlined,
                          size: 32,
                          color: (Globals.mode)
                              ? Globals.darktext
                              : Globals.lighttext,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.03,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.email_outlined,
                          size: 32,
                          color: (Globals.mode)
                              ? Globals.darktext
                              : Globals.lighttext,
                        ),
                        SizedBox(
                          width: size.width * 0.06,
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "${Globals.Contacts[widget.i]['email']}",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  color: (Globals.mode)
                                      ? Globals.darktext
                                      : Globals.lighttext,
                                ),
                              ),
                              TextSpan(
                                text: "\n Gmail - Default",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  color: (Globals.mode)
                                      ? Globals.darktext
                                      : Globals.lighttext,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
      ),
    );
  }
}
