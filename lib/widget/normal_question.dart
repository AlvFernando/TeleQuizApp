import 'package:Telematers_Quiz/model/add_question_response.dart';
import 'package:Telematers_Quiz/util/shared_preferences_controller.dart';
import 'package:flutter/material.dart';
import 'package:Telematers_Quiz/widget/option.dart';
import 'package:get/get.dart';
import 'package:Telematers_Quiz/api/api_service.dart';
import '../ui/main_page.dart';
import '../util/add_quiz_validation_controller.dart';

class NormalQuestion extends StatefulWidget {
  const NormalQuestion({Key? key}) : super(key: key);

  @override
  State<NormalQuestion> createState() => _NormalQuestionState();
}

class _NormalQuestionState extends State<NormalQuestion> {
  //validation variable
  final List <bool> _isInvalid = [false,false,false,false,false];

  //variable to store errorMessage
  // String questionMessage='';
  // String optionAMessage='';
  // String optionBMessage='';
  // String optionCMessage='';
  // String optionDMessage='';

  //array of value for the checkbox
  //*
  //only one box can be checked as true answer
  //*
  final List <bool> _isChecked = [false,false,false,false];
  //flag for change check box color, if the user not check any
  bool _isUncheckedAll = false;

  //question & answer controller for save the text value
  late TextEditingController _questionController;
  late TextEditingController _optionAController;
  late TextEditingController _optionBController;
  late TextEditingController _optionCController;
  late TextEditingController _optionDController;

  //controller to store validation message
  AddQuizValidationController validationController = Get.find();

  //controller to get username data
  SharedPreferencesController spController = Get.find();
  late final String username;

  Future<AddQuestionResponse>? _futureQuestionResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _questionController = TextEditingController();
    _optionAController = TextEditingController();
    _optionBController = TextEditingController();
    _optionCController = TextEditingController();
    _optionDController = TextEditingController();

    username = spController.username!;
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
    _questionController.text.isEmpty
        ? {
            isInvalid[0] = true,
            validationController.question.add("Please input the question")
        }
        : isInvalid[0] = false;

    //option A field
    _optionAController.text.isEmpty
        ? {
            isInvalid[1] = true,
            validationController.optionA.add("Please input the option")
          }
        : {
            isInvalid[1] = false,
            validationController.optionA.remove("Please input the option")
          };


    //option B field
    _optionBController.text.isEmpty
        ? {
            isInvalid[2] = true,
            validationController.optionB.add("Please input the option")
          }
        : {
            isInvalid[2] = false,
            validationController.optionB.remove("Please input the option")
          };
    //option C field
    _optionCController.text.isEmpty
        ? {
            isInvalid[3] = true,
            validationController.optionC.add("Please input the option")
          }
        : {
            isInvalid[3] = false,
            validationController.optionC.remove("Please input the option")
          };

    //option D field
    _optionDController.text.isEmpty
        ? {
            isInvalid[4] = true,
            validationController.optionD.add("Please input the option")
          }
        : {
            isInvalid[4] = false,
            validationController.optionD.remove("Please input the option")
          };

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
    //to check if the user not check any correct answer box
    setState(() {
      _isUncheckedAll = !_isChecked.contains(true);
    });

    //*
    //if _isChecked did not contain true value, then there is no an option
    //assigned as a correct value
    //return :
    //true = valid (can go to next process)
    //false = invalid (cannot go to next process)
    //*
    return _isChecked.contains(true);
  }

  FutureBuilder<AddQuestionResponse> buildFutureBuilder(){
    return FutureBuilder<AddQuestionResponse>(
        future: _futureQuestionResponse,
        builder: (context, snapshot){
          if(snapshot.hasData){
            //return const Text('success');
            WidgetsBinding.instance.addPostFrameCallback((_) {
              validationController.isSucceed = true;
              Get.offAll(() => const MainPage());
            });
          } else if (snapshot.hasError) {
            //return Text('${snapshot.error}');
            validationController.optionA.add(snapshot.data!.data.optionA);
            validationController.optionB.add(snapshot.data!.data.optionB);
            validationController.optionC.add(snapshot.data!.data.optionC);
            validationController.optionD.add(snapshot.data!.data.optionD);
          }
          return const CircularProgressIndicator();
        }
    );
  }

  Column buildAddQuestionFrom(){
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
              errorText: _isInvalid[0] ? validationController.stringQuestion : null,
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
          isEmpty: _isInvalid[1],
          isUncheckedAll: _isUncheckedAll,
          errorMessage: validationController.stringOptionA,
        ),
        const SizedBox(height: 10,),
        Option(
          optionController: _optionBController,
          value: _isChecked[1],
          onTap: (){
            _updateCorrectAnswer(1);
          },
          title: 'Option B',
          isEmpty: _isInvalid[2],
          isUncheckedAll: _isUncheckedAll,
          errorMessage: validationController.stringOptionB,
        ),
        const SizedBox(height: 10,),
        Option(
          optionController: _optionCController,
          value: _isChecked[2],
          onTap: (){
            _updateCorrectAnswer(2);
          },
          title: 'Option C',
          isEmpty: _isInvalid[3],
          isUncheckedAll: _isUncheckedAll,
          errorMessage: validationController.stringOptionC,
        ),
        const SizedBox(height: 10,),
        Option(
          optionController: _optionDController,
          value: _isChecked[3],
          onTap: (){
            _updateCorrectAnswer(3);
          },
          title: 'Option D',
          isEmpty: _isInvalid[4],
          isUncheckedAll: _isUncheckedAll,
          errorMessage: validationController.stringOptionD,
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
                setState(() {
                  _futureQuestionResponse = ApiService().createQuestion(
                    username,
                    _questionController.text,
                    _optionAController.text,
                    _optionBController.text,
                    _optionCController.text,
                    _optionDController.text,
                    _isChecked.indexOf(true),
                    1,
                  );
                });
              }
            },
            child: const Text("ADD QUESTION")
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (_futureQuestionResponse == null)
          ? buildAddQuestionFrom() : buildFutureBuilder(),
    );
  }
}
