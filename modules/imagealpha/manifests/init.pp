# Install ImageAlpha
#
# To use:
#   include imagealpha
class imagealpha {
  package { 'ImageAlpha':
    provider => 'compressed_app',
    source   => 'http://pngmini.com/ImageAlpha1.3.5.tar.bz2',
    flavor   => 'tbz'
  }
}
