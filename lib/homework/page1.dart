import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:lesson_37/homework/page2.dart';
import 'package:lesson_37/homework/page3.dart';

Color? iconColor;

enum MenuOptions { gallery, list, tile }

class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "OLX",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Gap(10),
                const Text(
                  "BIZ 1000 DAN ORTIQ ELONLARNI TOPDIK",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Gap(30),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.change_circle_rounded,
                  ),
                ),
                PopupMenuButton<MenuOptions>(
                  icon: Icon(Icons.more_vert),
                  onSelected: (MenuOptions result) {
                    if (result == MenuOptions.gallery) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Page1();
                          },
                        ),
                      );
                    } else if (result == MenuOptions.list) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Page2();
                          },
                        ),
                      );
                    } else if (result == MenuOptions.tile) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) {
                            return Page3();
                          },
                        ),
                      );
                    }
                  },
                  itemBuilder: (BuildContext context) =>
                      <PopupMenuEntry<MenuOptions>>[
                    const PopupMenuItem<MenuOptions>(
                      value: MenuOptions.gallery,
                      child: ListTile(
                        leading: Icon(Icons.photo),
                        title: Text('Галерея'),
                      ),
                    ),
                    const PopupMenuItem<MenuOptions>(
                      value: MenuOptions.list,
                      child: ListTile(
                        leading: Icon(Icons.list),
                        title: Text('Список'),
                      ),
                    ),
                    const PopupMenuItem<MenuOptions>(
                      value: MenuOptions.tile,
                      child: ListTile(
                        leading: Icon(Icons.grid_on),
                        title: Text('Плитка'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Column(
              children: [
                for (var i = 0; i < 15; i++)
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              child: Image.network(
                                'https://frankfurt.apollo.olxcdn.com/v1/files/u58kb5fteflj2-UZ/image;s=1000x700', // Replace with your image URL
                                height: 200,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              child: Container(
                                color: Colors.teal,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 4),
                                child: const Text(
                                  'ТОП',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Byd seagull seagull tayyor full versiya',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, bottom: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const SizedBox.shrink(),
                                  IconButton(
                                      onPressed: () {
                                        iconColor = Colors.red;
                                        setState(() {});
                                      },
                                      icon: Icon(
                                        Icons.favorite,
                                        color: iconColor,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Gap(20),
                        const Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            '190 800 000 сум',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            'Ташкент, Сергелийский район - Сегодня в 10:06',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                        Gap(10),
                      ],
                    ),
                  ),
                Gap(20),
              ],
            )
          ],
        ),
      ),
    );
  }
}
