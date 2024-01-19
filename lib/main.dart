import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:defer_pointer/defer_pointer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton.extended(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          label: const Text("Floating"),
          onPressed: () {},
        ),
        body: DeferredPointerHandler(
            child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomScrollView(slivers: [
              SliverPersistentHeader(delegate: HeaderDelegate(), pinned: true),
              const SliverToBoxAdapter(child: SizedBox(height: 40)),
              const SliverToBoxAdapter(
                  child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Text(
                        "Title",
                        style: TextStyle(fontSize: 40),
                      ))),
              const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")),
              ),
              const SliverToBoxAdapter(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Text(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 90))
            ]),
          ],
        )));
  }
}

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //! shrinkOffset == 0 : content is rendered with maxExtent height
    //! shrinkOffset == maxExtent - minExtent : content is rendered with minExtent

    //! shrinkOffset initial value : 0
    //! shrinkOffset max value: maxExtent

    final progress = shrinkOffset / maxExtent;
    int iconSizeOffset = getIconSizeOffset(progress, 12);

    return Material(
      child: Stack(
        children: [
          AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: progress,
              child: Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/background.jpeg"),
                          fit: BoxFit.cover)),
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Container(
                        alignment: Alignment.center,
                        color: Colors.grey.withOpacity(0.1),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20, right: 20, top: 40),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      DeferPointer(
                                          child: SizedBox(
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  backgroundColor: Colors.white,
                                                  foregroundColor: Colors
                                                      .blue, // <-- Button color<-- Splash color
                                                ),
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.arrow_back,
                                                  color: Colors.black,
                                                )),
                                              )))
                                    ],
                                  ),
                                  DeferPointer(
                                      child: SizedBox(
                                          height: 30,
                                          width: 100,
                                          child: TextButton(
                                            style: TextButton.styleFrom(
                                                backgroundColor: Colors.grey),
                                            onPressed: () {
                                              print("Hello");
                                            },
                                            child: const Center(
                                                child: Text(
                                              "Button",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                          )))
                                ])),
                      ),
                    ),
                  ))),
          AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              opacity: 1 - progress,
              child: Stack(clipBehavior: Clip.none, children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/background.jpeg"),
                          fit: BoxFit.cover)),
                  child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 44),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    shape: const CircleBorder(),
                                    backgroundColor: Colors.white,
                                    foregroundColor: Colors
                                        .blue, // <-- Button color<-- Splash color
                                  ),
                                  child: const Center(
                                      child: Icon(
                                    Icons.arrow_back,
                                    color: Colors.black,
                                  )),
                                )),
                            Row(
                              children: [
                                SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors
                                            .blue, // <-- Button color<-- Splash color
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        Icons.heart_broken,
                                        color: Colors.red,
                                      )),
                                    )),
                                const SizedBox(width: 2),
                                SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        shape: const CircleBorder(),
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors
                                            .blue, // <-- Button color<-- Splash color
                                      ),
                                      child: const Center(
                                          child: Icon(
                                        Icons.download,
                                        color: Colors.grey,
                                      )),
                                    ))
                              ],
                            )
                          ])),
                ),
                Positioned(
                    left: 20,
                    bottom: -40,
                    child: DeferPointer(
                        child: AnimatedContainer(
                      decoration: const BoxDecoration(
                          color: Colors.grey, shape: BoxShape.circle),
                      duration: const Duration(milliseconds: 150),
                      width: 90 - iconSizeOffset.toDouble(),
                      height: 90 - iconSizeOffset.toDouble(),
                      child: Material(
                        elevation: 4.0,
                        shape: const CircleBorder(),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.transparent,
                        child: Ink.image(
                          image: const AssetImage('assets/walter_white.png'),
                          fit: BoxFit.cover,
                          width: 100.0,
                          height: 100.0,
                          child: InkWell(
                            onTap: () {},
                          ),
                        ),
                      ),
                    ))),
                Positioned(
                    right: 20,
                    bottom: -16,
                    child: DeferPointer(
                      child: SizedBox(
                          height: 30,
                          width: 100,
                          child: TextButton(
                            style: TextButton.styleFrom(
                                elevation: 2, backgroundColor: Colors.grey),
                            onPressed: () {
                              print("Hello");
                            },
                            child: const Center(
                                child: Text(
                              "Button",
                              style: TextStyle(color: Colors.white),
                            )),
                          )),
                    ))
              ])),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 264;

  @override
  double get minExtent => 94;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}

int getIconSizeOffset(double progress, int acceleration) {
  int parsedProgress = (progress * 100).toInt();

  int firstDigit;

  firstDigit = parsedProgress < 10
      ? 0
      : int.parse((parsedProgress.toString()).substring(0, 1));

  if (firstDigit == 0) return 0;

  return firstDigit + parsedProgress ~/ 10 + acceleration;
}
