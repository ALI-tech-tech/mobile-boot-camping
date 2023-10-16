import 'package:flutter/material.dart';

class AppearContiner extends StatefulWidget {
  const AppearContiner({super.key});

  @override
  State<AppearContiner> createState() => _AppearContinerState();
}

class _AppearContinerState extends State<AppearContiner>
    with SingleTickerProviderStateMixin {
   Animation<Size?>? heigh;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    
    super.initState();
   
  }

  get() {
    heigh = SizeTween(
            begin: Size(0, 0),
            end: Size(0, MediaQuery.of(context).size.height / 2))
        .animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          get();
          if (controller.isCompleted) {
            controller.reverse();
          } else {
            controller.forward();
          }
        },
        child: Column(
          children: [
            Expanded(
                child: Container(
              color: Colors.green,
            )),
            AnimatedBuilder(
              animation: controller,
              builder: (ctx, _) {
                return Container(
                  height: heigh?.value!.height == null ? 0 : heigh?.value?.height,
                  color: Colors.brown,
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
