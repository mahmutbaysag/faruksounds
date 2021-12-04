import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:link/link.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends StatefulWidget {
  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  _launchURL() async {
    const url = 'mailto:baysagmahmut@gmail.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  _launchURRL() async {
    const url = 'https://www.youtube.com/user/furkanemirce';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url adresine bağlanılamadı';
    }
  }

  _launchURRRL() async {
    const url = 'https://www.instagram.com/furkanemirce/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '$url adresine bağlanılamadı';
    }
  }

  void secici(int i) {
    if (i == 1) {
      _launchURL();
    } else if (i == 2) {
      _launchURRL();
    } else if (i == 3) {
      _launchURRRL();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Color(0xffff6f00),
        title: Text(
          'Hakkında',
          style: TextStyle(fontSize: 40),
        ),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(0, 30, 0, 10),
          width: 500,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadiusDirectional.circular(5.0)),
          child: Column(
            children: [
              buildContainer(Txt: 'Furkan Emirce', LinkText: 'Youtube', s: 2),
              buildContainer(Txt: 'Furkan Emirce', LinkText: 'İnstagram', s: 3),
              buildContainer(
                  Txt: 'Geliştirici Adresi',
                  LinkText: 'baysagmahmut@gmail.com',
                  s: 1),
            ],
          ),
        ),
      ),
    );
  }

  Container buildContainer(
      // ignore: non_constant_identifier_names
      {@required String Txt, @required String LinkText, @required int s}) {
    return Container(
      width: 250,
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(5.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadiusDirectional.circular(5.0)),
      child: Column(
        children: [
          Text(
            Txt,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          CupertinoButton(
              child: Text(LinkText),
              onPressed: () {
                secici(s);
              })
        ],
      ),
    );
  }
}
