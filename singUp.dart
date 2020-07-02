import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gui/auth.dart';
import 'package:gui/ryphaHome.dart';
import 'package:gui/singIn.dart';
import 'package:gui/verification.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class SingUp extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingUp> {
  static final String path = "lib/src/pages/login/login3.dart";
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String password2 = '';
  String adSoyad = '';
  String error = '';

  validate(){
    
  }
  
  @override
  Widget build(BuildContext context) {
    var val;
        return Form(
        child: Scaffold(
          
          body: Stack(
            children: <Widget>[
              Container(
                height: 800,
                child: RotatedBox(
                  quarterTurns: 2,
                  child: WaveWidget(
                    config: CustomConfig(
                      gradients: [
                        [Color(0xff0e9aa7), Color(0xff3867B4)],
                        [Color(0xff3867B4), Color(0xff0DB9E2)],
                      ],
                      durations: [19440, 10800],
                      heightPercentages: [0.20, 0.25],
                      blur: MaskFilter.blur(BlurStyle.solid, 10),
                      gradientBegin: Alignment.bottomLeft,
                      gradientEnd: Alignment.topRight,
                    ),
                    waveAmplitude: 0,
                    size: Size(
                      double.infinity,
                      double.infinity,
                    ),
                  ),
                ),
              ),
              ListView(
                children: <Widget>[
                  Container(
                    height: 500,
                    child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            "RYPHA",
                            textAlign: TextAlign.center, style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 28.0
                            )
                        ),
                        Text(
                            "Kaydol",
                            textAlign: TextAlign.center, style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0
                        )
                        ),
                        
                        Card(
                          
                          margin: EdgeInsets.only(left: 30, right:30, top:30),
                          elevation: 11,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                          child: TextFormField(
                            onChanged: (val){
                              setState(() {
                                adSoyad = val;
                              });
                            },
                            
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person, color: Colors.black26,),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.black26,),
                                hintText: "Ad Soyad",
                                hintStyle: TextStyle(color: Colors.black26),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                            ),
                            
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(left: 30, right:30, top:20),
                          elevation: 11,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                          child: TextFormField(
                            
                            
                            onChanged: (val){
                              setState(() {
                                email = val;
                              });
                            },
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.mail, color: Colors.black26,),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.black26,),
                                hintText: "E-Mail",
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                            ),
                            
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(left: 30, right:30, top:20),
                          elevation: 11,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                          child: TextFormField(
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock, color: Colors.black26,),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.black26,),
                                hintText: "Şifre",
                                hintStyle: TextStyle(
                                  color: Colors.black26,
                                ),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                ),
                                contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                            ),
                            
                            onChanged: (val){
                              setState(() {
                                password = val;
                              });
                            },
                          ),
                        ),
                        Card(
                          margin: EdgeInsets.only(left: 30, right:30, top:20),
                          elevation: 11,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                          child: TextFormField(
                            
                            onChanged: (val){
                              setState(() {
                                password2 = val;
                              });
                            },
                            obscureText: true,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock, color: Colors.black26,),
                                suffixIcon: Icon(Icons.check_circle, color: Colors.black26,),
                                hintText: "Şifre tekrar",
                            hintStyle: TextStyle(
                              color: Colors.black26,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.all(Radius.circular(40.0)),
                            ),
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0)
                        ),
                      ),
                    ),
                   
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(30.0),
                      child: RaisedButton(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        color: Colors.pink,
                        onPressed: () async {
                          if(_formKey.currentState.validate()){
                            dynamic result = await _auth.RegisterWithEmailAndPassword(email, password, password2, adSoyad);
                            if(result == null){
                              setState(() {
                                error = "Lütfen bilgilerin eksiksiz ve doğru olduğundan emin olun!";
                              });
                            } else {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => ryphaHome()),
                                ModalRoute.withName('/'),
                              );
                            }
                            
                          }
                          
                          
                        },
                        elevation: 11,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                        child: Text("Kayıt Ol", style: TextStyle(
                            color: Colors.white70
                        )),
                      ),
                    ),
                    SizedBox(height: 12.0,),
                    Text(
                      error,
                      style: TextStyle(color: Colors.red, fontSize: 14.0),
                    ),
                  ],
                ),
                ),
              ),
              SizedBox(height: 40,),
              Align(
                alignment: Alignment.bottomCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text("veya"),
                    SizedBox(height: 20.0,),
                    Row(
                      children: <Widget>[
                        SizedBox(width: 20.0,),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Facebook"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(width: 10.0,),
                        Expanded(
                          child: RaisedButton(
                            child: Text("Google"),
                            textColor: Colors.white,
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            onPressed: (){},
                          ),
                        ),
                        SizedBox(width: 20.0,),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Hesabın var mı?",),
                        FlatButton(child: Text("Giriş Yap"), textColor: Colors.indigo, onPressed: (){
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => SingIn()),
                            ModalRoute.withName('/'),
                          );
                        },
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    ),
    );
  }
}
