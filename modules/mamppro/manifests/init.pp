# Install MAMP Pro (note: this is the pro version)
#
# To use:
#   include mampPro
class mamppro {
  package { 'MAMPPro':
    provider => 'pkgdmg',
    source   => 'http://downloads10.mamp.info/MAMP-PRO/releases/3.0.7.3/MAMP_MAMP_PRO_3.0.7.3.pkg'
  }
}
