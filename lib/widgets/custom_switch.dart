import 'package:flutter/material.dart';

class CustomSwitch extends StatefulWidget {
  const CustomSwitch(
      {super.key,
      required this.isDone,
      required this.onChangeIsDone,
      required this.id});

  final bool isDone;
  final String id;
  final void Function(bool isDone, String id) onChangeIsDone;

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch> {
  final double _switchWidth = 320.0;
  final double _switchHeight = 70.0;
  final Duration _animationDuration = const Duration(milliseconds: 300);

  void _onTapSwitch() {
    widget.onChangeIsDone(!widget.isDone, widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(100),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: _onTapSwitch,
          child: SizedBox(
            width: _switchWidth,
            height: _switchHeight,
            child: Stack(
              children: [
                // backgorund
                Container(
                  width: _switchWidth,
                  height: _switchHeight,
                  color: const Color.fromARGB(255, 10, 13, 61),
                ),
                // check icon
                AnimatedPositioned(
                  duration: _animationDuration,
                  top: 0,
                  bottom: 0,
                  left: widget.isDone ? (_switchWidth - _switchHeight) : 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                      width: 70,
                      height: 70,
                      color: Colors.white,
                      child: const Icon(
                        Icons.check,
                        color: Color.fromARGB(255, 10, 13, 61),
                        size: 30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 92,
                  child: Text(
                    widget.isDone ? 'Set Not done' : 'Set as Done!',
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
