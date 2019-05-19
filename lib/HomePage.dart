import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/widgets.dart';
import 'NumberAudio.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioCache audioPlayer = AudioCache();

  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.amber, "One"),
    NumberAudio("two.wav", Colors.blue, "Two"),
    NumberAudio("three.wav", Colors.green, "Three"),
    NumberAudio("four.wav", Colors.lightBlue, "Four"),
    NumberAudio("five.wav", Colors.lime, "Five"),
    NumberAudio("six.wav", Colors.pink, "Six"),
    NumberAudio("seven.wav", Colors.yellow, "Seven"),
    NumberAudio("eight.wav", Colors.orange, "Eight"),
    NumberAudio("nine.wav", Colors.purple, "Nine"),
    NumberAudio("ten.wav", Colors.red, "Ten"),
  ];

  play(String uri){
    audioPlayer.play(uri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF0F1),
      appBar: AppBar(
        title: Text("Spanish Audio Player",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color(0xFF333945),
      ),
      body: Container(
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/logo.png"),
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(20.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.5,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: numberList.length,
                  itemBuilder: (context,i) => SizedBox(
                    width: 100.0,
                    height: 50.0,
                    child: RaisedButton(
                      padding: EdgeInsets.all(20.0),
                      color: numberList[i].buttonColor,
                      child: Text(numberList[i].buttonText, style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      )),
                      onPressed: (){
                        this.play(numberList[i].audioUri);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(152.0, 7.0, 152.2, 7.0),
                color: Colors.black54,
                child: Text("LearnCodeOnline.in", style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}