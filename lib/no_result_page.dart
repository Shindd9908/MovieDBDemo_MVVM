import 'package:flutter/material.dart';

class NoResultPage extends StatelessWidget {
  const NoResultPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Dữ liệu đang được cập nhật!', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize: 12, fontFamily: 'RobotoSlab'))
          ],
        )
    );
  }
}