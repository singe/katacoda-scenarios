In this training, your course notes are on the left, and your terminal, where you can type commands is on the right. You'll see some commands listed in the training material, if you click on the ``{{execute}} button, it will get automatically typed and executed for you. But I'd recommend you type it out as practise if you're new to this.

## Explore The Environment

The environment has a (virtual) wifi card already plugged in. You can see all network interfaces by running `ip link show`{{execute}}.

There you will see `wlan0` listed as an adapter.

Alternativley, you can run `iw dev`{{execute}} to just list wireless network interfaces.

Since we're going to be doing some wifi hacking, we'll need the `aircrack-ng suite`. You can install this by running `apt-get install -y aircrack-ng`{{execute}}. You'll need to do this to progress to the next step.

## Next Step

Make sure you've installed `aircrack-ng` to progress to the next step.
