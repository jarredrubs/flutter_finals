import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              icon: Icon(Icons.person),
              label: Text('Profile Page'),
              onPressed: () => Navigator.pushNamed(context, '/profile'),
            ),
            ElevatedButton.icon(
              icon: Icon(Icons.data_usage),
              label: Text('Data Page'),
              onPressed: () => Navigator.pushNamed(context, '/data'),
            ),
          ],
        ),
      ),
    );
  }
}
