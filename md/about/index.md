---
title: About - David Kleindiek
author: David Kleindiek
date: July 7, 2022
description: "Background on David Kleindiek."
...

<img src="headshot.png" width="300" height="300" alt="Dithered headshot of Jacob Strieb" class="avatar">

# About
I am an undergraduate of Eberhard-Karl-Universät in Tübingen where I am studying computer science.
 
The site does not use tracking or analytics. The only way I know people visit
is when they contact me directly.

<!--
<div class="noscript">

Scammers have been using my name to try and steal Bitcoin. 

<span class="underline">I will never send emails asking for cryptocurrency or
offering to hack people.</span>

If you receive emails from people claiming to be me, please forward them to the
address listed below.
</div>
-->

# Contact

I can be reached at [david.kleindiek@gmail.com](mailto:david.kleindiek@gmail.com).

Alternatively, use the form below. A chatbot delivers the messages directly to
my cell phone. Include an email if you would like a response!

<div class="contact-form">
<noscript>
<p>
The form below requires JavaScript to be enabled in order to submit. I wish I could use a regular form that does not require JavaScript, but unfortunately spammers took advantage. As a result, I have had to resort to this. If you have JavaScript disabled but still want to contact me, please use my email, which can be found above.
</p>
</noscript>
<form onsubmit="submitForm(this); return false">
<label for="email">Email (Optional):
<input type="email" id="email" name="email" /></label>
<label for="text">Message:
<textarea minlength="1" maxlength="999" id="text" name="text"></textarea>
<button>Send</button>
<p class="alert" id="alert"></p>
</form>
</div>

<script type="text/javascript">
// Show that the message has been sent and clear the textarea
async function submitForm(form) {
  const message = (( form.email.value ? `From: ${form.email.value}\n` : "")
                   + `${form.text.value}`);

  const BOT_ID = "706deaf523f339bcee544e833b";
  fetch(`https://api.groupme.com/v3/bots/post?bot_id=${BOT_ID}`, {
    mode: "no-cors",
    method: "POST",
    headers: {
      "Content-Type": "application/json"
    },
    body: JSON.stringify({
      text: message,
    }),
  })
  .then(() => {
    form.email.value = "";
    form.text.value = "";
    const alert = form.querySelector("#alert");
    alert.innerText = "Sent!";
    alert.style.opacity = 1;
    setTimeout(() => alert.style.opacity = 0, 5000);
  });
}
</script>
