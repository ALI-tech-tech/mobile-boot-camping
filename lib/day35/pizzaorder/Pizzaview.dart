import 'package:flutter/material.dart';
import 'package:flutter_practis/day35/pizzaorder/Pizza.dart';
import 'package:flutter_practis/day35/pizzaorder/PizzaController.dart';

class PizzaView extends StatefulWidget {
  const PizzaView({super.key});

  @override
  State<PizzaView> createState() => _PizzaViewState();
}

class _PizzaViewState extends State<PizzaView> {
  Pizza? pi = Pizza();
  TextEditingController txt = TextEditingController();
  PizaController pc = PizaController();
  String selected = toppings.values[0].name;
  bool isVisible = false;
  String? gvalue = "";
  bool gluteen = false;
  bool spich = false;
  bool txtfild = false;

  po(size s) {
    pi!.s = s;
  }

  selectedradio(String name) {
    gvalue = name;
    isVisible = true;
    pi!.s = size.values.firstWhere((element) => element.name == name);
    //print(pi!.s!.name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pizza Order 😍"),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5, left: 20, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Size"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0; i < size.values.length; i++)
                    Container(
                      child: Row(
                        children: [
                          Radio(
                              value: size.values[i].name,
                              groupValue: gvalue,
                              onChanged: (v) {
                                selectedradio(v!);
                              }),
                          Text(size.values[i].name),
                        ],
                      ),
                    )
                ],
              ),
              Divider(),
              Visibility(
                visible: isVisible,
                child: Column(
                  children: [
                    Text("Toppings"),
                    SizedBox(
                      height: 50,
                      child: DropdownButton(
                          value: selected,
                          items: List.generate(
                              toppings.values.length,
                              (index) => DropdownMenuItem(
                                  enabled: index != 0 ? true : false,
                                  value: toppings.values[index].name,
                                  child:
                                      Text("${toppings.values[index].name}"))),
                          onChanged: (value) {
                            setState(() {
                              var pp = pi!.toppings.contains(value);
                              if (!pp) {
                                pi!.toppings.add(value!);
                                selected = value;
                              }
                            });
                          }),
                    ),
                    boxlist(pi: pi!),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GluteenFree"),
                        Checkbox(
                            value: gluteen,
                            onChanged: (v) {
                              gluteen = v!;
                              pi?.gluteen = v;
                              setState(() {});
                            })
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Spicial instructions"),
                        Checkbox(
                            value: spich,
                            onChanged: (v) {
                              spich = v!;
                              txtfild = v!;
                              setState(() {});
                            })
                      ],
                    ),
                    Visibility(
                        visible: txtfild,
                        child: TextField(
                          controller: txt,
                          maxLength: 100,
                          maxLines: 3,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        pi!.instructions = txt.text;
                        showDialog(
                             
                            context: context,
                            builder: (ctx) {
                              return Container(
                                height: 400,
                                child: AlertDialog(
                                  
                                  contentPadding: EdgeInsets.all(0),
                                  title: Text("Confirm"),
                                  content: Container(
                                    height: 80,
                                    child: Column(
                                      children: [
                                        Icon(Icons.check_circle),
                                        Text("Are You Sure?")
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                PizaController.pizzaorder.add(pi!);
                                                pi = new Pizza();
                                                PizaController.pizzaorder
                                                    .forEach((element) {
                                                  // print(
                                                  //     "${element.instructions},${element.gluteen},${element.toppings[0]}");
                                                });
                                                Navigator.pop(context);
                                              },
                                              child: Text("Yes🤩")),
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Cancel😓"))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                      },
                      child: Row(
                        children: [
                          Icon(Icons.add_shopping_cart),
                          Text("Confirm"),
                          Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ],
                      ))
                ],
              )
            ],
          ),
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
