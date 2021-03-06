{ stdenv, fetchurl, pkgs, pythonPackages }:

pythonPackages.buildPythonApplication rec {
  version = "0.7.0";
  name = "khal-${version}";

  src = fetchurl {
    url = "https://pypi.python.org/packages/source/k/khal/khal-${version}.tar.gz";
    sha256 = "00llxj7cv31mjsx0j6zxmyi9s1q20yvfkn025xcy8cv1ylfwic66";
  };

  propagatedBuildInputs = with pythonPackages; [
    atomicwrites
    click
    configobj
    dateutil
    icalendar
    lxml
    pkgs.vdirsyncer
    pytz
    pyxdg
    requests_toolbelt
    tzlocal
    urwid
    python.modules.sqlite3
    pkginfo
  ];

  meta = with stdenv.lib; {
    homepage = http://lostpackets.de/khal/;
    description = "CLI calendar application";
    license = licenses.mit;
    maintainers = with maintainers; [ matthiasbeyer jgeerds ];
  };
}
