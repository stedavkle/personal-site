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

For more information about this website and how I created it, read my post
[here](/projects/personal-site). The site does not use tracking or analytics,
nor do any of the distributed web applications I have built. Thus, the only
feedback I get is from people reaching out to me. If you like my work, please
send me a message!


# Contact

I can be reached at [jstrieb@cmu.edu](mailto:jstrieb@cmu.edu).

Alternatively, use the form below to contact me directly. A chatbot delivers
these messages directly to my cell phone. Don't forget to include contact
information if you would like a response!

<div class="contact-form">
<iframe name="hiddenFrame" width="0" height="0" border="0" style="display: none;"></iframe>
<form onsubmit="showSent(this)" action="https://api.groupme.com/v3/bots/post?bot_id=706deaf523f339bcee544e833b" method="post" target="hiddenFrame">
<textarea id="text" name="text" maxlength="999"></textarea><br />
<input id="bot_id" name="bot_id" type="hidden" value=" 	706deaf523f339bcee544e833b">
<button>Send</button>
<p class="alert"></p>
</form>
</div><br />

<script type="text/javascript">
// Show that the message has been sent and clear the textarea
function showSent(form) {
	const alert = document.querySelector(".contact-form .alert");
	alert.innerText = "Sent!"
	alert.style.opacity = 1;
	setTimeout(() => alert.style.opacity = 0, 5000);
	setTimeout(() => document.querySelector("#text").value = "", 100);
}
</script>
