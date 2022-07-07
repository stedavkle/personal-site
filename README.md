# Personal Website

- Home page: [kleindiek.dev](https://kleindiek.dev)
- Forked from:
  [github.com/jstrieb/personal-site](http://github.com/jstrieb/personal-site)
- About:
  [jstrieb.github.io/projects/personal-site](http://jstrieb.github.io/projects/personal-site/)


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

3. Make any changes to `resources/template.html` that you see fit. Many of the
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

```
python3 -m http.server 8080
```

8. **[Optional]** Host your site using GitHub Pages


## How It Works

At the top of the script, there are global variables with information about
which directories are scanned for source files, and where the resulting output
goes.

The script is set to exit if any step fails, since many subsequent steps rely
on their predecessors, and all steps are important. Additionally, the script
checks that `pandoc` is installed since it is necessary for the `markdown` to
`HTML` conversion.

Next, the script uses the `find` program to index the source directory and
locate all `markdown` files to be converted. It then loops over all of the
files, converting them in-turn using `pandoc`. Before converting a given file,
it uses `sed` to extract the base directory of the file to be converted.  This
directory name is used to create the parent folder if it does not yet exist.

The script also ensures that `pandoc` conversion only happens when the
resulting `HTML` output actually needs to be updated. This occurs when the
destination output doesn't exist, the source file has been more recently
updated than the destination output file, or when anything in the `resources`
folder has been more recently updated than the destination output.

The `pandoc` command is run to convert from `markdown` to "standalone"
`HTML`.[1]  This means that `pandoc` generates a full page with a `<head>` and
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
it from `markdown`.


[1]: See the Pandoc docs section on
[templates](https://pandoc.org/MANUAL.html#templates)
