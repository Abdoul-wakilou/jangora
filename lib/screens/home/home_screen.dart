import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> categories = [
    {'title': 'Développement', 'icon': Iconsax.code, 'color': Colors.blue},
    {'title': 'Design', 'icon': Iconsax.brush_1, 'color': Colors.purple},
    {'title': 'Marketing', 'icon': Iconsax.graph, 'color': Colors.green},
    {'title': 'Business', 'icon': Iconsax.briefcase, 'color': Colors.orange},
    {'title': 'Photographie', 'icon': Iconsax.camera, 'color': Colors.pink},
    {'title': 'Musique', 'icon': Iconsax.music, 'color': Colors.red},
  ];

  final List<Map<String, dynamic>> popularCourses = [
    {
      'title': 'Flutter Avancé',
      'instructor': 'Sarah Johnson',
      'rating': 4.8,
      'students': 1245,
      'image': 'assets/images/flutter.jpg',
      'price': '\$29.99',
      'category': 'Développement',
    },
    {
      'title': 'UI/UX Design',
      'instructor': 'Mike Chen',
      'rating': 4.7,
      'students': 987,
      'image': 'assets/images/design.jpg',
      'price': '\$24.99',
      'category': 'Design',
    },
    {
      'title': 'Marketing Digital',
      'instructor': 'Emma Davis',
      'rating': 4.6,
      'students': 1562,
      'image': 'assets/images/marketing.jpg',
      'price': '\$34.99',
      'category': 'Marketing',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Bonjour,',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                icon: const Icon(Iconsax.notification),
                onPressed: () {},
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: const CircleAvatar(
                  backgroundImage:
                  NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
                ),
              ),
            ],
            floating: true,
            snap: true,
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                _buildSearchBar(),
                const SizedBox(height: 24),
                _buildSectionTitle('Catégories', showAll: true),
                const SizedBox(height: 12),
                _buildCategories(),
                const SizedBox(height: 24),
                _buildSectionTitle('Cours populaires', showAll: true),
                const SizedBox(height: 12),
                _buildPopularCourses(),
                const SizedBox(height: 24),
                _buildSectionTitle('Nouveaux cours'),
                const SizedBox(height: 12),
                _buildRecentCourses(),
              ]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.search_normal),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.book),
            label: 'Mes cours',
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.profile_circle),
            label: 'Profil',
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Rechercher des cours...',
        prefixIcon: const Icon(Iconsax.search_normal),
        filled: true,
        fillColor: Colors.grey.withOpacity(0.1),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 0),
      ),
    );
  }

  Widget _buildSectionTitle(String title, {bool showAll = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        if (showAll)
          TextButton(
            onPressed: () {},
            child: const Text('Voir tout'),
          ),
      ],
    );
  }

  Widget _buildCategories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Container(
            width: 100,
            margin: EdgeInsets.only(
              right: index == categories.length - 1 ? 0 : 12,
            ),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: category['color'].withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    category['icon'],
                    color: category['color'],
                    size: 28,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  category['title'],
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                  maxLines: 2,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildPopularCourses() {
    return SizedBox(
      height: 220,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: popularCourses.length,
        itemBuilder: (context, index) {
          final course = popularCourses[index];
          return Container(
            width: 180,
            margin: EdgeInsets.only(
              right: index == popularCourses.length - 1 ? 0 : 16,
            ),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(12),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 90,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey.withOpacity(0.1),
                          image: DecorationImage(
                            image: AssetImage(course['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        course['category'],
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        course['title'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Iconsax.star1, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            course['rating'].toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '(${course['students']})',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        course['price'],
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildRecentCourses() {
    return Column(
      children: popularCourses.map((course) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.withOpacity(0.1)),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey.withOpacity(0.1),
                      image: DecorationImage(
                        image: AssetImage(course['image']),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course['category'],
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.blue,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          course['title'],
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Iconsax.star1, size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              course['rating'].toString(),
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              course['instructor'],
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    course['price'],
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
