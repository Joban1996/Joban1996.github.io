class PortfolioData {
  static const String name = 'Jobandeep Singh';
  static const String title = 'Flutter Developer';
  static const String experience = '5+ Years';

  static const String bio = """
I'm a passionate Flutter developer with 5+ years of experience building cross-platform apps. 
I specialize in creating beautiful, performant mobile applications with clean architecture.
I've built full-stack applications using FastAPI and MongoDB, and I'm experienced with CI/CD pipelines.
  """;

  static const List<String> skills = [
    'Flutter',
    'Dart',
    'FastAPI',
    'MongoDB',
    'GetX',
    'GitHub Actions',
    'REST APIs',
    'Firebase',
    'Socket.IO',
    'Stripe',
    'Git',
  ];

  static const List<Map<String, dynamic>> projects = [
    {
      'title': 'Humpday',
      'role': 'Flutter Developer',
      'description': 'A dating app where users can find a perfect match daily as per their requirements. Features include real-time chat with sockets, purchasing dates and events using in-app payment with Stripe, and daily push notifications for matches.',
      'tech': ['Flutter', 'Dart', 'Firebase', 'Socket.IO', 'Stripe', 'Mixpanel'],
      'platforms': ['iOS', 'Android'],
      'image': 'assets/images/name.jpeg',
      'github': '',
      'live': '',
    },
    {
      'title': 'Campus Closet',
      'role': 'Flutter Developer',
      'description': 'A student marketplace app designed to help students buy, sell, and exchange items within their campus community safely and conveniently.',
      'tech': ['Flutter', 'Dart', 'Firebase', 'REST APIs'],
      'platforms': ['iOS', 'Android'],
      'image': 'assets/images/campus_closet.jpeg',
      'github': '',
      'live': '',
    },
    {
      'title': 'Kinder Connect',
      'role': 'Flutter Developer',
      'description': "The ultimate app for connecting pre-nursery children with their preschool organizations. Designed for parents and teachers to make managing a child's preschool experience easier than ever.",
      'tech': ['Flutter', 'Dart', 'Firebase', 'Push Notifications'],
      'platforms': ['iOS', 'Android'],
      'image': 'assets/images/kinder_connect.png',
      'github': '',
      'live': '',
    },
    {
      'title': 'Property Listing App',
      'role': 'Full-Stack Developer',
      'description': 'Full-stack property listing app with image upload, search, filter, deep linking, and CI/CD pipeline. Backend built with FastAPI and MongoDB Atlas.',
      'tech': ['Flutter', 'FastAPI', 'MongoDB', 'GetX', 'GitHub Actions'],
      'platforms': ['Web', 'iOS', 'Android'],
      'image': 'assets/images/prop_dashboard.png',
      'github': 'https://github.com/jobandeep/property_app',
      'live': 'https://property-app.netlify.app',
    },
  ];

  static const List<Map<String, String>> socialLinks = [
    {'icon': 'assets/icons/mail.svg', 'url': 'mailto:your.email@gmail.com'},
    {'icon': 'assets/icons/github.svg', 'url': 'https://github.com/jobandeep'},
    {'icon': 'assets/icons/linkedIn.svg', 'url': 'https://linkedin.com/in/jobandeep'},
  ];
}