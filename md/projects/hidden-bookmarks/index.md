---
title: "Bookmark Knocking: A Novel Technique to Hide Bookmarks"
author: Jacob Strieb
date: March 12, 2021
description: A novel technique to securely hide bookmarks without a browser extension.
...


# Bookmark Knocking: A Novel Technique to Hide Bookmarks

By [Jacob Strieb](https://jstrieb.github.io)

Published on [March 12, 2021](/projects/hidden-bookmarks)

---

Click special bookmarks in the correct order to open a hidden link.

- [Star on GitHub](https://github.com/jstrieb/link-lock/blob/master/hidden)
- [Try the demo](#demo)

---

# Introduction

Imagine that you want to propose to your partner, but they sometimes use your
computer. You don't want them to see that you are bookmarking wedding rings.
What do you do?

Alternatively, imagine you live with someone abusive. You decide to get help,
so you look for resources on the Internet. There are helpful links, but you
know if you bookmark them and your abuser goes through your computer, they may
find them.^[Unfortunately, this is a [realistic scenario for many
people](https://www.nytimes.com/wirecutter/blog/domestic-abusers-can-control-your-devices-heres-how-to-fight-back/).]
You can't install a hidden bookmark extension either, because they could just
as easily notice that. What do you do?

Almost a year ago, I created [Link Lock](https://jstrieb.github.io/link-lock)
-- a tool to enable anyone to securely password-protect URLs. But adding a
password to links isn't always enough.

Link Lock relies on strong cryptography for security, but sometimes a layer of
obscurity is a practical necessity. In other words, there are some situations
where a bookmark that asks for a password is too suspicious to be useful, even
if the password protection is secure.

Bookmark knocking is a novel technique to address this problem. It enables
users to hide bookmarks using features already built into every web browser.
There are two versions available:

- [A stable, simplified version integrated directly into Link
  Lock](https://jstrieb.github.io/link-lock/hidden/)
- [An experimental version on this page](#demo), designed to test the limits of
  the idea



# Demo

This version is *experimental*, and is only a proof-of-concept to explore the
limits of the idea. Use the [stable
version](https://jstrieb.github.io/link-lock/hidden/) for anything serious.

Drag the following links to your bookmarks bar to try it out. They must be
clicked in the correct order to open the secret page. Otherwise, they will open
Wikipedia pages. 

<div>
<ul class="generated">
<li><a class="button" onclick="return false" href="https://en.wikipedia.org/wiki/URI_fragment#eyJ2IjoiMC4wLjEiLCJlIjoiVGlhNjU3enExQW5vNXc0bVNQOXM5dXYrTEwvcXBDMm9ScVRTN2pxY0RMUjRzYUhUb1FPTHBoNmduZ05SWE9qTXkvRldnVjVmNld2dmExNmhEQSs2SzU0MHBCTEhaaEozeXp2TTBheU8xNWd2MnhKNE1oeFRQN0JDeTRxOWZnbW1aKzJaRFUzeW9hQW5wTnVkYUtzZFQ0K2grNGs5emcra2ZxS01wS0FLVW0zaWRTNjQrYTl0L2NHcGdCUlA1N2t6L0dENWdWSDNnT2VaUW9sdTJQSm1nWDlEQUl3MVBYWm9YMmMvWkhoK2ltWWsxOW5DT3M4Z3IxRkp3aEhZL1Fpd3RFS3Y0eFAyN0laZjBqQ1hkTDhGaUh1R0RBSXZFQ0RVK1dhWHZSdjJ5Q3pjV3lKYXFFcnovZURZRk5za2k2UE00enJmMHk0VTJpTS9ZOUo4eGtJa2FHdTR6ZFpGK0pRM1hsQm15Y0FkL01yTE4rbWJSMGpvYmRPcit5b3VWK055ZnVCZjliTGxBSGFYbnpwK3ZhTnlNRWw5OE5ZaURoN3dUL3Q3OTFMOWtOQS9abTFKTXBvdEVQZzNEYW9weXd6UTA0RG1sVTVEMmNQS3E1V1JHK2Q2ZVpaUU04TXRnVWJVODZGRUh3RkM1T2ExM0lsR0J5dldKdVpnRitJOE04MVFGR0RpZTNHVG80UVlIdVQrcDA5KyszbDVhSkJOanJaZ1kwQXFBNkFjckIyNHNoZVM0Qk5tZ2NXWE93Qmx3ZHUvVTI3MGUrK3R3SzdQSnFhQ0FLZUdHU3RWdVdJVjhXK0dZbzBIeXZlS0hBYW5xY0FEK0lUWS80dThFZlAvcmZyem05clNZUHZPL2YrblF2WGF1TE01SzNjM2RQS2hQdlUwd0dnZ3Zla3Jva2loTVdCRm5SeE5sRWdHQjA3blJKeFoydXhwQjdRZjl1WHVmWUtTVXhSRzllbzAzMmFCdDlZUHQ0RWZjU2ZNYnhVWmcwQWUyNHNUNERNQmVrcEpPU2hHOHNWNHRUdmZGUXFBeEJpRjEvL3VFK1E4bmNoNktPU3A1blFEbElweXpWcTM4SGN6OGUzb1U5REVZbFhwSElzRnhYQkhKbVdmTzUwNGJLT2JDb2VEbVI3cEVWMXFQTktPeDJhTEpYZUZoTytmc0RMaGFHUW5iUjBqeHh4Y3lMMW96YllmczlLY05qT3Y1bDJ4YjBNS0wxdGlEeXlUY1NCYWRxajdrWjNVNXhKSkFuMUI0bEFnWUVKaWhaRWhyeng4MEthanpFVlFMUWUwWkcwNk5sYk5aYmVuWE1mNVRPNVA1WTZ1TW9OQ3hqN2ltZWJOVkNvYlRkWlpqNGpNL3ZJMTZsTHJTSkxxcGMvQzFDV2xPa1l2eXJsNk5KYVdQZkV4a1BkbiIsInMiOiJ3UmhkbWE5QXpwOTRxQUtGWTFKSEFRPT0iLCJpIjoiWkFoMGF4endKbCtNeHMxZCIsInAiOiIifQ==">1</a></li>
<li><a class="button" onclick="return false" href='javascript:(async () => {var b64 = (function() {  function generateIndexDict(a) {    let result = {};    for (let i = 0; i < a.length; i++) {      result[a[i]] = i;    }    return result;  }  const _a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";  const _aRev = generateIndexDict(_a);  _aRev["-"] = _aRev["+"];  _aRev["_"] = _aRev["/"];  const _enc = new TextEncoder("utf-8");  const _dec = new TextDecoder("utf-8");  return {    decode: function(s) {      return this.binaryToAscii(this.base64ToBinary(s));    },    encode: function(s) {      return this.binaryToBase64(this.asciiToBinary(s));    },    asciiToBinary: function(text) {      return _enc.encode(text);    },    binaryToAscii: function(binary) {      return _dec.decode(binary);    },    binaryToBase64: function(originalBytes) {      let length = originalBytes.length;      let added = (length % 3 == 0) ? 0 : (3 - length % 3);      let bytes = new Uint8Array(length + added);      bytes.set(originalBytes);      let output = "";      for (let i = 0; i < bytes.length; i += 3) {        output += _a[ bytes[i] >>> 2 ];        output += _a[ ((bytes[i] & 0x3) << 4) | (bytes[i + 1] >>> 4) ];        output += _a[ ((bytes[i + 1] & 0xF) << 2) | (bytes[i + 2] >>> 6) ];        output += _a[ bytes[i + 2] & 0x3F ];      }      if (added > 0) {        output = output.slice(0, -added) + ("=".repeat(added));      }      return output;    },    base64ToBinary: function(s) {      let bytes = [];      if (s.length % 4 == 1) {        throw "Invalid base64 input";      } else if (s.length % 4 != 0) {        s += "=".repeat(4 - (s.length % 4));      }      for (let i = 0; i <= (s.length - 4); i += 4) {        for (let j = 0; j < 4; j++) {          if (s[i + j] != "=" && !(s[i + j] in _aRev)) {            throw "Invalid base64 input";          } else if (s[i + j] == "=" && Math.abs(s.length - (i + j)) > 2) {            throw "Invalid base64 input";          }        }        bytes.push((_aRev[s[i]] << 2) | (_aRev[s[i + 1]] >>> 4));        if (s[i + 2] != "=") {          bytes.push(((_aRev[s[i + 1]] & 0xF) << 4) | (_aRev[s[i + 2]] >>> 2));        }        if (s[i + 3] != "=") {          bytes.push(((_aRev[s[i + 2]] & 0x3) << 6) | _aRev[s[i + 3]]);        }      }      return new Uint8Array(bytes);    }  }})();/******************************************************************************* * Global Variables ******************************************************************************/var LATEST_API_VERSION = "0.0.1";var apiVersions = {};/******************************************************************************* * API Version 0.0.1 (Latest) ******************************************************************************/apiVersions["0.0.1"] = {  salt: Uint8Array.from([236, 231, 167, 249, 207, 95, 201, 235, 164, 98, 246,            26, 176, 174, 72, 249]),  iv: Uint8Array.from([255, 237, 148, 105, 6, 255, 123, 202, 115, 130, 16,            116]),  randomSalt: async function() {    return await window.crypto.getRandomValues(new Uint8Array(16));  },  randomIv: async function() {    return await window.crypto.getRandomValues(new Uint8Array(12));  },  deriveKey: async function(password, salt=null) {    let rawKey = await window.crypto.subtle.importKey(        "raw",        b64.asciiToBinary(password),        { name: "PBKDF2" },        false,        [ "deriveBits", "deriveKey" ]    );    return await window.crypto.subtle.deriveKey(        {          name: "PBKDF2",          salt: salt == null ? this.salt : salt,          iterations: 100000,          hash: "SHA-256"        },        rawKey,        {          name: "AES-GCM",          length: 256        },        true,        [ "encrypt", "decrypt" ]    );  },  encrypt: async function(text, password, salt=null, iv=null) {    let key = await this.deriveKey(password, salt=salt);    let encryptedBinary = await window.crypto.subtle.encrypt(        {          name: "AES-GCM",          iv: iv == null ? this.iv : iv        },        key,        b64.asciiToBinary(text)    );    return encryptedBinary;  },  decrypt: async function(text, password, salt=null, iv=null) {    let key = await this.deriveKey(password, salt=salt);    let decryptedBinary = await window.crypto.subtle.decrypt(        {          name: "AES-GCM",          iv: iv == null ? this.iv : iv        },        key,        new Uint8Array(text)    );    return b64.binaryToAscii(decryptedBinary);  }};let redirect = "https://en.wikipedia.org/wiki/Advanced_Encryption_Standard";const hash = window.location.hash.slice(1);try {  const decoded = b64.decode(hash);  const params = JSON.parse(decoded);  const api = apiVersions[params.v];  let salt = b64.base64ToBinary(params.s);  let iv = b64.base64ToBinary(params.i);  let encrypted = b64.base64ToBinary(params.e);  let passphrase = params.p + "!nfP";  let decrypted = null;  try {    decrypted = await api.decrypt(encrypted, passphrase, salt, iv);  } catch {    console.log(params, passphrase);    params.p = passphrase;    window.location.replace(redirect + "#"%20+%20b64.encode(JSON.stringify(params)));%20%20%20%20return;%20%20}%20%20window.location.href%20=%20decrypted;}%20catch%20{%20%20window.location.replace(redirect);}})();'>2</a></li>
<li><a class="button" onclick="return false" href='javascript:(async () => {var b64 = (function() {  function generateIndexDict(a) {    let result = {};    for (let i = 0; i < a.length; i++) {      result[a[i]] = i;    }    return result;  }  const _a = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";  const _aRev = generateIndexDict(_a);  _aRev["-"] = _aRev["+"];  _aRev["_"] = _aRev["/"];  const _enc = new TextEncoder("utf-8");  const _dec = new TextDecoder("utf-8");  return {    decode: function(s) {      return this.binaryToAscii(this.base64ToBinary(s));    },    encode: function(s) {      return this.binaryToBase64(this.asciiToBinary(s));    },    asciiToBinary: function(text) {      return _enc.encode(text);    },    binaryToAscii: function(binary) {      return _dec.decode(binary);    },    binaryToBase64: function(originalBytes) {      let length = originalBytes.length;      let added = (length % 3 == 0) ? 0 : (3 - length % 3);      let bytes = new Uint8Array(length + added);      bytes.set(originalBytes);      let output = "";      for (let i = 0; i < bytes.length; i += 3) {        output += _a[ bytes[i] >>> 2 ];        output += _a[ ((bytes[i] & 0x3) << 4) | (bytes[i + 1] >>> 4) ];        output += _a[ ((bytes[i + 1] & 0xF) << 2) | (bytes[i + 2] >>> 6) ];        output += _a[ bytes[i + 2] & 0x3F ];      }      if (added > 0) {        output = output.slice(0, -added) + ("=".repeat(added));      }      return output;    },    base64ToBinary: function(s) {      let bytes = [];      if (s.length % 4 == 1) {        throw "Invalid base64 input";      } else if (s.length % 4 != 0) {        s += "=".repeat(4 - (s.length % 4));      }      for (let i = 0; i <= (s.length - 4); i += 4) {        for (let j = 0; j < 4; j++) {          if (s[i + j] != "=" && !(s[i + j] in _aRev)) {            throw "Invalid base64 input";          } else if (s[i + j] == "=" && Math.abs(s.length - (i + j)) > 2) {            throw "Invalid base64 input";          }        }        bytes.push((_aRev[s[i]] << 2) | (_aRev[s[i + 1]] >>> 4));        if (s[i + 2] != "=") {          bytes.push(((_aRev[s[i + 1]] & 0xF) << 4) | (_aRev[s[i + 2]] >>> 2));        }        if (s[i + 3] != "=") {          bytes.push(((_aRev[s[i + 2]] & 0x3) << 6) | _aRev[s[i + 3]]);        }      }      return new Uint8Array(bytes);    }  }})();/******************************************************************************* * Global Variables ******************************************************************************/var LATEST_API_VERSION = "0.0.1";var apiVersions = {};/******************************************************************************* * API Version 0.0.1 (Latest) ******************************************************************************/apiVersions["0.0.1"] = {  salt: Uint8Array.from([236, 231, 167, 249, 207, 95, 201, 235, 164, 98, 246,            26, 176, 174, 72, 249]),  iv: Uint8Array.from([255, 237, 148, 105, 6, 255, 123, 202, 115, 130, 16,            116]),  randomSalt: async function() {    return await window.crypto.getRandomValues(new Uint8Array(16));  },  randomIv: async function() {    return await window.crypto.getRandomValues(new Uint8Array(12));  },  deriveKey: async function(password, salt=null) {    let rawKey = await window.crypto.subtle.importKey(        "raw",        b64.asciiToBinary(password),        { name: "PBKDF2" },        false,        [ "deriveBits", "deriveKey" ]    );    return await window.crypto.subtle.deriveKey(        {          name: "PBKDF2",          salt: salt == null ? this.salt : salt,          iterations: 100000,          hash: "SHA-256"        },        rawKey,        {          name: "AES-GCM",          length: 256        },        true,        [ "encrypt", "decrypt" ]    );  },  encrypt: async function(text, password, salt=null, iv=null) {    let key = await this.deriveKey(password, salt=salt);    let encryptedBinary = await window.crypto.subtle.encrypt(        {          name: "AES-GCM",          iv: iv == null ? this.iv : iv        },        key,        b64.asciiToBinary(text)    );    return encryptedBinary;  },  decrypt: async function(text, password, salt=null, iv=null) {    let key = await this.deriveKey(password, salt=salt);    let decryptedBinary = await window.crypto.subtle.decrypt(        {          name: "AES-GCM",          iv: iv == null ? this.iv : iv        },        key,        new Uint8Array(text)    );    return b64.binaryToAscii(decryptedBinary);  }};let redirect = "https://en.wikipedia.org/wiki/Rickrolling";const hash = window.location.hash.slice(1);try {  const decoded = b64.decode(hash);  const params = JSON.parse(decoded);  const api = apiVersions[params.v];  let salt = b64.base64ToBinary(params.s);  let iv = b64.base64ToBinary(params.i);  let encrypted = b64.base64ToBinary(params.e);  let passphrase = params.p + "Eki7";  let decrypted = null;  try {    decrypted = await api.decrypt(encrypted, passphrase, salt, iv);  } catch {    console.log(params, passphrase);    params.p = passphrase;    window.location.replace(redirect + "#"%20+%20b64.encode(JSON.stringify(params)));%20%20%20%20return;%20%20}%20%20window.location.href%20=%20decrypted;}%20catch%20{%20%20window.location.replace(redirect);}})();'>3</a></li>
</ul>
</div>


## Create a Hidden Bookmark Knock Sequence

Enter a link to hide. Click "Add a step" to add an additional bookmark to the
knock sequence. For each "Knock sequence step," input where the bookmark should
go if the knock sequence is incorrect or incomplete.

<noscript>
Unfortunately, the demo absolutely requires JavaScript to run. This is because
all of the encryption and decryption is done client-side, in the browser.
Please enable JavaScript for the demo to work.

If you're uncomfortable doing this, <a
href="https://jstrieb.github.io/projects/hidden-bookmarks/create.js">check out
the code</a> so that you can be sure it is safe.

Several of the links and buttons on the page will not work correctly if you
do not enable JavaScript.
</noscript>

<style>
.contact-form {
  height: auto;
  padding-bottom: 0;
}

.output-bookmarks {
  opacity: 0;
  transition: opacity 0.25s;
}

.generated {
  display: flex;
  flex-wrap: wrap;
  flex-direction: row;
  justify-content: center;
  padding: 0;
  line-height: 3;
}

.generated li {
  display: inline-block;
  text-align: center;
  flex: 0.15;
}

.generated li a {
  padding-left: 1em;
  padding-right: 1em;
}
</style>

<script src="https://jstrieb.github.io/link-lock/b64.js"></script>
<script src="https://jstrieb.github.io/link-lock/api.js"></script>
<script src="create.js"></script>

<form class="contact-form" id="main-form" onsubmit="return false;" method="post">
  <label>Link to hide</label>
  <input id="hidden-url" type="url" />
  <hr>
  <br>
  <div class="bookmarks">
  <label>Knock sequence step</label>
  <input type="url" class="bookmark" />
  <label>Knock sequence step</label>
  <input type="url" class="bookmark" />
  </div>
  <div>
  <button onclick="generateBookmarks()">Generate bookmarks</button>
  <button onclick="addBookmark()">Add a step</button>
  <button onclick="fillRandom()">Use random pages</button>
  </div>
  <p id="alert" class="alert"></p>
  <div class="output-bookmarks">
  <p>Drag the generated bookmarks to your bookmarks bar. Their default names are the order in which to click them, but they should be renamed.</p>
  <ul class="generated" id="generated"></ul>
  </div>
</form>



# How It Works

Bookmark knocking is similar to [port
knocking](https://en.wikipedia.org/wiki/Port_knocking), for which it was named.
A user who wants access to a hidden link must know to click the right bookmarks
in the right "knock sequence." If they do this, they will be redirected to the
hidden page.

The concept relies on storing encrypted data about the hidden link in the [URL
fragment](https://en.wikipedia.org/wiki/URI_fragment) or "hash." This is the
part of the URL that comes after a `#`, and typically takes a user to some spot
in the middle of the page.^[I have also abused the URL fragment to store entire
pages -- check out [URL Pages](https://github.com/jstrieb/urlpages)!] 

In this case, the hash contains a
[base64](https://en.wikipedia.org/wiki/Base64)-encoded
[JSON](https://en.wikipedia.org/wiki/JSON) object. The object consists of the
[AES](https://en.wikipedia.org/wiki/Advanced_Encryption_Standard)-encrypted
secret URL and the currently-attempted knock sequence. The knock sequence
attempt is stored as a string of characters, and is used as a passphrase to
try decrypting the secret link after each knock.

When one of the special knock sequence bookmarks is clicked, it runs JavaScript
to check if the current URL fragment is base64-encoded JSON with the required
information. If not, it redirects to the user-specified decoy bookmark link. If
so, it adds some static characters to the current passphrase attempt string and
tries to decrypt the hidden link using the newly-modified passphrase. 

If decryption succeeds, it redirects to the now-decrypted, no-longer-hidden
link. On the other hand, if this attempt fails, it redirects to the bookmark
link that it normally would, but with a URL fragment containing updated
information about the latest attempt. Then the user can perform the next knock
in the sequence, and the process repeats.

Since it is perfectly valid to have an arbitrary hash at the end of a typical
URL, the bookmark behaves normally if the knock sequence is incorrect or
incomplete. The only distinguishing feature of the decoy bookmark URLs is the
presence of a long, nonsensical fragment, which wouldn't alarm most people.

## Link Lock Version

The simplified version of bookmark knocking [built into Link
Lock](https://jstrieb.github.io/link-lock/hidden/) only supports two knocks.
There is one universal second knock for any valid first knock. Then the hidden
link prompts for a password. This two-knock version provides a practical level
of privacy, without compromising on usability or security.



# Who It Is For

Software security claims are only valid relative to a well-defined threat
model. In this case, the software aims to be secure against family and friends,
not agencies.

In other words, links protected with bookmark knocking (as implemented here)
will be difficult to notice for most people, let alone crack. But the
protection *can* be noticed by an astute observer, and *can* be broken by a
determined adversary.^[The keyspace is extremely small. Assume any attacker
with all of the bookmarks in the knock sequence and the ability to brute force
AES-GCM-encrypted data will successfully uncover your hidden link. On the other
hand, if you hide a Link Lock URL, the hidden link will be securely
password-protected.]

Despite shortcomings, bookmark knocking is still a useful part of
defense-in-depth. For more serious security, use the version built into [Link
Lock](https://jstrieb.github.io/link-lock/).

**Don't forget to use private browsing or incognito mode when accessing hidden
links, otherwise the secret links are stored in your browser history, and the
protection is worthless!**

Example use cases:

- Hide private links from other users of a shared computer
- Prevent embarrassing bookmarks from being accidentally opened during a
  live-stream, video call, or demonstration
- Access a secret link without typing in a password (if there is concern about
  keyloggers or other [stalkerware](https://en.wikipedia.org/wiki/Stalkerware))
- Create a fun riddle or prank for the owner of a computer you gain access to 
- Discreetly save personal bookmarks to a work computer



# Known Issues

If you have ideas for how to address the following problems, or want to discuss
others, please [open an issue on
GitHub](https://github.com/jstrieb/link-lock/issues/new) or use my [contact
form](https://jstrieb.github.io/about#contact).

- Generated bookmarks are prefixed with `javascript:` and therefore cannot have
  favicons. As such, they're not perfectly identical to a regular bookmark for
  the same site.
- Websites that modify the URL fragment will mess up the bookmark knocking.
  These sites should not be used for steps in the knock sequence. Some examples
  include Gmail and Telegram.
- Only tested with desktop Firefox and Chrome. Not tested with Safari, Edge, or
  on mobile devices.
- Despite spending hours revising the instructions for the [Link Lock hidden
  bookmarks](https://jstrieb.github.io/link-lock/hidden/) page, it is still far
  from perfect. Making this idea easy to use and understand is very difficult.



# For Abuse Victims

This technology is designed to be helpful for anyone who needs more privacy
than they feel they have, but it cannot guarantee anything. You are the expert
in your own situation, and you need to judge if it is appropriate to use this
software. If you are in a dangerous situation, please seek help.

From a [New York Times
Article](https://www.nytimes.com/wirecutter/blog/domestic-abusers-can-control-your-devices-heres-how-to-fight-back/)
on technology and domestic abuse:

> If you are in immediate danger, call 911.
> 
> If your calls are being tracked, call your local services hotline, like 211
> or 311, and ask to be transferred to a local resource center.
> 
> If you or someone you know is in an abusive relationship or has been sexually
> assaulted, call the [National Sexual Assault
> Hotline](https://www.rainn.org/get-help/national-sexual-assault-hotline) at
> 800-656-HOPE or the [National Domestic Violence
> Hotline](https://www.thehotline.org/) at 800-799-SAFE (you can also [chat
> live with an advocate at
> NDVH](https://www.thehotline.org/what-is-live-chat/), or text LOVEIS to
> 22522).
