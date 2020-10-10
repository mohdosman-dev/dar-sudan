
import 'package:dar_sudan/models/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
//
List<SingleChildWidget> providers = [
  ...independentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider<ThemeModel>(
    create: (context) => ThemeModel(),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [
//  StreamProvider<User>(
//    builder: (context) => Provider.of<AuthenticationService>(context, listen: false).user,
//  )
];