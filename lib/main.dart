import 'package:flutter/material.dart';
import 'package:lzhh/home_page.dart';

import 'offers.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lady Zainab Helping Hands',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Lady Zainab Helping Hands'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currentPage = 0;
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          MediaQuery.of(context).size.width < 600
              ? PopupMenuButton<String>(
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'our_staff',
                      child: Text('Our Staff'),
                    ),
                    const PopupMenuItem(
                      value: 'gallery',
                      child: Text('Gallery'),
                    ),
                    const PopupMenuItem(
                      value: 'about',
                      child: Text('About'),
                    ),
                    const PopupMenuItem(
                      value: 'sign_in',
                      child: Text('Sign In'),
                    ),
                    const PopupMenuItem(
                      value: 'sign_up',
                      child: Text('Sign Up'),
                    ),
                  ],
                  onSelected: (value) {
                    // Handle menu item selection
                  },
                  icon: const Icon(Icons.menu),
                )
              : Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Our Staff'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Gallery'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('About'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign In'),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
        ],
      ),
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.vertical,
            controller: _pageController,
            children: [
              LandingPage(pcontroller: _pageController),
              const HomePage(),
              const Offers(),
              Container(color: Colors.green),
              Container(color: Colors.blue),
            ],
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ],
      ),
    );
  }
}

class LandingPage extends StatelessWidget {
  const LandingPage({super.key, required this.pcontroller});
  final PageController pcontroller;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/hero_bg.jpg'),
        // image: NetworkImage(
        //     'https://preview.colorlib.com/theme/nurture/images/hero_bg.jpg'),
        fit: BoxFit.cover,
      )),
      child: Column(
        children: [
          SizedBox(
            height: 300,
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage('images/child-underlining-book.jpg'),
            //     // image: NetworkImage(
            //     //     'https://preview.colorlib.com/theme/nurture/images/hero_bg.jpg'),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Learning Center for Your Kids',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Explore Now'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  pcontroller.animateToPage(
                    1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                child: const Text('Articles'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                },
                child: const Text('News'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('Gallery'),
              ),
              TextButton(
                onPressed: () {},
                child: const Text('About'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '“Lady Zainab Helping Hands” is a dedicated platform committed to supporting children with speaking, hearing, and attention disorders. We offer a range of services including personalized therapy sessions, hearing aid assistance, and ADHD support programs. In addition to these, we also provide Quran reading classes and exploratory learning programs to stimulate the minds of children. Our recreational activities are designed to promote physical health and social interaction. Our mission is to create a nurturing environment where every child can thrive and reach their full potential. Join us in making a difference in these children’s lives.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
// Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: HomePage(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//       bottomNavigationBar: NavigationBar(
//         destinations: const [
//           NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
//           NavigationDestination(icon: Icon(Icons.person), label: 'me'),
//         ],
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentPage = index;
//           });
//         },
//         selectedIndex: currentPage,
//       ),
//     );