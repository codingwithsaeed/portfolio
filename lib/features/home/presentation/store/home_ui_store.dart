// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_ui/flutter_adaptive_ui.dart';
import 'package:mobx/mobx.dart';
import 'package:portfolio/features/home/domain/entities/home_service_model.dart';
import 'package:portfolio/features/home/presentation/ui/home_screen.dart';
part 'home_ui_store.g.dart';

class HomeUiStore = _HomeUiStoreBase with _$HomeUiStore;

abstract class _HomeUiStoreBase with Store {
  final BuildContext buildContext;
  _HomeUiStoreBase(this.buildContext);

  @observable
  HomeServiceType? selectedService;
  @action
  void setSelectedService(HomeServiceType? service) => selectedService = service;

  @computed
  Widget get servicePage {
    return selectedService == null ? const CenterDesktopImage() : selectedService!.screen;
  }

  @computed
  bool get isHandset => Screen.fromContext(buildContext).isHandset;
}
