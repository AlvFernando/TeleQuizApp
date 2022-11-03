import 'package:Telematers_Quiz/widget/text_mode.dart';
import 'package:flutter/material.dart';

import '../model/quiz.dart';

class QuizWidget extends StatefulWidget {
  final List<Datum> data;
  const QuizWidget(
      {
        Key? key,
        required this.data
      }) : super(key: key);

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Finalize'),
          content: const Text('Are you sure want to submit your answer?'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme
                    .of(context)
                    .textTheme
                    .labelLarge,
              ),
              child: const Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        for(int i=0;i<widget.data.length;i++)
          TextMode(
            question: widget.data[i].question,
            options: widget.data[i].options,
            onPressedPrev: (){
              if (_pageController.hasClients) {
                _pageController.animateToPage(
                  (i-1<0) ? 0 : i-1,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              }
            },
            //if there is no question, change the button function to
            //confirmation the question answered
            onPressedNext: (i+1==widget.data.length) ?
                (){
                  _dialogBuilder(context);
                }
                :
                () {
                  if (_pageController.hasClients) {
                    _pageController.animateToPage(
                      i+1,
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.easeInOut,
                    );
                  }
                },
            isFinish: (i+1>=widget.data.length) ? 'Submit' : 'Next',
            isPrev: (i==0) ? true : false,
            questionIndex: i,
          )
      ],
    );
  }
}
