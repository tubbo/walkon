# Walkon

Walkon plays your entrance music. It's a daemon process that
periodically checks `hcitool scan` for new Bluetooth devices, then uses
their ESSIDs to find tracks to play as they enter the network.

### Status: Alpha

This is definitely not ready for prime-time use. Don't complain to me if
it breaks.

## Installation

Walkon requires the following components to have already been installed:

- [Ubuntu][ubu] (for best results, but any Linux that supports BlueZ will do)
- [Ruby][rb] 2.x or above
- [BlueZ][bz], the official Linux Bluetooth protocol stack
- [XMMS][xm], a command-line audio player for Linux

Install the gem from RubyGems:

```bash
$ gem install walkon
```

You must also connect speakers to your machine's soundcard output in
order to actually hear tracks...

## Usage

Place an MP3 in `/music` that corresponds with your device's ESSID.
So, if your device's name is "iPhone5", you would upload a track like
so (from your own machine):

```bash
$ scp your-track.mp3 walkon:/music/iPhone5.mp3
```

Then, run the daemon process to sniff for that ESS ID and play the track
when it first becomes available (on the host machine):

```bash
$ walkon
```

To find out more about how it works, read the [Documentation][docs].

## Contributing

1. Fork this project
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Commit your tests (`git commit -am "I'm a good boy because I test my code"`)
5. Push to the branch (`git push origin my-new-feature`) and create Pull Request.

[docs]: http://rdoc.info/github/tubbo/walkon
[ubu]: http://ubuntu.com
[rb]: http://ruby-lang.org
[bz]: http://www.bluez.org/
[xm]: http://www.xmms.org/
