import 'package:flutter/material.dart';
import 'package:Telematers_Quiz/widget/image_question.dart';
import 'package:Telematers_Quiz/widget/normal_question.dart';
import '../widget/custom_purple.dart';


class AddQuestion extends StatefulWidget {
  const AddQuestion({Key? key}) : super(key: key);

  @override
  State<AddQuestion> createState() => _AddQuestionState();
}

class _AddQuestionState extends State<AddQuestion> {
  //question page type data
  final List<bool> _selectedQuestionType = [true,false];
  List<Widget> questionType = <Widget>[
    const Text('Normal'),
    const Text('Image')
  ];

  //alert dialog to prevent miss click back button
  Future<bool?> _showDialog(BuildContext context){
    //*
    //to prevent keyboard pop up when go back
    FocusManager.instance.primaryFocus?.unfocus();
    //*
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Whoops!'),
          content: const Text('Are you sure want to go back?'),
          actions: [
            TextButton(
              onPressed: (){
                Navigator.pop(context, false);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: (){
                Navigator.pop(context, true);
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    //GestureDetector widget used for close the keyboard by tapping
    //empty space in the ui
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTapDown: (_){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      //WillPopScope used to detect go back action by user (by button or UI)
      //before action is executed, the app will return pop up message to
      //ensure the user action
      child: WillPopScope(
        onWillPop: () async{
          final shouldPop = await _showDialog(context);
          return shouldPop!;
        },
        child: Scaffold(
          appBar: AppBar(),
          //SingleChildScrollView to prevent screen overflow if
          //the user using keyboard
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 20,),
                //toggle button widget to select between questions type
                ToggleButtons(
                  direction: Axis.horizontal,
                  onPressed: (int index) {
                    setState(() {
                      // The button that is tapped is set to true, and
                      // the others to false.
                      for (int i = 0; i < _selectedQuestionType.length; i++) {
                        _selectedQuestionType[i] = i == index;
                      }
                    });
                  },
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  selectedBorderColor: CustomPurple.kToDark,
                  selectedColor: Colors.white,
                  fillColor: CustomPurple.kToDark,
                  constraints: const BoxConstraints(
                    minHeight: 40.0,
                    minWidth: 80.0,
                  ),
                  isSelected: _selectedQuestionType,
                  children: questionType,
                ),
                const SizedBox(height: 10,),
                //page between NormalQuestion or ImageQuestion
                _selectedQuestionType[0]==true
                    ? const NormalQuestion() : const ImageQuestion(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
