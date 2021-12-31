---
title: "2021 Year's End Status Update"
date: 2022-01-01T00:00:00
draft: false
---
Hello all!
This is my first ever status update so I've ambitiously decided to cover all of 2021.
In the future I intend to write these updates on a monthly basis and provide a bit more detail.
Since so much has happened in the past year I'll be leaving out a lot, but here are some of the highlights.

In January I spent most of my time on [river](https://github.com/riverwm/river),
fixing bugs and implementing an experimental [river-options protocol](https://github.com/riverwm/river/pull/202).

[FOSDEM 2021](https://archive.fosdem.org/2021/) took place online during first weekend of February and
I gave a [talk](https://archive.fosdem.org/2021/schedule/event/zig_wayland/) on my type safe [Zig](https://ziglang.org) bindings for wlroots/libwayland.
Around the same time I got sucked into Andrew Kelley's work applying data oriented design principles to Zig's Abstract Syntax Tree.
I collaborated with him on the data structure that became [std.MultiArrayList](https://zig.news/kristoff/struct-of-arrays-soa-in-zig-easy-in-userland-40m0)
and contributed a significant amount of code to his [PR branch](https://github.com/ziglang/zig/pull/7920).
Andrew gave a [talk](https://media.handmade-seattle.com/practical-data-oriented-design/) on this subject at Handmade Seattle later on in November which I highly recommend checking out if you haven't seen it yet.

In March I joined the team working on [TigerBeetle](https://www.tigerbeetle.com) and got paid to write Zig code for the first time.
I also contributed to Andrew's further application of data oriented design to the [ZIR memory layout](https://github.com/ziglang/zig/pull/8266).

In April my stalwart collaborator [Leon Plickat](https://leon_plickat.srht.site) and I finally got the [river-layout protocol](https://github.com/riverwm/river/pull/112) merged to master branch.
We'd been discussing and working on this off and on for ~6 months at that point so it was really great to get it merged and start daily driving it.
As is normal with such large changes, there were still some rough edges to be smoothed out and I [bumped the protocol to version 2 and removed the river-options protocol](https://github.com/riverwm/river/pull/274) shortly afterwards.

One of the critical missing features for river at this point in time was damage tracking support to improve performance and save battery life.
To remedy this I [implementated](https://github.com/riverwm/river/pull/296) basic yes/no damage tracking in May.

[Zig 0.8.0](https://ziglang.org/download/0.8.0/release-notes.html) was released in the first week of June, which included several improvements I made to Zig's handling of linking libc.
These improvements directly affected users building river, solving a few long-standing issues on that front.
Around this time I also started to think about a first river release and resumed my effort to [properly package zig software for void linux](https://github.com/void-linux/void-packages/pull/29288).
This lead to a series of zig patches to allow for cross compilation while linking system libraries and integration into void linux's build system.

In July I focused on stabilizing and simplifying river's behavior, aiming for consistency and predictability.
As part of this, I [further simplified our layout protocol](https://github.com/riverwm/river/pull/359) and cleaned up all of river's user-facing interfaces.
The goal was to get a first release out the door, but unfortunately exams got in the way.

Throughout August and September I had relatively little time for my open source work as I was busy with exams at my university.
I did however manage to keep up with bug reports from river's small but steadily growing number of users fairly well.
In retrospect, it was nice to allow bug reports to trickle in for another couple months before tagging the first release as the end result was much more polished.

I ended up changing domains for my personal website and email from ifreund.xyz to isaacfreund.com after reading [this post](https://www.spotvirtual.com/blog/the-perils-of-an-xyz-domain/) in October.
It makes me sad that this is the way things are, but I'd rather die on a different hill.
I set up [GitHub Sponsors](https://github.com/sponsors/ifreund) and [Liberapay](https://liberapay.com/ifreund) around this time and was pleasantly surprised to immediately see some support.
Thank you to all my current sponsors, you helping make my open source work sustainable in the long term.

On the river front, I spent October fixing every bug I could and finally tagged the [river 0.1.0 release](https://github.com/riverwm/river/releases/tag/v0.1.0) on November 2nd.
If you haven't yet seen my [blog post introducing river](https://isaacfreund.com/blog/river-intro) you may want to check that out.
Later in November my focus shifted to helping push the new wlroots scene graph API forward, [getting tinywl using it](https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3250)
as well as [other](https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3398) [improvements](https://gitlab.freedesktop.org/wlroots/wlroots/-/merge_requests/3403).

This wlroots work carried on into December, when [wlroots 0.15.0](https://gitlab.freedesktop.org/wlroots/wlroots/-/releases/0.15.0) was released.
As it so happened, [Zig 0.9.0](https://ziglang.org/download/0.9.0/release-notes.html) was released only a few days later.
Thus, [river 0.1.1](https://github.com/riverwm/river/releases/tag/v0.1.1) and [river 0.1.2](https://github.com/riverwm/river/releases/tag/v0.1.2) were released in quick succession,
fixing several bugs and updating the wlroots and Zig version requirements.

I also ended up starting and finishing a tiny new project in December, [dumb_runtime_dir](https://github.com/ifreund/dumb_runtime_dir),
to replace my older, more complex [rundird](https://github.com/ifreund/rundird) project.
This is useful on systems that do not run logind, opting for a simpler alternative such as [seatd](https://sr.ht/~kennylevinsen/seatd) instead.

2021 was an action packed year for me, I'm very happy looking back on the progress I've made on river and the surrounding open source ecosystem.
Here's to another year of work towards building my ideal linux graphical environment in 2022!
