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
    required this.description,
  });
  final String id;
  final String description;
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
      color: widget.category.color,
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
            width: 110,
            padding: const EdgeInsets.symmetric(
              vertical: 7,
              horizontal: 20,
            ),
            decoration: BoxDecoration(
                color: widget.category.color,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  color: Colors.black,
                  width: 1,
                )),
            child: Text(
              widget.category.title.toUpperCase(),
              style: const TextStyle(
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
          Text(
            'Additional Description',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            widget.description,
            style: const TextStyle(
              fontSize: 24,
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
