import 'package:flutter/material.dart';

enum RecordsType {Wish, Complaint}


class AddRecordsPage extends StatefulWidget {
  @override
  _AddRecordsPageState createState() => _AddRecordsPageState();
}

class _AddRecordsPageState extends State<AddRecordsPage> {
  List<String> allDomainName = ["elektrik", "parkVeBahceler", "ulasim", "temizlik", "altyapi"];
  int _activeStep = 0;
  RecordsType recordsType = RecordsType.Wish;
  String domainName, title, body;
  List<Step> allSteps;
  String message;
  bool error = false;
  var key0 = GlobalKey<FormFieldState>();
  var key1 = GlobalKey<FormFieldState>();
  var key2 = GlobalKey<FormFieldState>();
  var key3 = GlobalKey<FormFieldState>();
  List<GlobalKey<FormFieldState>> keys;

  @override
  void initState() {
    super.initState();
    keys = [key0, key1, key2, key3];
  }

  @override
  Widget build(BuildContext context) {
    allSteps = _allSteps();

    return Scaffold(
      appBar: AppBar(
        title: Text("Dilek/Şikayet Ekle"),
      ),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Stepper(
        steps: allSteps,
        currentStep: _activeStep,
        /*onStepTapped: (tappedStep){
          setState(() {
            _activeStep = tappedStep;
          });
        },*/
        onStepContinue: () {
          setState(() {
            buttonControl(_activeStep);
          });
        },
        onStepCancel: () {
          if (_activeStep > 0) {
            setState(() {
              error = false;
              _activeStep--;
            });
          }
        },
      ),
    );
  }

  List<Step> _allSteps() {
    List<Step> steps = [
      Step(
        title: Text("Kayıt Türü"),
        subtitle: Text("Lütfen kayıt türünü giriniz."),
        state: adjustState(0),
        isActive: true,
        content: Row(
          children: [
            RadioListTile<RecordsType>(
              secondary: Icon(Icons.wb_incandescent_sharp),
              title: const Text("Dilek"),
              value: RecordsType.Wish,
              groupValue: recordsType,
              onChanged: (recordsType){
                setState(() {
                  this.recordsType = recordsType;
                });
              },
            ),
            RadioListTile<RecordsType>(
              secondary: Icon(Icons.wrong_location),
              title: const Text("Şikayet"),
              value: RecordsType.Complaint,
              groupValue: recordsType,
              onChanged: (recordsType){
                setState(() {
                  this.recordsType = recordsType;
                });
              },
            ),
          ],
        )
      ),
      Step(
        title: Text("Alan Adı"),
        subtitle: Text("Lütfen alan adını giriniz"),
        state: adjustState(1),
        isActive: true,
        content: DropdownButtonHideUnderline(
          child: DropdownButton(
            items: allDomainName.map((domainName){
              return DropdownMenuItem<String>(
                value: domainName,
                child: Text(domainName.toUpperCase(),style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold,fontSize: 16),),
              );
            }).toList(),
            value: domainName,
            onChanged: (changedDomain){
              setState(() {
                domainName = changedDomain;
              });
            },
          ),
        ),
      ),
      Step(
        title: Text("Başlık"),
        subtitle: Text("Lütfen başlık giriniz"),
        state: adjustState(2),
        isActive: true,
        content: TextFormField(
          key: key2,
          validator: (enteredValue) {
            if (enteredValue.length < 6)
              return "En az 6 karakter giriniz.";
            else
              return null;
          },
          onSaved: (enteredValue) {
            title = enteredValue;
          },
          decoration: InputDecoration(
            labelText: "Başlık",
            hintText: "Başlık giriniz",
            border: OutlineInputBorder(),
          ),
        ),
      ),
      Step(
        title: Text("İçerik"),
        subtitle: Text("Lütfen içeriğinizi giriniz"),
        state: adjustState(3),
        isActive: true,
        content: TextFormField(
          key: key2,
          validator: (enteredValue) {
            if (enteredValue.length < 6)
              return "En az 6 karakter giriniz.";
            else
              return null;
          },
          onSaved: (enteredValue) {
            body = enteredValue;
          },
          decoration: InputDecoration(
            labelText: "İçerik",
            hintText: "İçerik girin",
            border: OutlineInputBorder(),
          ),
        ),
      ),
    ];
    return steps;
  }

  StepState adjustState(int currentStep) {
    if (_activeStep == currentStep) {
      if (error)
        return StepState.error;
      else
        return StepState.editing;
    } else if (_activeStep > currentStep)
      return StepState.complete;
    else
      return StepState.indexed;
  }

  void buttonControl(int activeStep) {
    if (keys[activeStep].currentState.validate() && activeStep != 0 && activeStep != 1) {
      keys[activeStep].currentState.save();
      error = false;
      if (activeStep < allSteps.length - 1) _activeStep++;
    } else {
      error = true;
    }
  }
}
