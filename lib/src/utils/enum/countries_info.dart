enum CountriesInfo {
  russia,
  antarctica,
  canada,
  china,
  unitedStates,
  brazil,
  australia,
  india,
}

extension CountriesInfoExt on CountriesInfo {
  String value() {
    switch (this) {
      case CountriesInfo.russia:
        return 'Russia';
      case CountriesInfo.antarctica:
        return 'Antarctica';
      case CountriesInfo.canada:
        return 'Canada';
      case CountriesInfo.china:
        return 'China';
      case CountriesInfo.unitedStates:
        return 'United States';
      case CountriesInfo.brazil:
        return 'Brazil';
      case CountriesInfo.australia:
        return 'Australia';
      case CountriesInfo.india:
        return 'India';

      default:
        return "N/A";
    }
  }

  bool selectedCountry(CountriesInfo value) {
    return value == this ? true : false;
  }
}
