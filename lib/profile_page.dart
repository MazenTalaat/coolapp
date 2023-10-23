import 'package:flutter/material.dart';

const int itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text('Sayed ${(index + 1)}'),
          leading: const Icon(Icons.person),
          trailing: const Icon(Icons.check),
          onTap: () {
            debugPrint('I got tapped ${(index + 1)}');
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Center(child: Text('Testerrrrrr Gamed')),
                content: Text('Sayed ${(index + 1)} got tapped'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Ok!'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
