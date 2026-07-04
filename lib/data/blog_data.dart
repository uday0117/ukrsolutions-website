class BlogArticle {
  final String slug;
  final String title;
  final String summary;
  final String date;
  final String readTime;
  final List<String> paragraphs;

  const BlogArticle({
    required this.slug,
    required this.title,
    required this.summary,
    required this.date,
    required this.readTime,
    required this.paragraphs,
  });
}

class BlogData {
  static const articles = <BlogArticle>[
    BlogArticle(
      slug: 'why-flutter-for-startups',
      title: 'Why Flutter Is the Best Choice for Indie App Developers',
      summary:
          'A practical look at how Flutter helps solo developers ship Android and iOS apps from one codebase without sacrificing quality.',
      date: '2026-03-15',
      readTime: '6 min read',
      paragraphs: [
        'When you are building apps as a solo developer or a small studio, every hour counts. Flutter lets you write one Dart codebase and deploy to Android, iOS, Web, and Desktop. That means you fix a bug once instead of maintaining two separate native codebases.',
        'Performance is often the first concern people raise. In practice, Flutter compiles to native ARM code on mobile and uses Skia for rendering. For the kinds of apps I build — finance trackers, calculators, note apps, and health tools — users cannot tell the difference from fully native apps.',
        'The widget system encourages composable UI. You build small, reusable pieces and assemble screens quickly. Material Design 3 support is built in, so you get polished components without hunting for third-party libraries.',
        'The ecosystem has matured significantly. Packages on pub.dev cover Firebase integration, local storage (Hive, SQLite), charts, PDF generation, Bluetooth, and more. For an indie publisher publishing multiple apps on Google Play, this ecosystem dramatically reduces time-to-market.',
        'My recommendation: if you are starting a new consumer app in 2026 and need both Android and iOS, Flutter remains the most efficient path. Focus your energy on solving user problems, not on platform-specific UI code.',
      ],
    ),
    BlogArticle(
      slug: 'firebase-flutter-production-tips',
      title: 'Firebase + Flutter: Lessons from Shipping Production Apps',
      summary:
          'Authentication, Firestore rules, offline caching, and push notifications — patterns that work in real apps on the Play Store.',
      date: '2026-02-28',
      readTime: '8 min read',
      paragraphs: [
        'Firebase is the backbone of most apps I publish. Authentication handles email, Google Sign-In, and anonymous users. Firestore stores user data with real-time sync. Cloud Messaging delivers reminders and alerts.',
        'The biggest lesson from production: design your Firestore structure around how you query, not around how data looks on paper. Denormalize when it saves reads. Use subcollections for user-specific data so security rules stay simple.',
        'Security rules are not optional. Every collection should have rules that check auth.uid matches the document owner. Test rules with the Firebase emulator before deploying. A misconfigured rule can expose user data or block legitimate access.',
        'Offline support matters, especially in markets with inconsistent connectivity. Enable Firestore persistence and show clear UI states when the device is offline. Users should still be able to read cached data and queue writes.',
        'Push notifications need careful UX. Request permission at the moment the user understands the value — not on first launch. For period trackers and reminder apps, tie the permission prompt to enabling a specific feature the user just toggled on.',
        'Monitor Firebase usage in the console. Reads and writes add up across thousands of users. Use batched writes, pagination, and Cloud Functions for heavy operations instead of doing everything client-side.',
      ],
    ),
    BlogArticle(
      slug: 'play-store-aso-basics',
      title: 'Play Store ASO Basics for Flutter App Publishers',
      summary:
          'How to write store listings, choose keywords, and design screenshots that help your Flutter apps get discovered organically.',
      date: '2026-01-10',
      readTime: '5 min read',
      paragraphs: [
        'App Store Optimization (ASO) starts before you publish. Choose an app name that includes a searchable keyword but still reads naturally — for example, "TrackGold Pro - Gold Price Tracker" instead of a vague brand name alone.',
        'Your short description (80 characters) should state the core benefit immediately. The full description should repeat important keywords in context, list features as bullet points, and mention who the app is for.',
        'Screenshots sell the app. Show the three most important screens with short captions. Use a consistent brand color across all visuals. On Play Store, the first two screenshots appear in search results on some devices — make them count.',
        'Ratings and reviews compound over time. Add an in-app review prompt after a positive moment — when the user completes a calculation, saves a note, or hits a streak. Never prompt on first launch.',
        'Update regularly. Even minor updates signal active maintenance to Google Play and to users. Changelogs that mention user-requested fixes build trust. I aim for at least one update every 4–6 weeks across my app portfolio.',
      ],
    ),
  ];

  static BlogArticle? findBySlug(String slug) {
    for (final article in articles) {
      if (article.slug == slug) return article;
    }
    return null;
  }
}
