import 'package:flutter/cupertino.dart';
import 'package:flutter_app/consts/_list/Model/product_error.dart';
import 'package:flutter_app/consts/_list/Model/profiles_model.dart';
import 'package:flutter_app/consts/_list/repo/api_status.dart';
import 'package:flutter_app/consts/_list/repo/profile_UpLoad_services.dart';
import 'package:flutter_app/consts/_list/repo/profile_services.dart';

class ProfileViewModel with ChangeNotifier {
  bool _loading = false;
  ProfileModel? _profileListModel;
  Error? _error;

  bool get loading => _loading;
  ProfileModel get profileList => _profileListModel!;
  Error get productError => _error!;

  setLoading(bool loading) {
    _loading = loading;
    notifyListeners();
  }

  setProflileListModel(ProfileModel profileListModel) async {
    _profileListModel = profileListModel;
  }

  setProfileError(Error error) {
    _error = error;
  }

  getProflile(String? userId) async {
    setLoading(true);

    var response = await ProfileServices.fetchProfile(userId!);

    if (response is Success) {
      setProflileListModel(response.response as ProfileModel);
    }
    if (response is Failure) {
      Error productError =
          Error(code: response.code, message: response.errorResponse);

      setProfileError(productError);
    }

    setLoading(false);
  }

  postProfileUpLoad(var data) async {
    setLoading(true);
    var response = await ProfileUpLoadService.postProfile(data);

    if (response is Success) {
      setProflileListModel(response.response as ProfileModel);
    }
    if (response is Failure) {
      Error productError =
          Error(code: response.code, message: response.errorResponse);

      setProfileError(productError);
    }
    setLoading(false);
  }
}
