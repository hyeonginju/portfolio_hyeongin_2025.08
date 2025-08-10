import 'package:flutter/material.dart';
import 'package:portfolio_hyeongin/widgets/experience_card.dart';
import 'package:portfolio_hyeongin/widgets/project_card.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            _buildAbout(context),
            _buildSkills(context),
            _buildEducation(context),
            _buildExperience(context),
            _buildProjects(context),
            _buildFooter(context),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF00BFFF), Color(0xFF4682B4)],
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text(
            'Hyeongin Ju',
            style: Theme.of(
              context,
            ).textTheme.headlineLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 10),
          Text(
            'Software Engineer',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Product-Centered Problem Solver',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 30,
            runSpacing: 15,
            children: [
              _buildContactItem(
                Icons.email,
                'guddls654@gmail.com',
                'mailto:guddls654@gmail.com',
              ),
              _buildContactItem(
                Icons.phone,
                '+1 604-735-6440',
                'tel:+16047356440',
              ),
              _buildContactItem(
                Icons.link,
                'LinkedIn',
                'https://www.linkedin.com/in/hyeonginju/',
              ),
              _buildContactItem(Icons.location_on, 'Calgary, Canada', null),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: [
                const Text(
                  'Working Holiday Visa (EXP. Apr 18, 2027)',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
                SizedBox(height: 5),
                Text(
                  'Extendable for 2 years',
                  style: TextStyle(color: Colors.white, fontSize: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactItem(IconData icon, String text, String? url) {
    return GestureDetector(
      onTap: url != null ? () => _launchUrl(url) : null,
      child: MouseRegion(
        cursor: url != null
            ? SystemMouseCursors.click
            : SystemMouseCursors.basic,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white, size: 20),
            const SizedBox(width: 8),
            Text(
              text,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAbout(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          Text('About Me', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Passionate Software Engineer with expertise in cross-platform mobile and web development. '
              'I specialize in Flutter and React Native, focusing on creating user-centered solutions '
              'that solve real-world problems. With experience in leading development projects from '
              'planning to deployment, I bring both technical excellence and product vision to every project.',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkills(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: const Color(0xFFF1F2F6),
      child: Column(
        children: [
          Text(
            'Technical Skills',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: MediaQuery.of(context).size.width > 600 ? 4 : 2,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: MediaQuery.of(context).size.width > 600
                  ? 0.9
                  : 0.7,
              children: [
                _buildSkillCard('Languages', [
                  'Dart',
                  'JavaScript',
                ], Icons.code),
                _buildSkillCard('Frameworks', [
                  'Flutter',
                  'React Native',
                ], Icons.phone_android),
                _buildSkillCard('Tools', [
                  'Git',
                  'Firebase',
                  'GCP',
                  'Figma',
                ], Icons.build),
                _buildSkillCard('Platforms', [
                  'Android',
                  'iOS',
                  'Web',
                  'Windows',
                ], Icons.computer),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String title, List<String> skills, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E9ED)),
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 40, color: const Color(0xFF3498DB)),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Color(0xFF2C3E50),
            ),
          ),
          const SizedBox(height: 12),
          ...skills.map(
            (skill) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 2),
              child: Text(
                skill,
                style: const TextStyle(fontSize: 14, color: Color(0xFF5D6D7E)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducation(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          Text('Education', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                _buildEducationCard(
                  'B.S. in Computer Engineering (2026)',
                  'Korea Institute of Technology and Distance Lifelong Education',
                  Icons.school,
                ),
                const SizedBox(height: 30),
                _buildEducationCard(
                  'B.S. in Information & Communication Engineering (withdrawn)',
                  'Kongju National University',
                  Icons.school,
                ),
                const SizedBox(height: 30),
                _buildEducationCard(
                  'Educational institution for training software innovation talent',
                  '42 Seoul',
                  Icons.code,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEducationCard(String degree, String institution, IconData icon) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E9ED)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFF3498DB).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 32, color: const Color(0xFF3498DB)),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  degree,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF2C3E50),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  institution,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF5D6D7E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperience(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      color: const Color(0xFFF1F2F6),
      child: Column(
        children: [
          Text('Experience', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                ExperienceCard(
                  company: "Dable",
                  position:
                      "Software company supporting families and fertility",
                  duration: '2023.01 - 2025.03',
                ),
                const SizedBox(height: 20),
                ExperienceCard(
                  company: "Icon Loop",
                  position: "Blockchain technology Company",
                  duration: '2022.06 - 2022.12',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjects(BuildContext context) {
    final projects = [
      {
        'name': 'Dpland',
        'stack': 'Flutter(Web), BLoC',
        'role': 'Planning, UI/UX design, Lead Flutter Developer(100%)',
        'icon': Icons.web,
        'description':
            'A comprehensive web platform built with Flutter Web, focusing on user experience and responsive design. Led the complete development cycle from planning to deployment.',
        'features': [
          'Responsive web design optimized for all screen sizes',
          'State management using BLoC pattern for scalable architecture',
          'Custom UI/UX design with modern interface principles',
          'Real-time data synchronization and updates',
          'Cross-browser compatibility and performance optimization',
        ],
      },
      {
        'name': 'Together',
        'stack': 'Flutter(iOS/Android), Provider, Riverpod',
        'role': 'Lead Flutter Developer(100%)',
        'icon': Icons.people,
        'description':
            'A social networking mobile application designed to bring people together. Built with Flutter for cross-platform compatibility and modern state management solutions.',
        'features': [
          'Cross-platform mobile app for iOS and Android',
          'Advanced state management using Provider and Riverpod',
          'Real-time messaging and social features',
          'User authentication and profile management',
          'Push notifications and offline support',
        ],
      },
      {
        'name': 'Healthlit',
        'stack': 'Flutter(Web), BLoC, goRouter',
        'role': 'Planning, UI/UX design, Lead Flutter Developer(80%)',
        'icon': Icons.health_and_safety,
        'description':
            'A health literacy platform providing educational resources and tools. Features modern navigation and comprehensive health information management.',
        'features': [
          'Educational health content management system',
          'Advanced routing with goRouter for seamless navigation',
          'Interactive health assessment tools',
          'User progress tracking and analytics',
          'Responsive design for web accessibility',
        ],
      },
      {
        'name': 'Smart Hospital System',
        'stack': 'Flutter(Windows, Web, Android/iOS), BLoC, socket.io',
        'role': 'Lead Flutter Developer(100%)',
        'icon': Icons.local_hospital,
        'description':
            'A comprehensive hospital management system supporting multiple platforms. Features real-time communication and efficient patient data management.',
        'features': [
          'Multi-platform support (Windows, Web, Mobile)',
          'Real-time communication using socket.io',
          'Patient data management and medical records',
          'Staff scheduling and resource allocation',
          'Emergency notification system and alerts',
        ],
      },
      {
        'name': 'Dplanit Morning',
        'stack': 'Flutter(Android/iOS), BLoC, FCM',
        'role': 'Lead Flutter Developer(80%)',
        'icon': Icons.wb_sunny,
        'description':
            'A morning routine and productivity app designed to help users start their day effectively. Features intelligent notifications and habit tracking.',
        'features': [
          'Smart morning routine planning and scheduling',
          'Push notifications via Firebase Cloud Messaging',
          'Habit tracking and progress visualization',
          'Customizable morning routine templates',
          'Weather integration and daily insights',
        ],
      },
      {
        'name': 'Dplanit Plus',
        'stack': 'React Native(Android/iOS), Redux, In App Purchase',
        'role': 'Lead React Native Developer(100%)',
        'icon': Icons.shopping_cart,
        'description':
            'Premium version of the planning application with advanced features and monetization through in-app purchases. Built with React Native for optimal performance.',
        'features': [
          'Advanced planning tools and premium features',
          'In-app purchase integration for premium content',
          'Redux state management for complex data flows',
          'Subscription management and user billing',
          'Enhanced UI/UX for premium user experience',
        ],
      },
      {
        'name': 'Mocomoco',
        'stack': 'React Native(Android/iOS), socket.io, Google Maps, FCM',
        'role': 'React Native Developer(50%)',
        'icon': Icons.location_on,
        'description':
            'A location-based social application featuring real-time communication and map integration. Collaborated on development with focus on location services and notifications.',
        'features': [
          'Real-time location sharing and tracking',
          'Google Maps integration with custom markers',
          'Live chat and messaging with socket.io',
          'Push notifications for location-based events',
          'Social features and user interaction systems',
        ],
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      child: Column(
        children: [
          Text('Projects', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 900 ? 2 : 1,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: MediaQuery.of(context).size.width > 900
                    ? 1.3
                    : 1.8,
              ),
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectCard(
                  name: project['name'] as String,
                  stack: project['stack'] as String,
                  role: project['role'] as String,
                  icon: project['icon'] as IconData,
                  description: project['description'] as String,
                  features: List<String>.from(project['features'] as List),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 40),
      color: const Color(0xFF2C3E50),
      child: Column(
        children: [
          Text(
            'Let\'s Connect',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(color: Colors.white),
          ),
          const SizedBox(height: 30),
          Wrap(
            spacing: 40,
            runSpacing: 20,
            children: [
              _buildContactItem(
                Icons.email,
                'guddls654@gmail.com',
                'mailto:guddls654@gmail.com',
              ),
              _buildContactItem(
                Icons.link,
                'LinkedIn',
                'https://www.linkedin.com/in/hyeonginju/',
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Divider(color: Color(0xFF34495E)),
          const SizedBox(height: 20),
          Text(
            '© 2024 Hyeongin Ju. All rights reserved.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.7),
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }
}
