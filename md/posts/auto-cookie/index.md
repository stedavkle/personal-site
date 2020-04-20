---
title: "The Simplest Cookie Clicker Autoclicker"
author: Jacob Strieb
date: April 20, 2020
description: Cheating at Cookie Clicker by building a simple autoclicker for that runs as a bookmarklet
...


# The Simplest Cookie Clicker Autoclicker

By [Jacob Strieb](https://jstrieb.github.io)

Published on [April 20, 2020](/posts/auto-cookie/)

---


[Cookie Clicker](https://orteil.dashnet.org/cookieclicker/) is a seemingly
simple game that conceals a surprising amount of depth. It is fun to advance by
buying upgrades and buildings, but clicking as fast as possible quickly gets
tiring.

The game runs entirely in the browser, so it is possible to cheat by manually
adding cookies or modifying the underlying code. There are a number of
well-documented [ways to
cheat](https://cookieclicker.fandom.com/wiki/Cheating), but these mostly ruin
the fun[^1] by advancing the game too quickly. Using an autoclicker is a good
way to reduce the need for manual clicking without compromising the spirit of
the game. Autoclicking also avoids the "Cheated Cookies Taste Awful" shadow
achievement.

Running the autoclicker is as simple as dragging the following link to the
bookmarks bar, and clicking it while the game is running:

<style>
.button-container {
  padding: 1em;
  text-align: center;
}

a.button {
  color: limegreen;
  text-decoration: none;
  border: 2px solid;
  border-radius: 3px;
  padding: 0.5em;
}

a.button:hover {
  color: black;
  background: limegreen;
  text-decoration: none;
  border: 2px solid limegreen;
}
</style>

<div class="button-container"> <a class="button" href="javascript:var autoclicker = setInterval(function(){ try { document.getElementById('bigCookie').click(); } catch (err) { clearInterval(); } }, 10);">Cookie Autoclicker</a> </div>

The code is very simple. It creates a timer that calls a function every 10
milliseconds. That function finds the cookie element in the document and clicks
it. If such an element does not exist, the timer terminates.[^2] A more
readable version of the code is included below, without the `javascript:`
prefix required for the bookmarklet to work.

``` { .javascript }
var autoclicker = setInterval(function(){
  try {
    document.getElementById('bigCookie').click();
  } catch (err) {
    clearInterval();
  }
}, 10);
```

There are several ways to stop the autoclicker from running. The easiest is
to save the game and refresh the page. Alternatively, enter the following code
in the browser console:

``` { .javascript }
clearInterval(autoclicker);
```

This code is included as a second bookmarklet below, for convenience.

<div class="button-container"> <a class="button" href="javascript:clearInterval(autoclicker);">Stop Cookie Autoclicker</a> </div>



[^1]: A cheat that unlocks everything is activated by running the aptly-named
      `Game.RuinTheFun(1)` in the JavaScript console.

[^2]: The termination feature is useful if the bookmark is accidentally run on
      a page other than the Cookie Clicker game, where it would not find the
      cookie element and cause errors as a result.
