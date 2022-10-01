import 'package:flutter/material.dart';
import 'package:Telematers_Quiz/widget/option.dart';

class NormalQuestion extends StatefulWidget {
  const NormalQuestion({Key? key}) : super(key: key);

  @override
  State<NormalQuestion> createState() => _NormalQuestionState();
}

class _NormalQuestionState extends State<NormalQuestion> {
  //validation variable
  final List <bool> _isInvalid = [false,false,false,false,false];

  //array of value for the checkbox
  //*
  //only one box can be checked as true answer
  //*
  final List <bool> _isChecked = [false,false,false,false];

  //question & answer controller for save the text value
  late TextEditingController _questionController;
  late TextEditingController _optionAController;
  late TextEditingController _optionBController;
  late TextEditingController _optionCController;
  late TextEditingController _optionDController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _questionController = TextEditingController();
    _optionAController = TextEditingController();
    _optionBController = TextEditingController();
    _optionCController = TextEditingController();
    _optionDController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _questionController.dispose();
    _optionAController.dispose();
    _optionBController.dispose();
    _optionCController.dispose();
    _optionDController.dispose();
  }

  //function to update the checkbox
  void _updateCorrectAnswer(int index){
    for(int i=0;i<_isChecked.length;i++){
      setState(() {
        i==index ? _isChecked[i]=!_isChecked[i] :_isChecked[i]=false;
      });
    }
  }

  //isInvalid cannot have any true value at all
  //must be return false
  bool _validationField(){
    //flag variable to simplify setState
    //(to assign all variable in single setState)
    List <bool> isInvalid = [false,false,false,false,false];

    //question field
    _questionController.text.isEmpty ? isInvalid[0] = true : null;
    //option A field
    _optionAController.text.isEmpty ? isInvalid[1] = true : null;
    //option B field
    _optionBController.text.isEmpty ? isInvalid[2] = true : null;
    //option C field
    _optionCController.text.isEmpty ? isInvalid[3] = true : null;
    //option D field
    _optionDController.text.isEmpty ? isInvalid[4] = true : null;

    setState(() {
      for(int i=0;i<isInvalid.length;i++){
        _isInvalid[i] = isInvalid[i];
      }
    });

    //*
    //if isInvalid contain true, then there is empty fields.
    //return :
    //true = invalid (cannot go to next process)
    //false = valid (can go to next process)
    //*
    return isInvalid.contains(true);
  }

  //_isChecked must be have a true value
  //must be return true
  bool _validationCheckbox(){
    //*
    //if _isChecked did not contain true value, then there is no an option
    //assigned as a correct value
    //return :
    //true = valid (can go to next process)
    //false = invalid (cannot go to nect process)
    //*
    return _isChecked.contains(true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Add Your Question Here:",
          style: TextStyle(fontSize: 30), textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 30,
        ),

        Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: TextField(
            controller: _questionController,
            decoration: InputDecoration(
                labelText: "Question",
                errorText: _isInvalid[0] ? "Please input the question!" : null,
                border: const OutlineInputBorder(),
            ),
            maxLines: null,
          ),
        ),
        const SizedBox(height: 15,),
        //option custom widget
        Option(
          optionController: _optionAController,
          value: _isChecked[0],
          onTap: (){
            _updateCorrectAnswer(0);
          },
          title: 'Option A',
          errorValue: _isInvalid[1],
        ),
        const SizedBox(height: 10,),
        Option(
          optionController: _optionBController,
          value: _isChecked[1],
          onTap: (){
            _updateCorrectAnswer(1);
          },
          title: 'Option B',
          errorValue: _isInvalid[2],
        ),
        const SizedBox(height: 10,),
        Option(
          optionController: _optionCController,
          value: _isChecked[2],
          onTap: (){
            _updateCorrectAnswer(2);
          },
          title: 'Option C',
          errorValue: _isInvalid[3],
        ),
        const SizedBox(height: 10,),
        Option(
          optionController: _optionDController,
          value: _isChecked[3],
          onTap: (){
            _updateCorrectAnswer(3);
          },
          title: 'Option D',
          errorValue: _isInvalid[4],
        ),
        const SizedBox(height: 15),
        const Padding(
          padding: EdgeInsets.only(right: 100),
          child: Text(
              "*notes : please check one of the boxes as correct answer",
            style: TextStyle(fontSize: 10,color: Colors.grey),
          ),
        ),
        const SizedBox(height: 70),
        ElevatedButton(
            onPressed: () {
              if(_validationField()==false&&_validationCheckbox()==true){
                print("go to next process");
              }
            },
            child: const Text("ADD QUESTION")
        ),
      ],
    );
  }
}
