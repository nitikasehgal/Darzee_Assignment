// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:darzee_assi/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Profile",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 30),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: Colors.amber,
                              backgroundImage:
                                  AssetImage('assets/images/avatar.png'),
                            ),
                            const SizedBox(
                              width: 13,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  "David Author",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "Cult Boutique",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 14),
                                )
                              ],
                            ),
                          ],
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const DetailScreen();
                            }));
                          },
                          child: const CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 21,
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              foregroundColor: Colors.black,
                              child: Icon(
                                Icons.edit,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    ListItem(
                        itemname: "Customer List",
                        itemicon: Icons.list,
                        func: () {}),
                    ListItem(
                        itemname: "Contact Support ",
                        itemicon: Icons.email_outlined,
                        func: () {}),
                    ListItem(
                        itemname: "FAQs",
                        itemicon: Icons.question_answer_outlined,
                        func: () {}),
                    ListItem(
                        itemname: "Privacy Policy and Terms of Use",
                        itemicon: Icons.privacy_tip_outlined,
                        func: () {}),
                    ListItem(
                        itemname: "Share App",
                        itemicon: Icons.share,
                        func: () {}),
                  ],
                ),
                ListItem(
                    itemname: "Log Out", itemicon: Icons.logout, func: () {}),
              ]),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final String itemname;
  final IconData itemicon;
  final VoidCallback func;
  const ListItem({
    Key? key,
    required this.itemname,
    required this.itemicon,
    required this.func,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(width: 0.5, color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        onTap: func,
        leading: Icon(
          itemicon,
          color: Colors.black,
        ),
        title: Text(
          itemname,
          style: const TextStyle(
              color: Colors.black, fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
