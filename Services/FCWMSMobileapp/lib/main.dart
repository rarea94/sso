import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Homepage'),
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
  int _counter = 0;
  int _selectedIndex = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _selectMenuItem(String value) {
    switch (value) {
      case 'reset':
        setState(() {
          _counter = 0;
        });
        break;
      case 'about':
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('About'),
              content: const Text('This is a simple Flutter app.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            );
          },
        );
        break;
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Optionally handle icon press here
            },
          ),
          PopupMenuButton<String>(
            onSelected: _selectMenuItem,
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'reset',
                  child: Text('Reset Counter'),
                ),
                PopupMenuItem<String>(
                  value: 'about',
                  child: Text('About'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Search',
        child: const Icon(Icons.search), // Changed icon to search
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.input),
            label: 'In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.output),
            label: 'Out',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.warehouse),
            label: 'WH',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.factory),
            label: 'PROD',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.purpleAccent,
        backgroundColor: Colors.deepPurple,  // Set footer color to purple
        onTap: _onItemTapped,
      ),
    );
  }
}
