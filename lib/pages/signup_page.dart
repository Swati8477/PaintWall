import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/services.dart';
import 'package:PaintWall/classes/language_constants.dart';
import 'package:PaintWall/pages/login_page.dart';
import 'package:get/get.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_circle_left,
            size: 20,
            color: Colors.black,),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(translation(context).signup,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold,),),
                const SizedBox(height: 20,),
                 Text(translation(context).createAnAccountFree,
                     style: const TextStyle(fontSize: 15, color:Colors.black,)),
                Container(height: 40,),
                SizedBox(
                  width: 300,
                  child :TextFormField(
                    keyboardType: TextInputType.text,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^[a-z A-Z]+$')),
                      // FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.0),
                        child: Icon(Icons.person),
                      ),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.purple)),
                      // hintText: 'Enter your Username',
                      // labelText: 'User Name',
                      labelText: translation(context).name,
                      hintText: translation(context).nameHint,
                    ),
                  ),
                ),
                Container(height: 15),
                SizedBox(
                  width: 300,
                  child:TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.0),
                        child: Icon(Icons.email_rounded),
                      ),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.purple)),
                      // hintText: 'Enter a Email Id',
                      // labelText: 'Email Id',
                      labelText: translation(context).email,
                      hintText: translation(context).emailHint,
                    ),
                  ),
                ),
                Container(height: 15),
                SizedBox(
                  width: 300,
                  child: TextFormField(
                    obscureText: true,
                    obscuringCharacter:'❤',
                    decoration: InputDecoration(
                      prefixIcon: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 12.0),
                        child: Icon(Icons.lock),
                      ),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(color: Colors.purple)),
                      // hintText: 'Enter the Password',
                      // labelText: 'Password',
                      hintText: translation(context).passwordHint,
                      labelText: translation(context).password,
                    ),
                  ),
                ),
                Container(height: 15,),
                const MyCustomForm()
              ],
            ),
            Container(height: 30,),
            Container(
              //padding: const EdgeInsets.only(top: 3, left: 3),
              child: MaterialButton(
                minWidth: 320.0,
                height: 50,
                onPressed: () {},
                color: Colors.teal,
                elevation: 0,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Text(
                  translation(context).signup,

                  style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: Colors.white,
                ),
                ),
              ),
            ),
            Container(
              height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text(translation(context).alreadyHaveAccountLogin),
                MouseRegion(
                  cursor:SystemMouseCursors.click,
                  child:GestureDetector(
                    child:Text(translation(context).login,
                      style:const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                    onTap:(){ Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder:(BuildContext context)=>LoginPage()),);},

                  ),
                ),
              ],
            )
            )
          ],
        ),
      ),
    );
  }
}

class MyCustomForm extends StatefulWidget {
  const MyCustomForm({Key? key}) : super(key: key);

  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}


class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    String countryValue = " ";
    String stateValue = " ";
    String cityValue = " ";
    String address = " ";

    return Form(
      child: Center(child: Container(
        key: _formKey,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: CSCPicker(
                disabledDropdownDecoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                    border:
                    Border.all(color: Colors.grey)),
                dropdownDecoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                    border:
                    Border.all(color: Colors.grey)

                ),

                dropdownDialogRadius: 10.0,
                searchBarRadius: 10.0,
                layout: Layout.vertical,
                flagState: CountryFlag.DISABLE,
                //placeholders for dropdown search field
                countrySearchPlaceholder: translation(context).country,
                stateSearchPlaceholder: translation(context).state,
                citySearchPlaceholder: translation(context).city,
                //labels for dropdown
                countryDropdownLabel: translation(context).country,
                stateDropdownLabel: translation(context).state,
                cityDropdownLabel: translation(context).city,
                onCountryChanged: (country) {
                  setState(() {
                    ///store value in country variable
                    countryValue = country;
                  });
                },
                onStateChanged: (value) {
                  // setState(() {
                  //   ///store value in state variable
                  //   stateValue = value;
                  // });
                },
                onCityChanged: (city) {
                  // setState(() {
                  //   ///store value in country variable
                  //   cityValue = city!;
                  // });
                },
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}