class Routes {
  String currentRoute(String? route) {
    switch (route) {
      case '/':
        return 'Notes';
        break;
      case '/create':
        return 'Create Note';
        break;
      case '/view_edit':
        return 'Edit Note';
        break;
      default:
        return '';
        break;
    }
  }

  bool isHome(String? route){
    return route == '/' ? true : false;
  }
}