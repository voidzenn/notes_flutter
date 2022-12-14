class Routes {
  String currentRoute(String? route) {
    switch (route) {
      case '/':
        return 'Notes';
        break;
      case '/create':
        return 'Create Note';
        break;
      default:
        return '';
    }
  }

  bool isHome(String? route){
    return route == '/' ? true : false;
  }
}