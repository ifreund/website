---
title: "Introducing River, a Dynamic Tiling Wayland Compositor"
date: 2021-11-03T00:00:00+02:00
draft: false
---
In the spring of 2020 I found myself hooked on Wayland thanks to
[sway](https://swaywm.org/) but increasingly frustrated with the
[i3](https://i3wm.org/) style window management sway implements.
I tried several of the other more mature Wayland compositors
including [hikari](https://hub.darcs.net/raichoo/hikari) and
[Wayfire](https://wayfire.org) but didn't enjoy them any more
than sway. I wanted dynamic tiling window management similar to
[dwm](https://dwm.suckless.org/) but on Wayland and without dwm's configuration
through patching the source code approach.

As I had a newfound abundance of free time at home in front of
my computer thanks to the global pandemic that was ramping up
that spring, I decided to write my own Wayland compositor. Thus,
[river](https://github.com/riverwm/river) was born.

## Features

The core guiding principle in river's design is that its behavior should
be predictable. This means keeping things as simple as possible, reducing
implicit state the user must keep in their head while using river.

River's window management is based on a linear stack of windows much like
dwm. These windows are arranged by a separate program called a layout
generator. Users are encouraged to write and share their own layout
generators, they are simply Wayland clients which implement a custom
river-layout-v3 protocol. You can find links to several nice ones on this
[wiki page](https://github.com/riverwm/river/wiki/Community-Layouts). River
also ships with a layout generator, rivertile, that provides a few simple
layouts for those who don't need anything custom or fancy.

Instead of traditional workspaces, river supports tags. Each window may be
assigned one or more tags and multiple tags may be displayed at once. Again,
this behavior is strongly influenced by dwm.

All configuration and control of river happens at runtime through the riverctl
tool. It can be used to create keybindings, move focus between windows,
set the border color, etc. River doesn't have any traditional configuration
file, instead it runs an arbitrary executable on startup which is generally
a shell script invoking riverctl to setup the user's desired configuration.

## River 0.1.0

I've been using river as my daily driver for well over a year now, and am
happy to announce the first release today, river 0.1.0. In recent months
there has been little churn in river's codebase and it is currently quite
stable and bug free. Because of this, people seem to have started using it.
As I plan to cause a lot more churn on the master branch in the near future
which will inevitably create new bugs and break people's configuration,
this is the perfect time for a release.

I'd like to thank everyone who has contributed code, documentation
and bug reports to river. In particular, thanks to [Leon Henrik
Plickat](https://leon_plickat.srht.site/) for his consistent, high quality
collaboration since the early days of the project. Without all of you this
release would not have been possible.

## The Future of River

Although I consider river useful enough today to tag a first release, it
is not yet complete. The core functionality and standard use cases are well
supported but river is not yet nearly as flexible as I would like it to be.
I have several ideas that I plan to try out to improve river's flexibility
and ease of customization, but this will take time. For this reason,
users should expect widely breaking changes to how river is configured
and controlled before we approach a stable 1.0 release. Fear not though,
the core functionality and spirit of river are here to stay!

If you'd like to contribute financially to my work on river, please consider
sponsoring me on [GitHub Sponsors](https://github.com/sponsors/ifreund)
or [Liberapay](https://liberapay.com/ifreund). To those already donating,
thank you so much for your support!
