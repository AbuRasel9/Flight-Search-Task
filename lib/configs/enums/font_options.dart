enum FontOptions {
  montserrat,
  noToSerif,
  lato,
  opensans,
  poppins,
  proximaNova;

  String get key => switch (this) {
        FontOptions.montserrat => "Montserrat",
        FontOptions.noToSerif => "NotoSerif",
        FontOptions.lato => "Lato",
        FontOptions.opensans => "OpenSans",
        FontOptions.poppins => "Poppins",
        FontOptions.proximaNova => "Proxima Nova",
      };
}
