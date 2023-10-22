import 'package:flutter/material.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  String _search = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 2,
                blurRadius: 4,
              ),
            ],
          ),
          child: TextField(
            onChanged: (text) => _search = text,
            decoration: const InputDecoration(
              hintText: "Search",
              icon: Icon(Icons.search),
              border: InputBorder.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Divider(),
        const SizedBox(height: 20),
        const Text(
          "Top Picks",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (e, index) {
            return Container(
              height: 125,
              margin: const EdgeInsets.only(top: 15),
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
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.unsplash.com/photo-1464822759023-fed622ff2c3b",
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
