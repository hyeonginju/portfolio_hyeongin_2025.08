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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE3F2FD), // 매우 연한 블루
            Color(0xFFF8FBFF), // 거의 흰색에 가까운 블루 틴트
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF1565C0), // 진한 블루
            ),
          ),
          const SizedBox(height: 40),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Text(
              'Passionate Software Engineer with expertise in cross-platform mobile and web development.\n'
              'I specialize in Flutter, focusing on creating user-centered solutions that solve real-world problems.'
              'With experience in leading development projects from planning to deployment,\n'
              'I bring both technical excellence and product vision to every project.',
              style: Theme.of(
                context,
              ).textTheme.bodyLarge?.copyWith(color: const Color(0xFF2E3B52)),
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF0F7FF), // 연한 아이스 블루
            Color(0xFFE8F4FD), // 조금 더 진한 아이스 블루
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Technical Skills',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final isWide = MediaQuery.of(context).size.width > 600;
                final crossAxisCount = isWide ? 4 : 2;
                final skills = [
                  {
                    'title': 'Languages',
                    'items': ['Dart', 'JavaScript'],
                    'icon': Icons.code,
                  },
                  {
                    'title': 'Frameworks',
                    'items': ['Flutter', 'React Native'],
                    'icon': Icons.phone_android,
                  },
                  {
                    'title': 'Tools',
                    'items': ['Git', 'Firebase', 'GCP', 'Figma'],
                    'icon': Icons.build,
                  },
                  {
                    'title': 'Platforms',
                    'items': ['Android', 'iOS', 'Web', 'Windows'],
                    'icon': Icons.computer,
                  },
                ];

                return Wrap(
                  spacing: 30,
                  runSpacing: 30,
                  children: skills.map((skill) {
                    return SizedBox(
                      width: isWide
                          ? (constraints.maxWidth -
                                    (30 * (crossAxisCount - 1))) /
                                crossAxisCount
                          : (constraints.maxWidth - 30) / 2,
                      child: _buildSkillCard(
                        skill['title'] as String,
                        List<String>.from(skill['items'] as List),
                        skill['icon'] as IconData,
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillCard(String title, List<String> skills, IconData icon) {
    return IntrinsicHeight(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Color(0xFFFAFCFF)],
          ),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFB3E5FC), width: 1),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF00BFFF).withValues(alpha: 0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: const Color(0xFF00BFFF)),
            const SizedBox(height: 16),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF1565C0),
              ),
            ),
            const SizedBox(height: 12),
            ...skills.map(
              (skill) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Text(
                  skill,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF546E7A),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEducation(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFFF8FBFF), Color(0xFFFFFFFF)],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Education',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 800),
            child: Column(
              children: [
                _buildEducationCard(
                  'Korea Institute of Technology and Distance Lifelong Education',
                  'B.S. in Computer Engineering (2026)',
                  Icons.school,
                ),
                const SizedBox(height: 30),
                _buildEducationCard(
                  'Kongju National University',
                  'B.S. in Information & Communication Engineering (withdrawn)',
                  Icons.school,
                ),
                const SizedBox(height: 30),
                _buildEducationCard(
                  '42 Seoul',
                  'Educational institution for training software innovation talent',
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
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.white, Color(0xFFF5FAFF)],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFB3E5FC)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF4682B4).withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  const Color(0xFF00BFFF).withValues(alpha: 0.1),
                  const Color(0xFF4682B4).withValues(alpha: 0.05),
                ],
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, size: 32, color: const Color(0xFF00BFFF)),
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
                    color: Color(0xFF1565C0),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  institution,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Color(0xFF546E7A),
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFFF0F8FF), // 앨리스 블루
            Color(0xFFE6F3FF), // 연한 스카이 블루
          ],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Experience',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF1565C0),
            ),
          ),
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
        'link':
            'https://play.google.com/store/apps/details?id=com.monthlything.Together',
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
        'link': 'https://hlitdb.dplanit.co.kr/home',
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
        'name': 'Dplanit Moming',
        'stack': 'Flutter(Android/iOS), BLoC, FCM',
        'role': 'Lead Flutter Developer(80%)',
        'icon': Icons.family_restroom,
        'description':
            'A morning routine and productivity app designed to help users start their day effectively. Features intelligent notifications and habit tracking.',
        'features': [
          'Push Notifications via Firebase Cloud Messaging',
          'Infertility community platform: users can create posts, comment, and recomment; photos can be included',
          'AI Chatbot (ChatGPT API) tailored with prompts curated by medical professionals',
          'Aggregated and curated content from videos, blogs, and news sources (displayed via InApp WebView)',
          'Health tools for pregnant women: dangerous drug search and self-check functions',
        ],
        'link': 'https://home.dplanit.co.kr/',
      },
      {
        'name': 'Dplanit Plus',
        'stack': 'React Native(Android/iOS), Redux, In App Purchase',
        'role': 'Lead React Native Developer(100%)',
        'icon': Icons.pregnant_woman,
        'description':
            'Premium version of the planning application with advanced features and monetization through in-app purchases. Built with React Native for optimal performance.',
        'features': [
          'Advanced planning tools and premium features',
          'In-app purchase integration for premium content',
          'Redux state management for complex data flows',
          'Subscription management and user billing',
          'Enhanced UI/UX for premium user experience',
        ],
        'link':
            'https://play.google.com/store/apps/details?id=com.dable.dplanitplus&hl=ko',
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
        'link': 'https://www.notion.so/f43ea8938d0442c190ea8c629febb211?pvs=21',
      },
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 40),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Color(0xFFF8FBFF)],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: const Color(0xFF1565C0),
            ),
          ),
          const SizedBox(height: 60),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 900) {
                  // Desktop layout - 2 columns with Wrap
                  return Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    alignment: WrapAlignment.start,
                    children: projects.map((project) {
                      return SizedBox(
                        width: (constraints.maxWidth - 30) / 2,
                        child: ProjectCard(
                          name: project['name'] as String,
                          stack: project['stack'] as String,
                          role: project['role'] as String,
                          icon: project['icon'] as IconData,
                          description: project['description'] as String,
                          features: List<String>.from(
                            project['features'] as List,
                          ),
                          link: project['link'] as String?,
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  // Mobile layout - 1 column
                  return Column(
                    children: projects.map((project) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 30),
                        child: ProjectCard(
                          name: project['name'] as String,
                          stack: project['stack'] as String,
                          role: project['role'] as String,
                          icon: project['icon'] as IconData,
                          description: project['description'] as String,
                          features: List<String>.from(
                            project['features'] as List,
                          ),
                          link: project['link'] as String?,
                        ),
                      );
                    }).toList(),
                  );
                }
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
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF1E3A8A), // 진한 네이비 블루
            Color(0xFF1565C0), // 미디엄 블루
          ],
        ),
      ),
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
          const Divider(color: Color(0xFF3B82F6)),
          const SizedBox(height: 20),
          Text(
            '© 2025 Hyeongin Ju. All rights reserved.',
            style: TextStyle(
              color: Colors.white.withValues(alpha: 0.8),
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
