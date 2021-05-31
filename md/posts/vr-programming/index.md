---
title: A Reflection on Programming in Virtual Reality
author: Jacob Strieb
date: May 30, 2021
description: Setting up a distraction-free, virtual reality programming environment using a borrowed Oculus Go
...

# A Reflection on Programming in Virtual Reality

By [Jacob Strieb](https://jstrieb.github.io)

Published on [May 30, 2021](/posts/vr-programming/)

---

# Background

Since I began college, I have struggled with staying focused while working in
shared spaces.^[This situation is practically unavoidable in a university
setting, particularly when living with housemates during pandemic-induced
remote learning conditions.] An ADHD diagnosis during my sophomore year helped
identify the root cause of my distractibility, but did little to ameliorate it.
As a result, I spend a lot of time testing techniques to limit distractions in
my work environment. This is an especially engaging diversion when I have
important work to do.

Last November, when my friend [Logan](https://github.com/lsnow99) went home for
Thanksgiving, he left behind his Oculus Go---a Virtual Reality (VR) headset he
bought on eBay---and gave me permission to use it in his absence. Since I had a
challenging assignment for my programming language theory course due the next
day,^[For the curious, the assignment can be viewed [here](assn5.pdf). In the
demo video, I implement a single rule from one part of the typechecker for
modal **PCF** with **K** machines.] it was only natural to get diverted by
attempting to minimize external distractions with this new toy.

Given programmers' stereotypical penchant for multi-monitor setups, I was
surprised that my cursory research into VR programming environments returned no
helpful results. I found a lot of vaporware claiming to "revolutionize coding"
using immersive interactive experiences and three-dimensional metaphors for
code, but nothing about regular programming using a headset in lieu of computer
monitors.

What follows is a description of how I set up a distraction-free programming
environment using the Oculus Go, and a review of my experience.

# Technical Details

The headset already had Mozilla's VR web browser "Firefox Reality"
installed,^[<https://mzl.la/reality>] which defaults to opening new tabs on
either side of the main one, thereby allowing multiple pages to be viewed at
the same time and emulating the multi-monitor setup I was after. Rather than
fumbling with peripherals and installing apps on the device, I resolved to open
documentation in two separate browser tabs, and stream my terminal to the
third. I would type at my regular computer keyboard, and simply view it through
the web browser on the VR headset.

The video below demonstrates the final setup. Note that when the headset remote
turns sideways, it has been laid on the desk next to my keyboard so I can type.

<figure>
<video controls>
<source src="jstrieb_vr-programming.mp4" type="video/mp4" />
</video>
<figcaption>
A video demo of working on PL theory homework in Standard ML with virtual
monitors for work and documentation. The tab on the left is the assignment, the
one on the right is the course textbook.
</figcaption>
</figure>
<br>

There were two steps to getting fully set-up. Streaming my terminal was done
using `ttyd` with a shared `tmux` session.^[<https://github.com/tsl0922/ttyd>]
Reading documentation was done with
`PDF.js`,^[<https://mozilla.github.io/pdf.js/>] since Firefox Reality does not
come with a built-in PDF reader.

Click the subsection headers below to expand for further technical details.

<details>
<summary>
<h2>Streaming the Terminal</h2>
</summary>

Setting up terminal streaming was a simple matter of downloading the correct
`ttyd` release, making it executable, and running it with a `tmux` session. The
following commands were run from within the terminal session I intended to
stream.

``` bash
# Download ttyd (I use the latest x86_64 release)
wget --output-document "ttyd" "https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64"

# Make the downloaded file executable
chmod +x ./ttyd

# Start a ttyd session running in the background
./ttyd --readonly --port 6969 tmux new -A -s ttyd_tmux &> /dev/null &
```

The final command tells `ttyd` to run `tmux new -A -s ttyd_tmux` whenever a new
user appears from the web. This connects them to a `tmux` session named
`ttyd_tmux`, and creates the session before connecting if it does not already
exist. This ensures that the terminal viewed from the headset exactly matches
the one being typed on the computer.

Next, from my terminal, I ran the following command to open up the shared
session. Anything typed into this session would appear on the VR headset.

``` bash
tmux new -A -s ttyd_tmux
```

Then, since the Oculus headset was on the same Wi-Fi network as my laptop, I
ran `ifconfig` to get my local IP address, and went to the following URL inside
the VR web browser to view the terminal.

```
http://<my local IP>:6969/
```

As long as the terminal window was in-focus on my computer, any keys typed
there were immediately reflected in the terminal on the headset.
<br>

</details>

<details>
<summary>
<h2>Viewing PDFs in Mozilla Reality</h2>
</summary>

Mozilla Reality does not come with a built-in PDF viewer, so `PDF.js` was a
natural choice for rendering PDF files in the browser.

The `PDF.js` website provides a viewer that can render PDF files from arbitrary
URLs.^[<https://mozilla.github.io/pdf.js/web/viewer.html>] Since the PDF files
are fetched client-side from within the browser, they are subject to the
same-origin policy, and thus a cross-origin request sharing (CORS) proxy is
necessary.^[Incidentally, the maintainer of one of the most popular, free CORS
proxies is also a primary maintainer of the `PDF.js` extension for Google
Chrome \
<https://github.com/mozilla/pdf.js/issues/1000#issuecomment-133756244>.] It is
therefore possible to view PDF files by navigating to URLs like the following:

```
https://mozilla.github.io/pdf.js/web/viewer.html?file=https%3A%2F%2Fcors.jstrieb.workers.dev%2Fcorsproxy%2F%3Furl%3Dhttps%3A%2F%2Fjstrieb.github.io%2Fposts%2Fvr-programming%2Fassn5.pdf
```

For convenience, below is a form that takes in a PDF URL and generates a
shortened link to the Mozilla `PDF.js` viewer using my CORS proxy.

<style>
.contact-form {
  height: auto;
}
</style>

<form class="contact-form" action="https://tinyurl.com/create.php" method="get"
target="_blank" >
  <label for="pdf_url">Link to PDF:</label>
  <input id="pdf_url" type="url" />
  <input type="hidden" id="source" name="source" value="indexpage">
  <input type="hidden" id="url" name="url">
  <button onclick="makePDFURL(this)">Get Short PDF Viewer URL</button>
</form>

<script>
function makePDFURL(form) {
  let pdf_url = document.querySelector("#pdf_url");
  let url = document.querySelector("#url");
  url.value = ("https://mozilla.github.io/pdf.js/web/viewer.html?file="
      + encodeURIComponent("https://cors.jstrieb.workers.dev/corsproxy/?url=")
      + encodeURIComponent(pdf_url.value));
  return true;
}
</script>

</details>



# Reflection

Despite practical limitations of the headset and keyboard setup, the experience
left me with the distinct impression that virtual reality is the future of
human-computer interaction.

Once VR technology matures, I expect knowledge workers will spend much of their
time using immersive desktop environments, rather than looking at real-world
screens. Eventually, busy people on planes and trains will goggle into VR
workspaces, and remote workers will walk around virtual offices.

In a world replete with distractions, deep focus is an uncommon treat. By using
the VR headset, it was possible to instantly shut everything out, and to attain
this otherwise rare state of complete concentration. 

While wearing the headset, there were no visual distractions. Checking my phone
and falling into rabbit holes on the Web were both cumbersome enough to be
infrequent – the path of least resistance when working was to keep hacking on
the code positioned front and center, looking away only to glance at
already-open documentation on either side.

In this case, the difficulty of searching the Web and navigating to new pages
was a feature, not a bug. In the course of programming outside of VR, I
commonly search for something simple and realize an hour later that all I have
done is read "Hot Network Questions" linked on the right side of every Stack
Overflow post. Whereas in my VR setup, the most accessible documentation is
that which is readable from the terminal interface. Typically, this is
documentation already stored offline such as man pages or Python's `help()`
utility. The benefit of being restricted to offline documentation cannot be
overstated.^[This limitation can also be enforced by working in text mode and
not starting the desktop window manager, which I like to do from time to time.
But this doesn't help with distractions in the environment.]

The two practical limitations of programming in VR were the headset screen
resolution and battery. The low resolution was tolerable for about two hours,
but the battery only lasted that long, anyway. These points of friction are
core limitations of VR technology in general, and will inevitably be overcome
as the tech improves. They are also far less limiting in higher-end headsets,
even today.^[The Oculus Go is known for being a particularly mediocre "intro"
headset. The exact same setup would probably work better on a more expensive
headset. Then again, better headsets also have proper virtual desktop
applications like \
<https://store.steampowered.com/app/382110/Virtual_Desktop/>.]

The need to touch-type might also inhibit some people from programming in VR.
But I don't expect this to prevent the steady replacement of computer monitors
as headsets get better, since a headset-mounted camera pointing at the keyboard
would allow a user to see their hands so they don't have to type blind. Based
on my experience, I also don't believe novel controllers or interaction
modalities are necessary for VR to replace traditional monitors in work
environments – using the VR remote instead of the mouse was shockingly natural,
and not seeing the keyboard was a minor inconvenience at worst.

It seems obvious that there should be startups working on VR document,
spreadsheet, and presentation editing software in addition to programming
environments. That way, as soon as there are hardware improvements, those
companies would be positioned to be first to market with products tailored for
workers looking to replace their monitors with focus-enhancing VR workstations.

On the other hand, since consumer applications are increasingly made for the
web, maybe the future is Google Drive, Sheets, and Slides, but optimized for
VR. A headset that only runs a browser isn't too different from a Chromebook,
so I wouldn't be surprised if Google used their web-based, cross-platform
dominance to muscle into the market for VR productivity software. Either way,
after this first experience working in virtual reality, I will be watching the
space eagerly.



# Postscript

The utterly complete focus attained while immersed in virtual reality left me
eager for more opportunities to work using a VR headset. Since the initial
experience in November, I have continued to occasionally author documents and
write code using the headset instead of my normal computer screen.

I bought a Raspberry Pi
400,^[<https://www.raspberrypi.org/products/raspberry-pi-400/>] and have `ttyd`
set up to run on boot so I can use it in text mode from the VR headset without
connecting a monitor. 

Additionally, the following applications seem to work in VR:

- VS Code entirely in the browser with "github1s" (but the lack of keyboard
  makes it difficult to use)^[<https://github.com/conwnet/github1s>]
- Google Docs works well if I have the same document open on my computer.
  Google Sheets works less well, and Google Slides is nearly unusable since
  these last two both rely more heavily on the mouse than Docs

Finally, I was able to use Apache Guacamole with the graphical mode of my "CTF
Collab" project to run an entire remote desktop session in the browser where
the computer I connected to was running on GitHub
Actions.^[<https://guacamole.apache.org/>]${}^,$
^[<https://github.com/jstrieb/ctf-collab>] This web-based remote desktop
session enabled me to run graphical applications like Ghidra from within the
virtual environment without installing anything on my computer.

There are undoubtedly many additional ways in which regular productivity
applications can be brought to VR, and I can't wait to see how the field
develops.
