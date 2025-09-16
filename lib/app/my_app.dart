

import 'package:get/get_navigation/src/root/get_material_app.dart';
import '../utils/Routes/Routes.dart';
import '../utils/app_imports/app_imports.dart';
import '../utils/constants/storage_constant.dart';
import '../utils/custom_widget/my_color.dart';
import '../utils/localization/localization_controller.dart';
import '../utils/localization/localization_model.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void dispose() {
    // TODO: implement dispose
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    langController.changeLanguage(lang.toString(), country.toString());

    super.initState();
  }

  var country = 'US';
  var lang = 'en';
  @override
  Widget build(BuildContext context) {
    debugPrint('build- MyApp');
    // ToastContext().init(context);
    return AppAnnotatedRegionWidget(
      child: GetMaterialApp(
        useInheritedMediaQuery: false,
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        translations: LocalizationModel(),
        fallbackLocale: Locale(country.toString(), lang.toString()),
        getPages: Routes.routes,
        title: 'Imperialtv',
        themeMode: ThemeMode.system,
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: MyColor.colorYellow,
        ),
        darkTheme: ThemeData.light(),
      ),
    );
  }
}

// - Keyboard hide by tapping
class AppAnnotatedRegionWidget extends StatelessWidget {
  const AppAnnotatedRegionWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarDividerColor: Colors.transparent,
          systemNavigationBarIconBrightness: Brightness.light,
          systemNavigationBarContrastEnforced: true,
        ),
        child: child,
      ),
    );
  }
}
