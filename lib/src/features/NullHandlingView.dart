import 'package:coolapp/src/features/posts_mvvm/models/posts_model.dart';
import 'package:coolapp/src/features/posts_mvvm/repositories/posts_api.dart';
import 'package:coolapp/src/features/posts_mvvm/view_models/posts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:coolapp/generated/l10n.dart';

class NullHandlingView extends ConsumerWidget {
  NullHandlingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenDimensions = MediaQuery.of(context).size;
    double? x = 1;
    double y = 1;
    String error = "";
    try {
      x = (1 / 0);
      x = null;
      y = x! + 1;
    }
    catch(e){
      error = e.toString();
      y = 5.5;
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: const Text("Null Handling Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenDimensions.width,
                height: screenDimensions.height / 2,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(y.toString()),
                      Text(error),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
