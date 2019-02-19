import 'package:flutter/material.dart';

class AddDataPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AddDataPageState();
  }
}

class AddDataPageState extends State<AddDataPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameCtrl = TextEditingController();
  final TextEditingController _lastNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Add Data'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _firstNameCtrl,
                decoration: InputDecoration(labelText: 'First Name'),
                autofocus: true,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please input first name!';
                  }
                },
              ),
              TextFormField(
                controller: _lastNameCtrl,
                decoration: InputDecoration(labelText: 'Last Name'),
              ),
              OutlineButton(
                child: Text('Save'),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    // save data to database or restfull service
                    print('First name = ${_firstNameCtrl.text}');
                    print('Last name = ${_lastNameCtrl.text}');

                    Navigator.pop(context);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
