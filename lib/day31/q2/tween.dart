import 'package:flutter/material.dart';

class MyTween extends StatefulWidget {
  const MyTween({super.key});

  @override
  State<MyTween> createState() => _MyTweenState();
}

class _MyTweenState extends State<MyTween> {
  double begin=100;
  double end=100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TweenAnimationBuilder(
            tween: Tween<double>(begin: begin, end: end),
            duration: Duration(seconds: 1),
            builder: (ctx, value, x) {
              return Container(
                color: Colors.red,
                width: value,
                height: 300,
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        begin=begin==100?300:100;
        end=end!=100?300:100;
        setState(() {
          
        });
      }),
    );
  }
}
