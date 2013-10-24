# Walkon

Walkon plays your entrance music. It's a daemon process that
periodically checks `hcitool scan` for new Bluetooth devices, then uses
their ESSIDs to find tracks to play as they leave or exit the network.

## Installation

Walkon is best used on a **Raspberry Pi** with **Ubuntu**.

Install it yourself:

    $ gem install walkon

Then run:

    $ walkon start

## Usage

Place an MP3 in `/music` that corresponds with your device's ESSID.
So, if your device's name is "iPhone5", you would upload a track like
so:

    $ scp your-track.mp3 walkon:/music/iPhone5.mp3

To find out more about how it works, read the [Documentation][docs].

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[docs]: http://rdoc.info/github/tubbo/walkon
