import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final scrollcontroller = ScrollController();
  Color color = Colors.amber;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Scrolls page"),
          actions: [
            IconButton(
                onPressed: () {
                  scrollcontroller.animateTo(
                    5000,
                    duration: Duration(seconds: 10),
                    curve: Curves.bounceInOut,
                  );
                },
                icon: Icon(Icons.add))
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 50,
                controller: scrollcontroller,
                itemBuilder: (context, index) {
                  return Card(
                      color: color,
                      child: ListTile(
                        leading: const CircleAvatar(),
                        title: Text("Salom $index"),
                        subtitle: const Text("+998 90 123 45 67"),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.edit),
                        ),
                      ));
                },
              ),
            ),
          ],
        ));
  }
}
