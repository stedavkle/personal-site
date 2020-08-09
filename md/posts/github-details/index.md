---
title: Everyone Should Use &lt;details&gt; on GitHub - Jacob Strieb
author: Jacob Strieb
date: August 09, 2020
description: The &lt;details&gt; tag is a useful way to include information on a single page that only some users may want to see; it should be used more frequently in GitHub README files.
...


# Everyone Should Use `<details>` on GitHub

By [Jacob Strieb](https://jstrieb.github.io)

Published on [August 09, 2020](/posts/github-details/)

---

# Background

While reading code for the "sanitization filter" used by GitHub to allow
specific HTML tags in their Markdown, I noticed the `<details>` tag on the
whitelist.^[<https://github.com/jch/html-pipeline/blob/master/lib/html/pipeline/sanitization_filter.rb>]
Having never learned about this tag, I did some additional research. According
to MDN:^[<https://developer.mozilla.org/en-US/docs/Web/HTML/Element/details>]

> The HTML Details Element (`<details>`) creates a disclosure widget in which
> information is visible only when the widget is toggled into an "open" state.
> A summary or label can be provided using the `<summary>` element.
>
> A disclosure widget is typically presented onscreen using a small triangle
> which rotates (or twists) to indicate open/closed status, with a label next
> to the triangle. If the first child of the `<details>` element is a
> `<summary>`, the contents of the `<summary>` element are used as the label
> for the disclosure widget.

# Example

The following HTML/Markdown will create a simple dropdown:^[Example on GitHub:
<https://gist.github.com/jstrieb/6cf1b302330a19e50eb7cd82d8c79dd7>]

````markdown
<!-- This code creates a simple dropdown -->
<details>
<summary>Click here for example HTML/Markdown.</summary>
<!-- The fenced code block below must be separated by
     blank lines on either side to work correctly -->

```bash
echo "It is possible to include Markdown within HTML tags."
```

</details>
````

The code above creates the following dropdown:

<details>
<summary>Click here for example HTML/Markdown.</summary>

```bash
echo "It is possible to include Markdown within HTML tags."
```

</details>

# Additional Notes

The HTML Details Element is extremely useful for long Markdown files with
information that may not pertain to every user. Sections with installation
details, FAQs, and changelogs are particularly well-suited to collapsing using
a `<details>` tag.

When including the Details Element on GitHub, it is best to use a child
`<summary>` tag, even though the HTML does not explicitly require it. The CSS
stylesheets used on GitHub have `cursor: pointer` for the `<summary>` tag. But
if there is no `<summary>` then the default text "Details" that gets shown will
not have a pointer indicating to the user that it is clickable.

Note that it is also possible to use `<details>` in issues and pull requests
where it may be even more important to collapse auxiliary details like long
logs and tracebacks.

Though I am surely not the first to discover and use this trick on GitHub, I
write this in the hope that many more will use it to make their Markdown more
concise and readable.
