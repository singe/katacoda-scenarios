Great, you should now be able to start listening to and capturing traffic.

## airodump-ng

To do this, we're going to use a tool called `airodump-ng` also from the `aircrack-ng` suite of tools.

You can see what's happening nearby by simply running `airodump-ng` and giving it the name of the wireless interface you put into monitor mode e.g.:
`airodump-ng mon0`{{execute}}

## The Interface Explained

`airodump-ng`'s interface can be confusing at first, let's take a moment to go throught it. The screen is broken into three sections.

 * the top line consists of:
  * Your frequency aka channel, displayed as `CH 1`
  * How long you've been capturing for
  * The current date and time
  * If a WPA/2 handshake has been seen/captured and for which AP

 * the middle section lists nearby access points and consists of the following columns:
  * the unique hardware address of the access point (BSSID)
  * the signal strength of the last recieved frame
  * the number of beacons frames (used to sychronise a network) seen
  * the number of data frames
  * the data rate, expressed in data frames per second
  * the frequency of the network as a channel
  * the maximum rate MB
  * whether the network is encrypted or not and what kind OPN is no encryption
  * the type of encryption aka cipher
  * the type of authentication e.g. pre-shared key (PSK) or EAP (MGT)
  * the name of the network the AP belongs to i.e. it's SSID

 * the bottom section lists nearby clients (aka stations) and consists of the following columns:
  * the AP the station is associated to (as a BSSID) or (not associated) if none
  * the MAC address of the stations
  * the signal strength of the station
  * the last data rate from the AP to STA and STA to AP respectivley
  * are we missing frames from the client and how many
  * how many frames have we seen from the client
  * what network names have we seen the client probe for

This and much more is explained in greater detail on the [aircrack-ng wiki for airodump-ng](http://www.aircrack-ng.org/doku.php?id=airodump-ng).

You should be seeing some wireless activity. As you're using a virtualised cloud environment, and there isn't really a physical wireless device, the wifi activity you're seeing is simulated using a technique developed by [SensePost](https://sensepost.com).

Look for a network named `Coherer` and make a note of what channel it is on.

## Zooming In On A Network

Wireless networks can run on one or more of several frequencies. These are defined as channels. 2.4GHz WiFi networks run on channels 1-14 and 5GHz WiFi networks run on channels 36-64 and 100-165. These channels have different restrictions in different countries. We're just looking at 2.4GHz for now. By default your wifi card can listen to approximately 3 channels at a time, the channel it's on, and one above and below that channel. e.g. if you're on channel 6 you will see some activity from channels 5 and 7. 

However, as WiFi networks can be on one of many channels, by default `airodump-ng` will hop between channels. You'll notice this happening based on the changing number in the top left of your screen when running `airodump-ng`. This has the down side, that we may miss some activity that occurs while we're not listening to a specific channel.

Since we know what network we want to focus on, and what channel it's on (1), let's exit `airodump-ng` by pressing <kbd>Ctrl</kbd>+<kbd>c</kbd> and configure it for this.

We're going to pass two switches to `airodump-ng` the first `-c 1` will tell it to listen only on channel `1`, and the second `-w prac` will tell it to capture the observed traffic to a file called `prac-01.cap` (with the 01 getting incremented each time you rerun the command). Let's do that now:
`airodump-ng -c1 -wprac mon0`{{execute}}

## Time to Wait

Now we need to wait until we see a WPA/2 handshake. These happen when a station associates to a network. In a busy network this will happen naturally and people connect to the network. However, in some cases you may need to forcefully "deauthenticate" a user to capture a handshake when they reconnect. This is not covered here, but is detailed under the [aircrack-ng wiki on deauthentication attacks](http://www.aircrack-ng.org/~~v/doku.php?id=deauthentication).

You'll know you've captured at least one handshake, when you see the interface display `WPA Handshake: 00:0C:41:82:B2:55` in the top right of your screen. You'll need to have captured a handshake before you can move to the next step.
