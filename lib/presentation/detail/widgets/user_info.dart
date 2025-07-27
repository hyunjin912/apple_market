import 'package:flutter/material.dart';

class UserInfo extends StatelessWidget {
  const UserInfo({super.key, required this.seller, required this.address});

  final String seller;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 18, left: 18, right: 18, bottom: 10),
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Color(0xffB3AEB2), width: 2),
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 57,
              height: 57,
              child: CircleAvatar(
                backgroundColor: Color(0xffF77B4E),
                child: Icon(Icons.person, size: 30, color: Colors.white),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    seller,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    address,
                    style: TextStyle(fontSize: 15, color: Color(0xffACA6AD)),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text(
                  '39.3\u2103',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xff198F80),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '매너온도',
                  style: TextStyle(
                    fontSize: 15,
                    color: Color(0xffACA6AD),
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
