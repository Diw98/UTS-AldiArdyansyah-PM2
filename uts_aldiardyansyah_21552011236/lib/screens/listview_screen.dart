import 'package:flutter/material.dart';

class ListVieww extends StatefulWidget {
  const ListVieww({Key? key}) : super(key: key);

  @override
  State<ListVieww> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListVieww> {
  double screenHeight = 0;
  double screenWidth = 0;

  bool startAnimation = false;

  List<String> texts = [
    "Civic Turbo",
    "Ferarri",
    "Koenigsegg Gemera",
    "Lamborghini",
    "Lexus",
    "Motor Custom",
    "R6",
    "Toyota GR Supra",
    "Vespa Matic",
    "ZX25R",
  ];

  List<IconData> icons = [
    Icons.car_rental,
    Icons.car_rental,
    Icons.car_rental,
    Icons.car_rental,
    Icons.car_rental,
    Icons.motorcycle,
    Icons.motorcycle,
    Icons.car_rental,
    Icons.motorcycle,
    Icons.motorcycle,
  ];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        startAnimation = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color(0xFF222431),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth / 20,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  // Future.delayed(const Duration(milliseconds: 500), () {
                  //   setState(() {
                  //     startAnimation = true;
                  //   });
                  // });
                },
                child: const Text(
                  "SHOW LIST",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              ListView.builder(
                primary: false,
                shrinkWrap: true,
                itemCount: texts.length,
                itemBuilder: (context, index) {
                  return item(index);
                },
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(int index) {
    return AnimatedContainer(
      height: 55,
      width: screenWidth,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300 + (index * 200)),
      transform:
          Matrix4.translationValues(startAnimation ? 0 : screenWidth, 0, 0),
      margin: const EdgeInsets.only(
        bottom: 12,
      ),
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth / 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "${index + 1}. ${texts[index]}",
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            icons[index],
          ),
        ],
      ),
    );
  }
}
