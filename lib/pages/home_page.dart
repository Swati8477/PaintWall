import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:PaintWall/classes/language.dart';
import 'package:PaintWall/classes/language_constants.dart';
import 'package:PaintWall/main.dart';
import 'package:PaintWall/pages/product_page.dart';
import 'package:PaintWall/router/route_constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  void _showSuccessDialog() {
    // showTimePicker(context: context, initialTime: TimeOfDay.now());
    print('Welcome');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(translation(context).user),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<Language>(
              underline: const SizedBox(),
              icon: const Icon(
                Icons.language,
                color: Colors.white,
              ),
              onChanged: (Language? language) async {
                if (language != null) {
                  Locale _locale = await setLocale(language.languageCode);
                  MyApp.setLocale(context, _locale);
                }
              },
              items: Language.languageList()
                  .map<DropdownMenuItem<Language>>(
                    (e) => DropdownMenuItem<Language>(
                      value: e,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text(
                            e.flag,
                            style: const TextStyle(fontSize: 30),
                          ),
                          Text(e.name)
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      drawer: Drawer(
        child: _drawerList(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: _mainForm(context),
      ),
    );
  }

  Form _mainForm(BuildContext context) {
    String countryValue = " ";
    // String stateValue = " ";
    // String cityValue = " ";
    // String address = " ";
    return Form(
      key: _key,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: Center(
              child: Text(
                translation(context).personalInformation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).name,
              hintText: translation(context).nameHint,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).phone,
              hintText: translation(context).phoneHint,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          TextFormField(
            validator: (val) {
              if (val != null && val.isEmpty) {
                return translation(context).requiredField;
              }
              return null;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: translation(context).coupon,
              // hintText: translation(context).nameHint,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            child: CSCPicker(
              showStates: true,
              showCities: true,
              disabledDropdownDecoration: BoxDecoration(
                  // borderRadius: const BorderRadius.all(Radius.circular(20)),
                  border: Border.all(color: Colors.grey)),
              dropdownDecoration: BoxDecoration(
                  // borderRadius: const BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  border: Border.all(color: Colors.grey)
              ),
              ///Dialog box radius [OPTIONAL PARAMETER]
              dropdownDialogRadius: 10.0,
              ///Search bar radius [OPTIONAL PARAMETER]
              searchBarRadius: 10.0,
              layout: Layout.vertical,
              flagState: CountryFlag.ENABLE,
              //placeholders for dropdown search field
              countrySearchPlaceholder: translation(context).country,
              stateSearchPlaceholder: translation(context).state,
              citySearchPlaceholder: translation(context).city,
              //labels for dropdown
              countryDropdownLabel: translation(context).country,
              stateDropdownLabel: translation(context).state,
              cityDropdownLabel: translation(context).city
              ,
              onCountryChanged: (value) {
                setState(() {
                  ///store value in country variable
                  countryValue = value;
                });
              },
              onStateChanged: (value) {
                // setState(() {
                //   ///store value in state variable
                //   stateValue = value!;
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
          const SizedBox(
            height: 10,
          ),
          MaterialButton(
            onPressed: () {
              if (_key.currentState != null && _key.currentState!.validate()) {
                _showSuccessDialog();
              }
            },
            height: 50,
            shape: const StadiumBorder(),
            color: Theme.of(context).primaryColor,
            child: Center(
              child: Text(
                translation(context).submitInfo,
                style: const TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _drawerList() {
    TextStyle _textStyle = const TextStyle(
      color: Colors.white,
      fontSize: 24,
    );
    return Container(
      color: Theme.of(context).primaryColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Container(
              height: 100,
              child: const CircleAvatar(
                backgroundImage: AssetImage('lib/icon/logo.webp'),
                  radius: 30
              ),
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.info,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).aboutUs,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, aboutRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).settings,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, settingsRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_bag_rounded,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).shopkeeper,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, shopkeeperRoute);
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.shopping_cart_rounded,
              color: Colors.white,
              size: 30,
            ),
            title: Text(
              translation(context).products,
              style: _textStyle,
            ),
            onTap: () {
              // To close the Drawer
              Navigator.pop(context);
              // Navigating to About Page
              Navigator.pushNamed(context, productsRoute);
            },
          ),
        ],
      ),
    );
  }
}
