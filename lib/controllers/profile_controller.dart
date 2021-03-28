
// View <===> Controller <===> Service

import 'package:flutter_free_commerce/models/profile_models.dart';
import 'package:flutter_free_commerce/services/profile_service.dart';

class ProfileController {
  ProfileService profileService = ProfileService();
  List<Profile> profiles = <Profile>[];

  getProducts() async {
    profiles = await profileService.getProducts();
  }
}