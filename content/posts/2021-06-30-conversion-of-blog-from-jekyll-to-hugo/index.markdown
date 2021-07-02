---
title: Conversion of Blog from Jekyll to Hugo
author: 'quid'
date: '2021-06-30'
slug: []
categories: []
tags: [blog, hugo, jekyll]
draft: no
---
Today I was able to use RStudio, Github and Hugo to recreate the Quid Agis blog.

So far it has been a success however the styling and format on the 'Archie' theme will need some work. I am now following the developer of this theme on Twitter and Github, https://github.com/athul/archie

So far, I have been able to change the primary colour of the hyperlinks from Red to Blue, edited the social media links, decreasing it from three (3) to two (2), and placing my details in there.

I also added a 'Contact' page which was surprisingly easy, once I realised that the NavMenu entries are added to the 'config.yaml' and not an '/../assets/navigation.html' arrangement. Having core definitions in a 'config.yaml/.toml' is an efficient method, given these assignments are not changed often.

Over the next three (3) days, I will do some tweaks to the layout, perhaps add a few more pages and upload some of the recovered posts from the previous Jekyll-theme blog hosted directly at Github.com

I wrote a practical, clean and fast Blog Post Generator in Bash for the Jekyll-themed site to allow the rapid development of the blog post by pre-populating the default front matter, adding in variables such as Date, Time, Tags, Title etc. This would also write to the new file, changed into the '/../_posts/' directory and have the post open for editing in Nano.

After some further RTFM in relation to RStudio, R-lang and RMarkdown, I will see if I can modify the Bash script to inject a new post directly into RStudio ... which would be kinda cool. Using a CLI tool, to inject code into a GUI IDE to avoid using CLI tools.

A quick Google (I know, it's a brand *not* a verb) shows the highest rate package for this is the 'Emo' package (https://github.com/hadley/emo) by Hadley Wickham, Chief Scientist at Rtudio.com.

Once the blog is sorted in terms of pages, style etc, I will get back to studying for my Daml Developer Associate exam.
