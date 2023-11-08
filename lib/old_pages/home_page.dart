import 'package:coolapp/old_pages/classes_page.dart';
import 'package:flutter/material.dart';

import '../generated/l10n.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Classes();
              },
            ),
          );
        },
        child: Text(S.of(context).learn_flutter),
      ),
    );
  }
}
