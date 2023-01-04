import 'package:contacts/global.dart';
import 'package:contacts/pages/pagethree.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:google_fonts/google_fonts.dart';

class Pageone extends StatefulWidget {
  const Pageone({Key? key}) : super(key: key);

  @override
  State<Pageone> createState() => _PageoneState();
}

class _PageoneState extends State<Pageone> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            (Globals.mode) ? Brightness.light : Brightness.dark,
        statusBarColor: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness:
            (Globals.mode) ? Brightness.light : Brightness.dark,
        statusBarColor: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: size.height * 0.23,
              child: Column(
                children: [
                  Container(
                    color: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
                    child: Column(
                      children: [
                        SizedBox(
                          height: size.height * 0.07,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          height: size.height * 0.07,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: (Globals.mode)
                                ? Globals.darkappbar
                                : Globals.lightappbar,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: size.width * 0.04,
                              ),
                              Icon(
                                Icons.menu_outlined,
                                color: (Globals.mode)
                                    ? Globals.darktext
                                    : Globals.lighttext,
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    Globals.mode = !Globals.mode;
                                  });
                                },
                                child: Icon(
                                  (Globals.mode)
                                      ? Icons.sunny
                                      : Icons.mode_night_outlined,
                                  size: 24,
                                  color: (Globals.mode)
                                      ? Globals.darkbutton
                                      : Globals.lightbutton,
                                ),
                                style: ButtonStyle(
                                    shape: MaterialStateProperty.all(
                                      CircleBorder(
                                          side: BorderSide(
                                        color: (Globals.mode)
                                            ? Globals.darktext
                                            : Globals.lighttext,
                                        width: 10,
                                      )),
                                    ),
                                    backgroundColor: MaterialStateProperty.all(
                                      (Globals.mode)
                                          ? Globals.darktext
                                          : Globals.lighttext,
                                    )),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      width: 1,
                                      color: (Globals.mode)
                                          ? Globals.darktext
                                          : Globals.lighttext,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: (Globals.mode)
                                            ? Globals.darkicon
                                            : Globals.lighticon,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        "Phone contacts",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: (Globals.mode)
                                              ? Globals.darktext
                                              : Globals.lighttext,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                              OutlinedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                    BorderSide(
                                      width: 1,
                                      color: (Globals.mode)
                                          ? Globals.darktext
                                          : Globals.lighttext,
                                    ),
                                  ),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
                                ),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.mail_outline_rounded,
                                        color: (Globals.mode)
                                            ? Globals.darkicon
                                            : Globals.lighticon,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.02,
                                      ),
                                      Text(
                                        "Email contacts",
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: (Globals.mode)
                                              ? Globals.darktext
                                              : Globals.lighttext,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.03,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Container(
                    height: 1,
                    width: size.width,
                    color:
                        (Globals.mode) ? Globals.darktext : Globals.lighttext,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.77,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: (Globals.Contacts.isEmpty)
                    ? Column(
                        children: [
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Image(
                            image: AssetImage(
                              "assets/images/dropbox-logo.png",
                            ),
                            height: size.height * 0.1,
                            width: size.width * 0.2,
                            color: (Globals.mode)
                                ? Globals.darktext
                                : Globals.lighttext,
                          ),
                          SizedBox(
                            height: size.height * 0.04,
                          ),
                          Text(
                            "Add Contacts and Make a Call",
                            style: TextStyle(
                              fontSize: 24,
                              color: (Globals.mode)
                                  ? Globals.darktext
                                  : Globals.lighttext,
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: Globals.Contacts.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: ListTile(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => Pagethree(i: index),
                                  ),
                                );
                              },
                              leading: CircleAvatar(
                                radius: 24,
                                backgroundImage: (Globals.Contacts[index]
                                            ['image'] !=
                                        null)
                                    ? FileImage(Globals.Contacts[index]['image'])
                                    : null,
                                child: (Globals.Contacts[index]['image'] != null)
                                    ? Center()
                                    : Center(
                                        child: Text(
                                          "${Globals.Contacts[index]['name'][0]}".toUpperCase(),
                                          style: GoogleFonts.poppins(
                                            fontSize: 28,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                              ),
                              title: Text(
                                "${Globals.Contacts[index]['name']} ${Globals.Contacts[index]['surname']}",
                                style: GoogleFonts.poppins(
                                  fontSize: 18,
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w500,
                                  color: (Globals.mode)
                                      ? Globals.darktext
                                      : Globals.lighttext,
                                ),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 2, horizontal: 4),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(34),
                                side: BorderSide(
                                  color: (Globals.mode)
                                      ? Globals.lightappbar
                                      : Globals.darkappbar,
                                ),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.phone,
                                  color: Colors.green,
                                  size: 26,
                                ),
                                onPressed: () {},
                              ),
                            ),
                          );
                        }),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor:
              (Globals.mode) ? Globals.darkbutton : Globals.lightbutton,
          onPressed: () {
            Navigator.of(context).pushNamed('page2');
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          tooltip: "Add contacts",
          child: Icon(
            Icons.add,
            size: 34,
            color: (Globals.mode) ? Globals.darkicon : Globals.lighticon,
          ),
        ),
        backgroundColor: (Globals.mode) ? Globals.darkbg : Globals.lightbg,
      ),
    );
  }
}
