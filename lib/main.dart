import 'package:faruk_sounds/aboutPage.dart';
import 'package:flutter/rendering.dart';
// ignore: unused_import
import 'package:flutter_launcher_name/flutter_launcher_name.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'seskayit.dart';

void main() {
  runApp(BenimWidgetim());
}

class BenimWidgetim extends StatefulWidget {
  @override
  _BenimWidgetimState createState() => _BenimWidgetimState();
}

class _BenimWidgetimState extends State<BenimWidgetim> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  final oynatici = AudioCache();
  ses getir = new ses();
  // ignore: non_constant_identifier_names
  void Oynat(int i) {
    AudioPlayer.players.clear();
    oynatici.play(i.toString() + '.m4a');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc0b3c2),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xffff6f00),
        title: Text(
          'Furkan Emirce Sesleri',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.info_outline),
              onPressed: () {
                HakkindaPage(context);
              })
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: new SingleChildScrollView(
          child: Column(
            //mainAxisAlignment:
            children: <Widget>[
              buildNesne(0),
              buildNesne(1),
              buildNesne(2),
              buildNesne(3),
              buildNesne(4),
              buildNesne(5),
              buildNesne(6),
              buildNesne(7),
              buildNesne(8),
              buildNesne(9),
              buildNesne(10),
              buildNesne(11),
              buildNesne(12),
              buildNesne(13),
              buildNesne(14),
              buildNesne(15),
              buildNesne(16),
              buildNesne(17),
            ],
          ),
        ),
      ),
    );
  }

  Row buildNesne(int sira) {
    return Row(
      //crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          child: Icon(
            Icons.play_circle_fill,
            size: 40,
            color: Colors.pink,
          ),
          onTap: () {
            Oynat(sira);
          },
        ),
        Text(
          getir.sesler[sira],
          style: GoogleFonts.mcLaren(
            fontSize: 20,
            color: Colors.blue,
            fontWeight: FontWeight.w400,
          ),
        ),
        GestureDetector(
          child: Icon(
            Icons.share_outlined,
            size: 40,
            color: Colors.purple.shade300,
          ),
          onTap: () async {
            String dosyaAdi = sira.toString() + '.m4a';
            final ByteData bytes = await rootBundle.load('assets/' + dosyaAdi);
            await Share.file(getir.sesler[sira], dosyaAdi,
                bytes.buffer.asUint8List(), 'sound/m4a');
          },
        )
      ],
    );
  }

  // ignore: non_constant_identifier_names
  void HakkindaPage(BuildContext context) {
    Navigator.push(
        context, new MaterialPageRoute(builder: (context) => new AboutPage()));
  }
}
