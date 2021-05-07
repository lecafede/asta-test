import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../models/model.dart';

class PackageController extends GetxController {
  var packages = List<Package>().obs;

  void add(Package n) {
    packages.add(n);
  }

  @override
  void onInit() {
    List storedPackages = GetStorage().read<List>('notes');
    if (!storedPackages.isNull) {
      packages = storedPackages.map((e) => Package.fromJson(e)).toList().obs;
    }
    ever(packages, (_) {
      GetStorage().write('notes', packages.toList());
    });
    super.onInit();
  }
}
