import 'package:flutter/material.dart';

const imageUrl =
    'https://miro.medium.com/max/3456/1*2PLA0dAsirMGUbP1-wh9zw.jpeg';

class ShowImageView extends StatefulWidget {
  @override
  _ShowImageViewState createState() => _ShowImageViewState();
}

class _ShowImageViewState extends State<ShowImageView> {
  Widget display = CircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              setImage();
            },
            child: Text('Click me!'),
          ),
          SizedBox(height: 100),
          Center(
            child: display,
          ),
        ],
      ),
    );
  }

  setImage() {
    setState(() {
      display = Image.network(imageUrl);
    });
  }
}
