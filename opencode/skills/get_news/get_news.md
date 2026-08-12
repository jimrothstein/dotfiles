---
name: get_news.md
description: |
  Use this skill to fetch and display news from KDnuggets, including blog posts.  For  example, if the user says "fetch KDnuggets news" or "get blog news"
  Use when the user wants to see recent KDnuggets news, blog updates, podcast episodes, videos, or company announcements. This agent is called by a SKILL 'KDnuggets-news' 
---

# KDnuggets News

Dispatch multiple sub-agents to fetch the latest news from blog posts, podcast episodes, videos, and event announcements and present them to the user.

## Blogs to Fetch

| Blog | URL | Posts |
|------|-----|-------|
| KDnuggets | https://www.kdnuggets.com/news/index.html | 3 |
| Simon Willison | https://simonwillison.net/ | 10 |



## Instructions

1. First, run `date +%Y-%m-%d` to get today's date.

2. Use WebFetch to retrieve all blog URLs in parallel. Use "Fetch each URL with format: 'markdown'" For each blog, use this prompt:
   "Extract the [N] most recent blog posts with title, date, brief description, and URL."
       Note: The KDnuggets blog (`https://www.kdnuggets.com/news/index.html`) is an HTML page 


6. For relative URLs, prepend the source's base URL to form complete links.

7. List all the results in a table:  Title, Shorten URL, description.  For shorten URL, use abbreviations such as TinyURL
Do not include the full URL.

8. Then save table to file:

- prepend Date to "news.qmd"
- use directory /home/jim/
- the contents should be in quarto (.qmd) format.


9. If a URL cannot be retrieved, note the limitation and continue with other sources.


