import 'package:flutter/material.dart';
import 'package:PaintWall/classes/language_constants.dart';
import 'package:PaintWall/pages/GetXHelper.dart';
import 'package:get/get.dart';
import 'signup_page.dart';


class LoginPage extends StatelessWidget {
  //TextEditingController email = TextEditingController();
  //TextEditingController pass = TextEditingController();
  // Creating a Object by using GetXHelper Class and injection it in main.dart class so that  you can use getXHelper to call and pass use entered data
  final GetXHelper getXHelper = Get.put(GetXHelper());

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
        child:Container(
          height: MediaQuery.of(context).size.height/2,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text(translation(context).login,
                        style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 20,),
                      Text(translation(context).loginToYourAccount,
                        style: TextStyle(
                            fontSize: 15,
                            color:Colors.grey[700]),)
                    ],
                  ),
                  Container(height: 50),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                          child: TextFormField(
                            // onChanged: (text)
                            // {// When user enter text in textfield getXHelper checktext method will get called
                            //   getXHelper.checktext(text);
                            // },
                            decoration: InputDecoration(
                              prefixIcon: const Padding(
                                padding: EdgeInsetsDirectional.only(start: 12.0),
                                child: Icon(Icons.person),
                              ),
                              border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                  borderSide: const BorderSide(color: Colors.purple)),
                              // hintText: 'Enter your Username',
                              // labelText: 'User Name',
                              hintText: translation(context).usernameHint,
                              labelText: translation(context).username,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        GetBuilder<GetXHelper>(builder: (_){
                          return _.which == 1 ? Container() :  Padding(
                            padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsetsDirectional.only(start: 12.0),
                                  child: Icon(Icons.lock),
                                ),
                                border:OutlineInputBorder(borderRadius: BorderRadius.circular(20),
                                    borderSide: const BorderSide(color: Colors.purple)),
                                // hintText: 'Enter Password',
                                // labelText: 'Password',
                                hintText: translation(context).passwordHint,
                                labelText: translation(context).password,
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  Container(height: 20,),
                  Padding(padding:
                  const EdgeInsets.symmetric(horizontal: 40),
                    child: MaterialButton(
                      minWidth: 600.0,
                      height: 60,
                      onPressed: () {},
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        translation(context).login,
                        style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(translation(context).doNtHaveAnAccount),
                      MouseRegion(
                        cursor:SystemMouseCursors.click,
                        child:GestureDetector(
                          child:Text(translation(context).signup,
                            style:const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),),
                          onTap:(){ Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder:(BuildContext context)=>const SignupPage()),);},
                        ),
                      ),
                    ],
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

}

