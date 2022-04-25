import 'dart:math';

import 'package:flutter/material.dart';

class ForEachMethod extends StatefulWidget {
  const ForEachMethod({Key? key}) : super(key: key);

  @override
  State<ForEachMethod> createState() => _ForEachMethodState();
}

class _ForEachMethodState extends State<ForEachMethod> {
  final List<Friend> myFriends = [
    Friend(name: 'Ilham', color: 0xff39c1dd),
    Friend(name: 'Zabar', color: 0xffbeefed),
    Friend(name: 'Marshal', color: 0xffccd4f2),
    Friend(name: 'David', color: 0xffff8e97),
    Friend(name: 'Salman', color: 0xff34c1bb),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            for (var friend in myFriends) {
              friend.color = (Random().nextDouble() * 0xFFFFFFFF).toInt();
            }
          });
        },
        child: const Icon(Icons.color_lens),
      ),
      appBar: AppBar(
        title: const Text('For Each'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Click on the button to change the bg colors',
              style: TextStyle(fontSize: 22, color: Colors.blueGrey[700]),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            flex: 2,
            child: ListView.separated(
              padding: const EdgeInsets.all(12),
              itemCount: myFriends.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Color(myFriends[index].color!),
                  child: ListTile(
                    title: Text(myFriends[index].name),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const Divider(
                  thickness: 1.0,
                  color: Colors.black,
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class Friend {
  String name;
  int? color;

  Friend({required this.name, this.color});
}
