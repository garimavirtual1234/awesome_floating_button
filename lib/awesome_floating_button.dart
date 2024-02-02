library awesome_floationg_button;
import 'package:flutter/material.dart';

class AwesomeFloatingButton extends StatefulWidget {
  final Color buttonBgColor;
  final Color iconColor;
  final List<Widget> iconButtonList;
  const AwesomeFloatingButton({super.key,
  required this.buttonBgColor,
    required this.iconColor,
    required this.iconButtonList
  });

  @override
  State<AwesomeFloatingButton> createState() => _AwesomeFloatingButtonState();
}

class _AwesomeFloatingButtonState extends State<AwesomeFloatingButton> with SingleTickerProviderStateMixin {
  late AnimationController _animateController;
  bool _isOpened = false;
  late Animation<double> _translateButton;
  late Animation<Size> _translateButtonSize;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animateController =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..addListener(() {
        setState(() {});
      });
    _translateButtonSize = Tween<Size>(
        begin: const Size(0, 0),
        end: const Size(262, 50)
    ).animate(CurvedAnimation(
        parent: _animateController,
        curve: const Interval(0.00, 1.0, curve: Curves.linear)),);
    _translateButton = Tween<double>(
        begin: 56.0,
        end: -14.0
    ).animate(
        CurvedAnimation(
            parent: _animateController,
            curve: const Interval(
                0.0,
                0.75,
                curve: Curves.linear
            )));
  }


  Widget openFloatingButton(){
    return Container(
      height:_translateButtonSize.value.height,
      width: _translateButtonSize.value.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: Colors.grey)
      ),
      child:Row(
        children:  [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 5),
              child: GestureDetector(
                onTap: (){
                  if (!_isOpened) {
                    _animateController.forward();
                  } else {
                    _animateController.reverse();
                  }
                  _isOpened = !_isOpened;
                },
                child:  CircleAvatar(
                  backgroundColor: widget.buttonBgColor,
                  child:  Icon(Icons.arrow_circle_right,
                    color: widget.iconColor,

                  ),
                ),
              ),
            ),
          ),
           Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: CircleAvatar(
                backgroundColor: widget.buttonBgColor,
                child: widget.iconButtonList[0]
              ),
            ),
          ),
           Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: CircleAvatar(
                backgroundColor: widget.buttonBgColor,
                child: widget.iconButtonList[1]
              ),
            ),
          ),
           Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 5),
              child: CircleAvatar(
                backgroundColor: widget.buttonBgColor,
                child: widget.iconButtonList[2]
              ),
            ),
          ),
       Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 5,right: 10),
              child: CircleAvatar(
                backgroundColor: widget.buttonBgColor,
                child: widget.iconButtonList[3]
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget customFloatingButton(){
    return InkWell(
      onTap: (){
        if (!_isOpened) {
          _animateController.forward();
        } else {
          _animateController.reverse();
        }
        _isOpened = !_isOpened;
      },
      child: Container(
        alignment: Alignment.bottomRight,
        padding: const EdgeInsets.all(5),
        height: 40,
        width: 40,
        decoration:  BoxDecoration(
            color: widget.buttonBgColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),bottomLeft: Radius.circular(10))
        ),
        child:  Center(
          child: Icon(Icons.arrow_circle_left,
            color:   widget.iconColor,
          ),
        ),
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.max,
        children: [
          Transform(transform: Matrix4.translationValues( _translateButton.value,0.0, 0.0),
            child: openFloatingButton(),
          ),
          _isOpened?const SizedBox(
            height: 0,
            width: 50,
          ):customFloatingButton(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _animateController.dispose();
  }
}

