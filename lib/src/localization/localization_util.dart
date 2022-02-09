import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../config/routes/coordinator.dart';

class S {
  static get delegate => AppLocalizations.delegate;
  static AppLocalizations of(BuildContext context) {
    return AppLocalizations.of(context)!;
  }

  static AppLocalizations get text {
    return AppLocalizations.of(XCoordinator.context)!;
  }
}
