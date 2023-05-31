import 'package:flutter/material.dart';
import 'package:todo_app/models/Category.dart';
import 'package:todo_app/widgets/custom_switch.dart';

class TodoItemDetail extends StatefulWidget {
  const TodoItemDetail({
    super.key,
    required this.id,
    required this.text,
    required this.isDone,
    required this.category,
    required this.onChangeIsDone,
  });
  final String id;
  final String text;
  final bool isDone;
  final Category category;
  final void Function(bool isDone, String id) onChangeIsDone;

  @override
  State<TodoItemDetail> createState() => _TodoItemDetailState();
}

class _TodoItemDetailState extends State<TodoItemDetail> {
  bool _isDone = false;

  @override
  void initState() {
    super.initState();
    _isDone = widget.isDone;
  }

  void _onChangeIsDone(
    bool isDone,
    String id,
  ) {
    setState(() {
      _isDone = isDone;
    });
    widget.onChangeIsDone(isDone, id);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      padding: const EdgeInsets.symmetric(
        vertical: 60,
        horizontal: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundColor:
                    const Color.fromARGB(255, 27, 21, 44), //<-- SEE HERE

                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_downward,
                    color: Colors.white,
                  ),
                ),
              ),
              const Spacer(),
              CircleAvatar(
                backgroundColor:
                    const Color.fromARGB(255, 27, 21, 44), //<-- SEE HERE

                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Container(
            alignment: Alignment.center,
            width: 90,
            padding: const EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )),
            child: const Text(
              'Home',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            widget.text,
            style: const TextStyle(
              fontSize: 60,
              height: 1.1,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text('Additional Description'),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Going to the gym in the morning and strech body',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          CustomSwitch(
            isDone: _isDone,
            id: widget.id,
            onChangeIsDone: _onChangeIsDone,
          ),
        ],
      ),
    );
  }
}
