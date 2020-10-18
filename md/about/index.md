---
title: About - Jacob Strieb
author: Jacob Strieb
date: July 13, 2019
description: Background on Jacob Strieb
...

![](headshot.png){ .avatar }

# About

I am currently an undergraduate studying math, computer science, and public
policy at Carnegie Mellon University in Pittsburgh. My resume is available upon
request.

The site does not use tracking or analytics, nor do any of the distributed web
applications I have built. Thus, the only feedback I get is from people
reaching out to me. If you like my work, please send me a message!


# Contact

I can be reached at [jstrieb@cmu.edu](mailto:jstrieb@cmu.edu).

Alternatively, use the form below to contact me directly. A chatbot delivers
these messages directly to my cell phone. Don't forget to include contact
information if you would like a response!

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
