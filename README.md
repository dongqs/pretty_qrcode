# PrettyQrcode

generate prtty qrcode

![generated pretty qrcode example](https://raw.githubusercontent.com/dongqs/pretty_qrcode/master/example.jpg)

## Is it good?

Yes

## Requirements

ImageMagicky

    http://www.imagemagick.org/

install on Mac OS

    brew install ImageMagick

install on Ubuntu

    sudo apt-get install imagemagick libmagickwand-dev

## Installation

Add this line to your application's Gemfile:

    gem install 'pretty_qrcode'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pretty_qrcode

## Usage

default version is 4, which is not enough for a url like 'https://github.com/dongqs/pretty_qrcode'. In this case, try a bigger version like 5 or 6.

    $ pretty_qrcode input.jpg output.jpg 'hello world' [version] [correction_level]

## References

This program is a simplified implementation based on

    http://cgv.cs.nthu.edu.tw/Projects/Recreational_Graphics/Halftone_QRCodes/

## Contributing

1. Fork it ( https://github.com/[my-github-username]/pretty_qrcode/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
