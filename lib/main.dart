import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new LoginPage(),
      theme: new ThemeData(primarySwatch: Colors.blue),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State createState() => new LoginPageState();
}

class LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(milliseconds: 500));

    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController,
        //curve: Curves.bounceOut
        curve: Curves.easeOut);
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.greenAccent,
      body: new Stack(
        fit: StackFit.expand, //to fill image to whole area
        children: <Widget>[
          new Image(
            image: new AssetImage("assets/amol.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center, //set view alignment
            children: <Widget>[
              new FlutterLogo(
                //set default flutter logo
                //size: 100.0,
                size: _iconAnimation.value * 100,
              ),
              new Form(
                  child: new Theme(
                      data: new ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: new InputDecorationTheme(
                              labelStyle: new TextStyle(
                                  color: Colors.teal, fontSize: 20.0))),
                      child: new Container(
                          padding: const EdgeInsets.all(80.0), //set margin
                          child: new Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              new TextFormField(
                                decoration:
                                    //new InputDecoration(labelText: "Enter Email"),//without floating lable
                                    new InputDecoration(
                                        labelText: "Enter Email"),
                                //with floating lable
                                keyboardType: TextInputType.emailAddress,
                              ),
                              new TextFormField(
                                decoration:
                                    // new InputDecoration(labelText: "Enter Password"),//without floating lable
                                    new InputDecoration(
                                        labelText: "Enter Password"),
                                //with floating lable
                                keyboardType: TextInputType.text,
                                obscureText: true,
                              ),
                              new Padding(
                                  padding: const EdgeInsets.only(top: 20.0)),
                              new MaterialButton(
                                height: 40.0,
                                minWidth: 200.0,
                                color: Colors.teal,
                                textColor: Colors.white,
                                child: new Text("Login"),
                                onPressed: ()=>{},
                                splashColor: Colors.redAccent,
                              )
                            ],
                          ))))
            ],
          )
        ],
      ),
    );
  }
}
