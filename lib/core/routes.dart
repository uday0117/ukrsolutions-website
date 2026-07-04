class Routes {
  static const home = '/';
  static const apps = '/apps';
  static const about = '/about';
  static const blog = '/blog';
  static const contact = '/contact';
  static const privacy = '/privacy';
  static const terms = '/terms';

  static String blogArticle(String slug) => '/blog/$slug';
}
