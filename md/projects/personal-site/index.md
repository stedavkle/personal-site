---
title: Personal Website - Jacob Strieb Projects
author: Jacob Strieb
date: July 13, 2019
description: Personal website designed by hand in HTML, CSS, and Javascript, and compiled from markdown using a custom bash script.
...

# Personal Website

- Home page: [jstrieb.github.io](https://jstrieb.github.io)
- Code:
  [github.com/jstrieb/personal-site](http://github.com/jstrieb/personal-site)


## History

Maintaining an Internet presence is important, and having a personal website
affords me fine-grained control over mine. As the Internet becomes an
increasingly integral component of modern society, controlling my own space for
self-expression feels like a rite of passage for exploring and sharing
important ideas. Additionally, publishing on my own platform is an opportunity
to exercise my opposition to centralized social media organizations'
near-monopoly on Internet-based self-expression.

But having a personal website is also a matter of tradition: I made my first
websites when I was in second grade, after my family upgraded from dial-up to
broadband Internet. At the time, my younger sister played with Barbie dolls,
even though all of my friends and I agreed that "Barbies stink." She was not
dissuaded, so I took my case to the Web[^1], surprised that the issue was not
already being discussed.

Without knowing how to create a site from scratch, I was relegated to using
drag-and-drop creators, but quickly became frustrated that they couldn't do
exactly what I wanted. Ever since then, my history of website creation has been
tempered by frustration with tooling: I have never been able to achieve a
desirable balance between ease of publication and low-level control over
layout, until now.


## Static Site Generator

Currently, it is popular to use static site generators like
[Hugo](http://gohugo.io) and [Jekyll](https://jekyllrb.com) to publish
websites. These programs compile `markdown` to `HTML` using a pre-defined
theme, and they make blogging on services like
[GitHub Pages](http://pages.github.com) much easier than composing websites from
scratch.

Inspired by my previous use of Hugo, writing pages in `markdown` has become my
preferred method of authoring content for the Web, so I initially sought to
make my personal site using Hugo. However, I wanted to completely customize the
underlying theme, and making a theme from scratch was more trouble than
creating the website entirely in `HTML`.

Intending to instead use something simpler and more lightweight, I next tried
using [Pandoc](http://pandoc.org) with `make`. But writing targets for each new
page was inconvenient, and recursively indexing the source directory never
quite worked right. Since all the work of finding source files was done by
shell commands in the `Makefile`, I finally resolved to write a shell script
for copying and converting the files using `pandoc`.

Since writing the first version of the script, I have been using it to great
success both on Linux, and Windows Subsystem for Linux[^2].


## How It Works

At the top of the script, there are some global variables that contain
information about which directories are scanned for source files, and where the
resulting output goes.

The script is set to exit if any step fails, since many subsequent steps rely
on their predecessors, and all steps are important. Additionally, the script
makes sure that `pandoc` is installed since it is necessary for the `markdown`
to `HTML` conversion.

Next, the script uses the `find` program to index the source directory and
locate all `markdown` files to be converted. It then loops over all of the
files, converting them in-turn using `pandoc`. Before converting a given file,
it uses `sed` to parse the base directory of the file to be converted. It uses
this directory name to create the folder if it does not yet exist.

The script also ensures that `pandoc` conversion only happens when the
resulting `HTML` output actually needs to be updated. This occurs when the
destination output doesn't exist, the source file has been more recently
updated than the destination output file, or when anything in the `resources`
folder has been more recently updated than the destination output.

The `pandoc` command is run to convert from `markdown` to "standalone"
`HTML`[^3].  This means that `pandoc` generates a full page with a `<head>` and
`<body>` rather than just converting to literal `HTML` tags. It also runs with
options to include a custom stylesheet, to highlight code with a specific
style, and to include a menu bar and footer in every page (based on files
provided in the `resources` folder). The output page is formatted according to
a template, also provided in the `resources` folder.

Next, the script copies over all files that it doesn't convert, preserving
directory structure. This is useful for copying images or other media that
could be associated with a post. It is also useful for copying pre-written
`HTML` that the script does not generate. For example, on this site, I wrote
the home page by hand in `HTML`, and copy it directly rather than converting
it from `markdown`. Finally, the script removes resource files that it may have
copied over, but which are junk[^4].


## How to Use

1. Create a menu bar and footer. I do all `HTML`, `CSS`, and `Javascript`
   experimentation using the [URL Pages](https://github.com/jstrieb/urlpages)
   tool I created.

     Once the menu bar and footer are made, add them to `resources/navbar.html`
     and `resources/footer.html`, respectively.

2. Create a main stylesheet to be used for pages on the site. Take the `CSS`
   code you will use and put it in `md/style.css`.

     I design the `CSS` by playing around with different configurations using
     the menu bar and footer I made in the first step, and some additional
     example content in the middle. I also do this step in the
     [URL Pages Editor](https://jstrieb.github.io/urlpages).

3. Make any changes to `resources/template.html` that you see fit. Most of the
   variables included in that file like `$variable-name$` are defined in the
   preamble of `markdown` pages that are converted to `HTML`. For example, the
   preamble of the file for this page is as follows.

    ```
---
title: Personal Website - Jacob Strieb Projects
author: Jacob Strieb
date: July 13, 2019
description: Personal website designed by hand in `HTML`, `CSS`, and `Javascript`, and compiled from `markdown` using a custom `bash` script.
...
    ```

4. Write some `markdown` pages using any directory structure you see fit in the
   `md` folder. Make sure they include a preamble with all of the necessary
   variables, like the one shown above.

5. Modify the global variables at the top of `compile.sh` so that it uses the
   correct source files directory, correct resources directory, and so that it
   has the correct output destination directory.

6. Run the compilation script with `./compile.sh` from the main project
   directory.

7. **[Optional]** Run a local web server such as the `http.server`
   module for Python 3 or [QuickServ](https://github.com/jstrieb/quickserv) to
   test the site out. I typically run the following command and go to
   http://localhost:8080 in my browser.

    ``` { .bash }
python3 -m http.server 8080
    ```

8. **[Optional]** Host your site using GitHub Pages


[^1]: The last surviving barbiesstink site can be found
  [here](https://barbiesstink.webnode.com). It's still up after more than a
  decade, and it looks exactly as I remember it. I have not been able to find
  archived versions of the others.

[^2]: There are sometimes slight differences between versions compiled using
  WSL due to it having a different version of `pandoc` installed

[^3]: See the Pandoc docs section on
  [templates](https://pandoc.org/MANUAL.html#templates)

[^4]: For example temporary `swp` files created by Vim
