import 'package:flutter/material.dart';
import 'package:hotel_booking/components/option_chip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      children: [
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (e, index) {
              return Container(
                width: 300,
                color: Colors.grey,
                margin: const EdgeInsets.only(right: 10),
              );
            },
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Top Destinations",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Find the perfect destination for you"),
        const SizedBox(height: 20),
        SizedBox(
          height: 35,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (e, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedDestination = index;
                  });
                },
                child: OptionChip(
                  name: "Shimla",
                  isSelected: _selectedDestination == index,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 25),
        SizedBox(
          height: 150,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (e, index) {
              return Container(
                width: 150,
                color: Colors.grey,
                margin: const EdgeInsets.only(right: 10),
              );
            },
          ),
        ),
        const SizedBox(height: 30),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          "Featured Listings",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text("Checkout most popular destinations"),
        const SizedBox(height: 15),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (e, index) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 3,
                    blurRadius: 6,
                  ),
                ],
              ),
              height: 125,
              margin: const EdgeInsets.only(top: 15),
            );
          },
        ),
      ],
    );
  }
}
