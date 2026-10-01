import 'package:flutter/material.dart';

void main() {
  runApp(const AuraLiveApp());
}

class AuraLiveApp extends StatelessWidget {
  const AuraLiveApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aura Live',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: const Color(0xFF121212),
        brightness: Brightness.dark,
      ),
      home: const MainHomeScreen(),
    );
  }
}

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({Key? key}) : super(key: key);

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const ExploreFeedScreen(),
    const PartyRoomScreen(),
    const VideoMomentsScreen(),
    const ProfileScreen(),
    const AgencyCenterScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color(0xFF1F1F1F),
        selectedItemColor: Colors.purpleAccent,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mic),
            label: 'Party',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection),
            label: 'Moments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Agency',
          ),
        ],
      ),
    );
  }
}

// 1. Explore & Feed Screen
class ExploreFeedScreen extends StatelessWidget {
  const ExploreFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Aura Live - Explore')),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            color: const Color(0xFF1E1E1E),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundColor: Colors.purple,
                child: Icon(Icons.person, color: Colors.white),
              ),
              title: Text('Streamer Host ${index + 1}'),
              subtitle: const Text('Live streaming session in progress...'),
              trailing: const Icon(Icons.live_tv, color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}

// 2. Party & Voice Chat Screen
class PartyRoomScreen extends StatelessWidget {
  const PartyRoomScreen({Key? key}) : super(Key? key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Party & Voice Rooms')),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              color: const Color(0xFF2C2C2C),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.headset_mic, size: 40, color: Colors.purpleAccent),
                const SizedBox(height: 10),
                Text('Voice Room ${index + 1}',
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Text('8 Speakers Active', style: TextStyle(fontSize: 12, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 3. Video Moments Screen
class VideoMomentsScreen extends StatelessWidget {
  const VideoMomentsScreen({Key? key}) : super(Key? key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Moments')),
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.black,
            child: Stack(
              children: [
                Center(
                  child: Text(
                    'Short Video Feed ${index + 1}',
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                Positioned(
                  right: 20,
                  bottom: 50,
                  child: Column(
                    children: const [
                      IconButton(icon: Icon(Icons.favorite, color: Colors.white, size: 35), onPressed: null),
                      Text('1.2K', style: TextStyle(color: Colors.white)),
                      SizedBox(height: 20),
                      IconButton(icon: Icon(Icons.comment, color: Colors.white, size: 35), onPressed: null),
                      Text('230', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 4. Profile Screen
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(Key? key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('User Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, backgroundColor: Colors.purpleAccent, child: Icon(Icons.person, size: 50)),
            const SizedBox(height: 15),
            const Text('Temam Hussen', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('ID: 27759629', style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Column(children: [Text('120', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('Following')]),
                Column(children: [Text('4.5K', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('Followers')]),
                Column(children: [Text('1.2M', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), Text('Diamonds')]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// 5. Agency & Builder Center Screen
class AgencyCenterScreen extends StatelessWidget {
  const AgencyCenterScreen({Key? key}) : super(Key? key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agency & Builder Center')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Card(
            color: const Color(0xFF1E1E1E),
            child: ListTile(
              leading: const Icon(Icons.verified_user, color: Colors.purpleAccent),
              title: const Text('Temam Tech Agency'),
              subtitle: const Text('Status: Active & Verified'),
              trailing: const Text('ID: 27759629', style: TextStyle(color: Colors.green)),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            onPressed: () {},
            icon: const Icon(Icons.people),
            label: const Text('Manage Hosts & Agents'),
          ),
        ],
      ),
    );
  }
}
