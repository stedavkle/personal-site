---
title: Personal Website - Jacob Strieb Projects
author: Jacob Strieb
date: July 13, 2019
description: Personal website designed by hand in `HTML`, `CSS`, and `Javascript`, and compiled from `markdown` using a custom `bash` script.
...

# Personal Website

- Home page: [jstrieb.github.io](https://jstrieb.github.io)
- Site generation code: [github.com](http://github.com/jstrieb/personal-site)

## History

Maintaining an Internet presence is important, and having a personal website
allows me to do it my own way. As the Internet becomes an increasingly integral
component of modern society, controlling my own space for self-expression feels
like a rite of passage for exploring and sharing important ideas. Additionally,
publishing on my own platform is an opportunity to exercise my opposition to
centralized social media organizations' near-monopoly on Internet-based
self-expression.

But having a personal website is also a matter of tradition: I made my first
websites when I was in second grade, after my family upgraded from dial-up to
broadband Internet. At the time, my little sister played with Barbie dolls,
even though all of my friends agreed that "Barbies stink." She continued to
disagree, so I took my case to the Web[^1], surprised that the issue was not
already being discussed.

Not understanding how to create a site from scratch, I was relegated to using
drag-and-drop creators, but quickly became frustrated that they couldn't do
exactly what I wanted. In my search for the perfect website creator, I made at
least 6 sister "barbiesstink" sites on a variety of hosting platforms.

Ever since then, my history of website creation has been closely related to a
history of frustration with tooling: I have never been able to achieve my
desired balance between ease of publication and control over low-level details
and layout, until now. After 10 long years, this project has solved my problem.


## Static Site Generator

Discovering the static website generator [Hugo](http://gohugo.io) changed my
understanding of what publication on the web could be like. Writing pages in
`markdown` that were then converted to `HTML` styled with custom themes seemed
to strike the ideal balance between ease of creation and opportunity for
customization. But none of the themes I could find online satisfied me.

Still set on using Hugo, I read about what I would have to do to create my own
theme. After a few frustrated minutes spent struggling with the documentation,
I decided instead to build my own static site generation script.

- Used to use static generators like Hugo
  - Overkill
  - Lack of flexibility with themes and stuff
- Originally tried using `make`
  - Ended up being more of a hindrance to the `bash` commands than a help
- Script steps
  - Find markdown files to convert
  - Convert them (preserving directory structure) using `pandoc`
  - Copy additional resources


## Theme

- Wanted classic hacker look
- Wanted simple, clear
- Wanted it to work well with `links` text-based browser
  - Use text-based Linux (single-user mode) daily, needed site to work there
- Designed with URL Pages

[^1]: The last surviving barbiesstink site can be found
  [here](https://barbiesstink.webnode.com). It's still up after more than a
  decade, and it looks exactly as I remember it. I have not been able to find
  archived versions of the others.
