import 'package:flutter/material.dart';
import 'package:gui/resetPass.dart';
import 'package:gui/ryphaHome.dart';
import 'package:gui/singUp.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:gui/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SingIn extends StatefulWidget {
  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 650,
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
                height: 400,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("RYPHA", textAlign: TextAlign.center, style: TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 28.0
                      )),
                      Card(
                        margin: EdgeInsets.only(left: 30, right:30, top:30),
                        elevation: 11,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: TextField(
                          onChanged: (val) {
                            setState(() => email = val); 
                          },
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.mail, color: Colors.black26,),
                              suffixIcon: Icon(Icons.check_circle, color: Colors.black26,),
                              hintText: "E-Mail Adresi",
                              hintStyle: TextStyle(color: Colors.black26),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                              ),
                              contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
                              
                          ),
                        ),
                      ),
                      Card(
                        margin: EdgeInsets.only(left: 30, right:30, top:20),
                        elevation: 11,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40))),
                        child: TextField(
                          onChanged: (val) {
                            setState(() => password = val); 
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.lock, color: Colors.black26,),
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
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(30.0),
                        child: RaisedButton(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          color: Colors.pink,
                          onPressed: () async{
                            if(_formKey.currentState.validate()){
                              dynamic result = await _auth.SingInWithEmailAndPassword(email, password);
                              if(result == null) {
                                setState(() {
                                  error = "UYARI: Girdiğiniz bilgileri kontrol ediniz!";
                                });
                              }
                            }
                          },
                          elevation: 11,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(40.0))),
                          child: Text("Giriş Yap", style: TextStyle(
                              color: Colors.white70
                          )),
                        ),
                        

                      ),
                      SizedBox(height: 12.0,),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      ),
                      FlatButton(child: Text("Şifreni mi unuttun?"), textColor: Colors.white, onPressed: (){
                        Navigator.pushAndRemoveUntil(

                          context,
                          MaterialPageRoute(builder: (context) => ResetPassPage()),
                          ModalRoute.withName('/'),
                        );
                      },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100,),
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
                            child: Text("Misafir Kullanıcı"),
                            textColor: Colors.white,
                            color: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            onPressed: () async{
                              dynamic result =  await _auth.singInAnon();
                              if(result == null) {
                                print("error singed in");
                              } else if(result =! null){
                                Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (context) => ryphaHome()),
                                ModalRoute.withName('/'),
                                );
                                print("singed in");
                                print(result);
                                print(result.uid);
                                
                              } else {

                              }

                            },
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
                        Text("Hesabın yok mu?",),
                        FlatButton(child: Text("Kaydol"), textColor: Colors.indigo, onPressed: (){
                          Navigator.pushAndRemoveUntil(

                            context,
                            MaterialPageRoute(builder: (context) => SingUp()),
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
    );
  }
}

