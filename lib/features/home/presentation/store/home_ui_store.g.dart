// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_ui_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeUiStore on _HomeUiStoreBase, Store {
  Computed<Widget>? _$servicePageComputed;

  @override
  Widget get servicePage =>
      (_$servicePageComputed ??= Computed<Widget>(() => super.servicePage,
              name: '_HomeUiStoreBase.servicePage'))
          .value;
  Computed<bool>? _$isHandsetComputed;

  @override
  bool get isHandset =>
      (_$isHandsetComputed ??= Computed<bool>(() => super.isHandset,
              name: '_HomeUiStoreBase.isHandset'))
          .value;

  late final _$localeAtom =
      Atom(name: '_HomeUiStoreBase.locale', context: context);

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  late final _$selectedServiceAtom =
      Atom(name: '_HomeUiStoreBase.selectedService', context: context);

  @override
  HomeServiceType? get selectedService {
    _$selectedServiceAtom.reportRead();
    return super.selectedService;
  }

  @override
  set selectedService(HomeServiceType? value) {
    _$selectedServiceAtom.reportWrite(value, super.selectedService, () {
      super.selectedService = value;
    });
  }

  late final _$_HomeUiStoreBaseActionController =
      ActionController(name: '_HomeUiStoreBase', context: context);

  @override
  void setLocale(Locale locale) {
    final _$actionInfo = _$_HomeUiStoreBaseActionController.startAction(
        name: '_HomeUiStoreBase.setLocale');
    try {
      return super.setLocale(locale);
    } finally {
      _$_HomeUiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedService(HomeServiceType? service) {
    final _$actionInfo = _$_HomeUiStoreBaseActionController.startAction(
        name: '_HomeUiStoreBase.setSelectedService');
    try {
      return super.setSelectedService(service);
    } finally {
      _$_HomeUiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
locale: ${locale},
selectedService: ${selectedService},
servicePage: ${servicePage},
isHandset: ${isHandset}
    ''';
  }
}
