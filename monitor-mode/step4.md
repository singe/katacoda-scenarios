Great, you've captured a handshake, now it's time to try crack the password.

## Some Theory

WPA2 makes use of a four-way handshake to negotiate a set of shared secret keys, without sending any of them over the air to be intercepted by an attacker.

There's a lot that happens in the four way handshake, you can read about the detail in the [CWSP study guide](https://books.google.com.au/books?id=0ZWLn57EdpsC&lpg=PP1&dq=CWSP&pg=PA200&hl=en#v=onepage&q&f=false) if you want more information. But essentially, you need a minimum of the first two messages in the handshake, but ideally at least the first three, giving you:

* The random data from the access point (anonce) contained in message one
* The random data from the client (snonce) contained in message two
* The hash of the random data from the client contained in message two (MIC)
* (Optional) The hash of the message sent back from the access point in message three (MIC)

The reason the fourth part is optional, is because with just the MIC from the client, we have enough to try to brute force the password. However, if the client attempted the wrong password, the MIC could be wrong. By seeing message 3, we know the client had the right message and can be sure we aren't wasting our time brute forcing.

## Checking For A Handshake

In the next step, we'll dive into the actual packets, but for now, the easiest way to check if you have enough to crack a handshake, is to make use of the `aircrack-ng` tool.

Make sure you've exited from `airodump-ng` before you do this next part.

The simplest way to check if you have enough of a handshake to attempt cracking is just to run `aircrack-ng` across all your capture files. If you type `ls`{{execute}} you should see one of more files ending with the extension `.cap`. If you ran the previous step as I suggested, you should see:

```
prac-01.cap  prac-01.csv  prac-01.kismet.csv  prac-01.kismet.netxml
```

`airodump-ng` generates several files by default when you specify the `-w` switch. We want to look at the packet capture file `prac-01.cap`. Just to be safe, I'm going to suggest you look at all `.cap` files with:
`aircrack-ng *.cap`{{execute}}

You should see something similar to this:

```
Opening prac-01.cap
Read 457 packets.

   #  BSSID              ESSID                     Encryption

   1  00:0C:41:82:B2:55  Coherer                   WPA (1 handshake)
   2  98:D3:04:64:FA:55  Foo                       WPA (0 handshake)

Index number of target network ?
```

It looks like we do have a handshake captured for the `Coherer` network and can proceed. Hit <kbd>Ctrl</kbd>+<kbd>c</kbd> to exit.

## Cracking The Password

To crack the password, we need to brute force it, by completing the same cryptographic steps the access point and client would have, but with different passwords. The IEEE thought of this attack, and so it's typically a slow process, which is why tools like [hashcat](https://hashcat.net/wiki/doku.php?id=cracking_wpawpa2) can make it a bit faster using your GPU.

To crack the password, we'll need a wordlist. As WPA/2 passwords need to be between 8-64 characters, make sure your wordlist doesn't include passwords less than 8 characters.

I've provided one for you at `/usr/share/dict/wordlist`. You can use it by passing `aircrack-ng` the `-w /usr/share/dict/wordlist` switch like this:
`aircrack-ng -w /usr/share/dict/wordlist *.cap`{{execute}}

When prompted press the number corresponding to the `Coherer` network, and wait for `aircrack-ng` to finish cracking the key. You'll know you found it when you see:
`KEY FOUND! [ thepassword ]` on your screen. Note "thepassword" is just an example here.

## Next Step

Were you able to get the password? If so, write it to a file called `password` to proceed to the next step. For example:
`echo thepassword > password`{{execute}}

You'll need to change `thepassword` in that command to the actual password you retrieved.
