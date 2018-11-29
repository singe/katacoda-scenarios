By default wireless interfaces are configured to only listen for traffic destined for them (either directly or broadcast). However, on many wireless cards, you can enable "monitor mode" to turn them into passive listening devices that will show *all* wireless traffic on the frequency (aka channel) they are tuned to.

## Enabling Monitor Mode with iw

You can check what mode (called the `type`) your device is in with the command:
`iw dev wlan0 info`{{execute}}

You should see a line saying:
`type managed`
This means your device is currently configured to behave like a normal wireless device, and *is not* in monitor mode.

You can put the device into monitor mode with the command:
`iw dev wlan0 set type monitor`{{execute}}

And check that it was successfull, by rerunning:
`iw dev wlan0 info`{{execute}}
and noticing a line saying:
`type monitor`

You could switch back to managed mode with `iw dev wlan0 set type managed` but hold off on that for now.

## Enabling Monitor Mode with airmon-ng

The aircrack-ng suite also has a tool for turning monitor mode on and off called `airmon-ng`. You can see a list of wireless devices with the command:
`airmon-ng`{{execute}}

Since we already had wlan0 in monitor mode, let's use `airmon-ng` to switch it back to managed mode:
`airmon-ng stop wlan0`{{execute}}

We can re-enable monitor mode with:
`airmon-ng start wlan0`{{execute}}

When you run this, you'll see output similar to:
`(monitor mode enabled on mon0)`
This indicates that it has created a duplicate device of `wlan0` called `mon0`. `mon0` is in monitor mode and `wlan0` is in managed mode. This can be confusing, and isn't consistent across platforms. Depending on your Linux version `airmon-ng` might rename your device e.g. `wlan0` becomes `wlan0mon`, or create a duplicate device. Remember, it's still the same hardware, so don't try use `wlan0` to connect to a network then wonder why your monitor mode isn't working well.

`airmon-ng` has a slew of other features. More information on airmon is avilable from the [aircrack-ng wiki for airmon-ng](http://www.aircrack-ng.org/doku.php?id=airmon-ng)

## Next Step

To proceed to the next step, you should have at least one wireless interface set to monitor mode.
