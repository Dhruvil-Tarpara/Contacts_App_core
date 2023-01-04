import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  divedtopage ()
  {
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context,'/');
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    divedtopage();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height * 0.4,
          width: size.width,
          child: ClipOval(
            child: Image.asset("assets/images/Contacts.gif", fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
