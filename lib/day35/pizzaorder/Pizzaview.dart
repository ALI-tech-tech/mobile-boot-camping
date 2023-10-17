import 'package:flutter/material.dart';
import 'package:flutter_practis/day35/pizzaorder/Pizza.dart';

class PizzaView extends StatefulWidget {
  const PizzaView({super.key});

  @override
  State<PizzaView> createState() => _PizzaViewState();
}

class _PizzaViewState extends State<PizzaView> {
  Pizza? pi = Pizza();
  String selected = toppings.values[0].name;

  po(size s) {
    pi!.s = s;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza Order 😍"),
      ),
      body: Container(
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Text("Size"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Radio(value: 1, groupValue: 2, onChanged: (v) {}),
                Text("${size.values[0]}"),
                Radio(value: 1, groupValue: 2, onChanged: (v) {}),
                Text("${size.values[1]}"),
                Radio(value: 1, groupValue: 2, onChanged: (v) {}),
                Text("${size.values[2]}"),
              ],
            ),
            Divider(),
            Text("Toppings"),
            SizedBox(
              height: 50,
              child: DropdownButton(

                  //hint: Text("Chooose one"),
                  value: selected,
                  items:
                      // [DropdownMenuItem(
                      //           enabled: false,
                      //           child: Text("Choose one"))]+
                      List.generate(
                          toppings.values.length,
                          (index) => DropdownMenuItem(
                              enabled: index != 0 ? true : false,
                              value: toppings.values[index].name,
                              child: Text("${toppings.values[index].name}"))),
                  onChanged: (value) {
                    selected = value!;
                    setState(() {
                      pi!.toppings.add(value);
                    });
                  }),
            ),
            // SizedBox(
            //   height: (20*pi!.toppings.length).toDouble(),
            //   child: ListView.builder(
            //     itemCount: pi!.toppings.length,
            //     itemBuilder: (ctx,index){
            //       return ListTile(
            //          leading: IconButton(onPressed: (){
            //           pi!.toppings.remove(pi!.toppings[index]);
            //           setState(() {

            //           });
            //          }, icon: Icon(Icons.remove_circle_outline)),
            //          title:Text("${ pi!.toppings[index]}"),
            //       );
            //     }),
            // ),

            boxlist(pi: pi!),
            Row(
              children: [
                
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {}, child: Text("Confirm"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

enum toppings {
  choose_one,
  sasusage,
  garlicSauce,
  pepperoni,
}

class boxlist extends StatefulWidget {
  Pizza pi;
  boxlist({super.key, required this.pi});

  @override
  State<boxlist> createState() => _boxlistState();
}

class _boxlistState extends State<boxlist> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: (60 * widget.pi!.toppings.length).toDouble(),
      child: ListView.builder(
          itemCount: widget.pi!.toppings.length,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: IconButton(
                  onPressed: () {
                    widget.pi!.toppings.remove(widget.pi!.toppings[index]);
                    setState(() {});
                  },
                  icon: Icon(Icons.remove_circle_outline)),
              title: Text("${widget.pi!.toppings[index]}"),
            );
          }),
    );
  }
}
