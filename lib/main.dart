import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(     
        primarySwatch: Colors.blue,       
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(title: 'Flutter Demo Home Page'),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Home> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  void validateInput(){
    FormState form = this.formKey.currentState;
    ScaffoldState scaffold = this.scaffoldKey.currentState;
    
    SnackBar message = SnackBar(
      content: Text('Login sukses...'),    
    );

    if(form.validate()){
      scaffold.showSnackBar(message);
    }
  }

  


  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
     
        title: Text('Login'),
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(hintText: 'Email'),
            keyboardType: TextInputType.emailAddress,
            validator: (String value){
              if(value.isEmpty){
                return 'Email tidak boleh kosong';
              }
            },
          ),
          TextFormField(
            decoration: InputDecoration(hintText: 'Password'),
            keyboardType: TextInputType.visiblePassword,
            validator: (String value){
              if(value.isEmpty){
                return 'Password tidak boleh kosong';
              }
            },
          ),
          Container(height: 10.0,),
          RaisedButton(child: Text('Login'), onPressed: validateInput,),
          Text('atau'),
          RaisedButton(child: Text('Daftar'),onPressed: (){
            return AlertDialog(
              content: Text('Berhasil'),
            );
          },),
          
          ],
         ),
        ),        
      ),
      
    );
  }
}
