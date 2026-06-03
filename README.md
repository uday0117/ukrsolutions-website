# UKR Solutions Website

A modern, production-ready Flutter Web company website showcasing UKR Solutions as a software company building mobile apps, AI tools, and digital products.

## 🚀 Features

- **Modern Design**: Premium SaaS-style design with Material 3
- **Dark Theme**: Professional dark theme with gradient accents
- **Fully Responsive**: Optimized for Desktop, Tablet, and Mobile devices
- **Smooth Navigation**: go_router integration with fade transitions
- **Animated UI**: Hero section with smooth animations
- **Interactive Elements**: Hover effects and smooth interactions
- **Contact Form**: Integrated contact form with email functionality

## 📱 Pages

1. **Home Page** (`/`)
   - Hero section with company branding
   - About section showcasing services
   - Call-to-action buttons

2. **Apps Page** (`/apps`)
   - Display of company applications
   - DocFlow - PDF Tools & Editor
   - ResumeBee - AI Resume Builder
   - Expandable for future apps

3. **Privacy Policy** (`/privacy`)
   - Comprehensive privacy policy
   - GDPR-compliant information

4. **Terms & Conditions** (`/terms`)
   - Legal terms and conditions
   - User agreements

5. **Contact Page** (`/contact`)
   - Contact information
   - Interactive contact form
   - Email integration

## 🛠️ Tech Stack

- **Flutter Web** - Cross-platform web framework
- **Material 3** - Modern Material Design
- **go_router** (^14.0.0) - Declarative routing
- **url_launcher** (^6.3.1) - URL and email launching

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point
├── routes/
│   └── app_router.dart         # Routing configuration
├── pages/
│   ├── home_page.dart          # Home page
│   ├── apps_page.dart          # Apps showcase
│   ├── privacy_page.dart       # Privacy policy
│   ├── terms_page.dart         # Terms & conditions
│   └── contact_page.dart       # Contact page
├── widgets/
│   ├── navbar.dart             # Navigation bar
│   ├── footer.dart             # Footer
│   ├── hero_section.dart       # Hero section
│   ├── about_section.dart      # About/services section
│   └── app_card.dart          # App card component
└── theme/
    └── app_theme.dart          # Theme configuration
```

## 🎨 Design Features

### Color Scheme
- Primary: Indigo (#6366F1)
- Secondary: Purple (#8B5CF6)
- Tertiary: Cyan (#06B6D4)
- Surface: Dark Blue-Gray (#0F172A, #1E293B)
- Background: Deep Navy (#020617)

### UI Elements
- Glassmorphism effects
- Gradient backgrounds
- Smooth hover animations
- Card-based layouts
- Responsive typography

## 🚦 Getting Started

### Prerequisites
- Flutter SDK (^3.10.4)
- Web browser (Chrome recommended)

### Installation

1. Navigate to the project directory:
```bash
cd ukr_solutions_website
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run -d chrome
```

### Build for Production

```bash
flutter build web --release
```

The production build will be available in the `build/web` directory.

## 🧪 Testing

Run tests:
```bash
flutter test
```

Run analyzer:
```bash
flutter analyze
```

## 📝 Configuration

### Adding New Apps

To add a new app to the Apps page, edit `lib/pages/apps_page.dart` and add a new `AppCardWidget`:

```dart
AppCardWidget(
  appName: 'Your App Name',
  description: 'App description',
  icon: Icons.your_icon,
  playStoreUrl: 'https://play.google.com/store/apps/details?id=your.app',
  primaryColor: const Color(0xFF6366F1),
  secondaryColor: const Color(0xFF8B5CF6),
)
```

### Updating Contact Information

Edit the contact details in:
- `lib/widgets/footer.dart`
- `lib/pages/contact_page.dart`

## 🌐 Deployment

### Firebase Hosting
```bash
firebase init hosting
flutter build web --release
firebase deploy
```

### Netlify
1. Build: `flutter build web --release`
2. Publish directory: `build/web`

### Vercel
1. Build Command: `flutter build web --release`
2. Output Directory: `build/web`

## 📧 Contact

- **Email**: apps.uksolutions@gmail.com
- **Website**: ukrsolutions.in

## 📄 License

© 2026 UKR Solutions. All rights reserved.

## 🎯 Roadmap

- [ ] Add blog section
- [ ] Integrate analytics
- [ ] Add more interactive animations
- [ ] Implement dark/light theme toggle
- [ ] Add multi-language support
- [ ] SEO optimization

## 🤝 Contributing

This is a private company website. For inquiries, please contact us via email.

---

Built with ❤️ using Flutter

