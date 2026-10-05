import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const SmartTripPlannerApp());
}

class SmartTripPlannerApp extends StatelessWidget {
  const SmartTripPlannerApp({super.key});

  @override
  Widget build(BuildContext context) {
    const seed = Color(0xFF0F766E);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Trip Planner',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: seed),
        scaffoldBackgroundColor: const Color(0xFFF7F7F4),
        textTheme: GoogleFonts.poppinsTextTheme(),
        cardTheme: const CardThemeData(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(24)),
          ),
        ),
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int index = 0;

  final pages = const [
    HomeScreen(),
    TripsScreen(),
    ExploreScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: pages[index]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (value) => setState(() => index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home_rounded), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.luggage_outlined), selectedIcon: Icon(Icons.luggage_rounded), label: 'Trips'),
          NavigationDestination(icon: Icon(Icons.explore_outlined), selectedIcon: Icon(Icons.explore_rounded), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      floatingActionButton: index == 0 || index == 1
          ? FloatingActionButton.extended(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => const CreateTripScreen()),
              ),
              icon: const Icon(Icons.add),
              label: const Text('New trip'),
            )
          : null,
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(20, 18, 20, 32),
      children: [
        Row(
          children: [
            const CircleAvatar(radius: 24, child: Icon(Icons.person)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Good afternoon', style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black54)),
                  Text('Plan your next escape', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
                ],
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_rounded)),
          ],
        ),
        const SizedBox(height: 26),
        TextField(
          decoration: InputDecoration(
            hintText: 'Where do you want to go?',
            prefixIcon: const Icon(Icons.search),
            suffixIcon: const Icon(Icons.tune_rounded),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
          ),
        ),
        const SizedBox(height: 28),
        Text('Upcoming trip', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 14),
        const _UpcomingTripCard(),
        const SizedBox(height: 28),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Popular ideas', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
            TextButton(onPressed: () {}, child: const Text('See all')),
          ],
        ),
        const SizedBox(height: 10),
        SizedBox(
          height: 190,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: const [
              _PlaceCard(title: 'Ella', subtitle: 'Mountains & views', icon: Icons.landscape_rounded),
              _PlaceCard(title: 'Galle', subtitle: 'Coast & heritage', icon: Icons.beach_access_rounded),
              _PlaceCard(title: 'Kandy', subtitle: 'Culture & nature', icon: Icons.park_rounded),
            ],
          ),
        ),
      ],
    );
  }
}

class _UpcomingTripCard extends StatelessWidget {
  const _UpcomingTripCard();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(28),
      onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TripWorkspaceScreen())),
      child: Ink(
        height: 250,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(28),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0F766E), Color(0xFF164E63)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    decoration: BoxDecoration(color: Colors.white.withValues(alpha: .16), borderRadius: BorderRadius.circular(30)),
                    child: const Text('8 days to go', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz, color: Colors.white),
                ],
              ),
              const Spacer(),
              const Text('Ella Weekend', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.w800)),
              const SizedBox(height: 8),
              const Text('Oct 13 - Oct 15  •  4 travelers', style: TextStyle(color: Colors.white70)),
              const SizedBox(height: 16),
              const Row(
                children: [
                  _MiniAvatar(label: 'M'),
                  _MiniAvatar(label: 'S'),
                  _MiniAvatar(label: 'N'),
                  _MiniAvatar(label: '+1'),
                  Spacer(),
                  Icon(Icons.arrow_forward_rounded, color: Colors.white),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _MiniAvatar extends StatelessWidget {
  final String label;
  const _MiniAvatar({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34,
      height: 34,
      margin: const EdgeInsets.only(right: 6),
      decoration: BoxDecoration(color: Colors.white.withValues(alpha: .18), shape: BoxShape.circle, border: Border.all(color: Colors.white30)),
      alignment: Alignment.center,
      child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12)),
    );
  }
}

class _PlaceCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  const _PlaceCard({required this.title, required this.subtitle, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: const EdgeInsets.only(right: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(18)),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const Spacer(),
          Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 4),
          Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12)),
        ],
      ),
    );
  }
}

class TripsScreen extends StatelessWidget {
  const TripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text('My Trips', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w800)),
        const SizedBox(height: 6),
        const Text('Plan together, travel better.', style: TextStyle(color: Colors.black54)),
        const SizedBox(height: 24),
        const _TripTile(title: 'Ella Weekend', dates: 'Oct 13 - Oct 15', members: '4 members'),
        const SizedBox(height: 14),
        const _TripTile(title: 'Galle Escape', dates: 'Nov 02 - Nov 04', members: '2 members'),
      ],
    );
  }
}

class _TripTile extends StatelessWidget {
  final String title;
  final String dates;
  final String members;
  const _TripTile({required this.title, required this.dates, required this.members});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        contentPadding: const EdgeInsets.all(18),
        leading: Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(18)),
          child: Icon(Icons.flight_takeoff_rounded, color: Theme.of(context).colorScheme.primary),
        ),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w700)),
        subtitle: Text('$dates\n$members'),
        isThreeLine: true,
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const TripWorkspaceScreen())),
      ),
    );
  }
}

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});
  @override
  Widget build(BuildContext context) => const _PlaceholderPage(icon: Icons.explore_rounded, title: 'Explore', subtitle: 'Destinations, places and recommendations will live here.');
}

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});
  @override
  Widget build(BuildContext context) => const _PlaceholderPage(icon: Icons.forum_rounded, title: 'Trip Chats', subtitle: 'Realtime group conversations will be connected with Supabase later.');
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => const _PlaceholderPage(icon: Icons.person_rounded, title: 'Profile', subtitle: 'Profile, preferences and travel history.');
}

class _PlaceholderPage extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  const _PlaceholderPage({required this.icon, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 64, color: Theme.of(context).colorScheme.primary),
            const SizedBox(height: 18),
            Text(title, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
            const SizedBox(height: 8),
            Text(subtitle, textAlign: TextAlign.center, style: const TextStyle(color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}

class CreateTripScreen extends StatelessWidget {
  const CreateTripScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create a trip')),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text('Where are you going?', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800)),
          const SizedBox(height: 20),
          const _Input(hint: 'Destination', icon: Icons.place_outlined),
          const SizedBox(height: 14),
          const _Input(hint: 'Trip name', icon: Icons.edit_outlined),
          const SizedBox(height: 14),
          Row(children: const [Expanded(child: _Input(hint: 'Start date', icon: Icons.calendar_today_outlined)), SizedBox(width: 12), Expanded(child: _Input(hint: 'End date', icon: Icons.event_outlined))]),
          const SizedBox(height: 14),
          const _Input(hint: 'Travelers', icon: Icons.group_outlined),
          const SizedBox(height: 14),
          const _Input(hint: 'Estimated budget', icon: Icons.account_balance_wallet_outlined),
          const SizedBox(height: 28),
          FilledButton.icon(
            onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const TripWorkspaceScreen())),
            icon: const Icon(Icons.auto_awesome_rounded),
            label: const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Text('Create trip workspace')),
          ),
        ],
      ),
    );
  }
}

class _Input extends StatelessWidget {
  final String hint;
  final IconData icon;
  const _Input({required this.hint, required this.icon});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide.none),
      ),
    );
  }
}

class TripWorkspaceScreen extends StatelessWidget {
  const TripWorkspaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text('Ella Weekend'), Text('Oct 13 - Oct 15', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400))]),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.person_add_alt_1_outlined)), const SizedBox(width: 6)],
          bottom: const TabBar(isScrollable: true, tabs: [Tab(text: 'Plan'), Tab(text: 'Places'), Tab(text: 'Budget'), Tab(text: 'Members'), Tab(text: 'Chat')]),
        ),
        body: const TabBarView(children: [PlanTab(), PlacesTab(), BudgetTab(), MembersTab(), TripChatTab()]),
      ),
    );
  }
}

class PlanTab extends StatelessWidget {
  const PlanTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Day 1', style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w800)), TextButton.icon(onPressed: () {}, icon: const Icon(Icons.add), label: const Text('Add'))]),
        const _TimelineItem(time: '08:00', title: 'Breakfast in Ella', subtitle: 'Start the day near the town centre', icon: Icons.restaurant_rounded),
        const _TimelineItem(time: '09:30', title: 'Nine Arches Bridge', subtitle: 'Suggested by Sahan • 3 votes', icon: Icons.landscape_rounded),
        const _TimelineItem(time: '13:00', title: 'Lunch & rest', subtitle: 'Flexible time', icon: Icons.lunch_dining_rounded),
        const _TimelineItem(time: '15:30', title: "Little Adam's Peak", subtitle: 'Sunset viewpoint', icon: Icons.hiking_rounded),
      ],
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final IconData icon;
  const _TimelineItem({required this.time, required this.title, required this.subtitle, required this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        SizedBox(width: 52, child: Padding(padding: const EdgeInsets.only(top: 18), child: Text(time, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black54)))),
        Expanded(
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(children: [
                Container(width: 48, height: 48, decoration: BoxDecoration(color: Theme.of(context).colorScheme.primaryContainer, borderRadius: BorderRadius.circular(16)), child: Icon(icon, color: Theme.of(context).colorScheme.primary)),
                const SizedBox(width: 14),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [Text(title, style: const TextStyle(fontWeight: FontWeight.w700)), const SizedBox(height: 4), Text(subtitle, style: const TextStyle(color: Colors.black54, fontSize: 12))])),
                const Icon(Icons.drag_handle_rounded, color: Colors.black26),
              ]),
            ),
          ),
        )
      ]),
    );
  }
}

class PlacesTab extends StatelessWidget {
  const PlacesTab({super.key});
  @override
  Widget build(BuildContext context) => const _PlaceholderPage(icon: Icons.place_rounded, title: 'Saved Places', subtitle: 'Members can suggest places, vote and comment before adding them to the itinerary.');
}

class BudgetTab extends StatelessWidget {
  const BudgetTab({super.key});
  @override
  Widget build(BuildContext context) => const _PlaceholderPage(icon: Icons.account_balance_wallet_rounded, title: 'Trip Budget', subtitle: 'Budget, expenses and group splitting will be managed here.');
}

class MembersTab extends StatelessWidget {
  const MembersTab({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(padding: const EdgeInsets.all(20), children: const [
      _MemberTile(name: 'Manuja', role: 'Owner'),
      _MemberTile(name: 'Sahan', role: 'Editor'),
      _MemberTile(name: 'Nimal', role: 'Member'),
      _MemberTile(name: 'Kasun', role: 'Member'),
    ]);
  }
}

class _MemberTile extends StatelessWidget {
  final String name;
  final String role;
  const _MemberTile({required this.name, required this.role});
  @override
  Widget build(BuildContext context) => Card(
    child: ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: CircleAvatar(child: Text(name.substring(0, 1))),
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w700)),
      subtitle: Text(role),
      trailing: const Icon(Icons.more_vert),
    ),
  );
}

class TripChatTab extends StatelessWidget {
  const TripChatTab({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const Expanded(
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            _ChatBubble(name: 'Sahan', message: 'Nine Arches Bridge morning ekata danna da?', mine: false),
            _ChatBubble(name: 'You', message: 'Ow, 9.30 wage set karamu. Sunset eka Little Adam’s Peak.', mine: true),
            _ChatBubble(name: 'Nimal', message: '👍 I vote for that plan.', mine: false),
          ],
        ),
      ),
      SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(14, 8, 14, 14),
          child: Row(children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.add_circle_outline)),
            Expanded(child: TextField(decoration: InputDecoration(hintText: 'Message your group...', filled: true, fillColor: Colors.white, border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none)))),
            const SizedBox(width: 8),
            IconButton.filled(onPressed: () {}, icon: const Icon(Icons.send_rounded)),
          ]),
        ),
      )
    ]);
  }
}

class _ChatBubble extends StatelessWidget {
  final String name;
  final String message;
  final bool mine;
  const _ChatBubble({required this.name, required this.message, required this.mine});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: mine ? Theme.of(context).colorScheme.primary : Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(name, style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: mine ? Colors.white70 : Colors.black45)),
          const SizedBox(height: 4),
          Text(message, style: TextStyle(color: mine ? Colors.white : Colors.black87)),
        ]),
      ),
    );
  }
}
