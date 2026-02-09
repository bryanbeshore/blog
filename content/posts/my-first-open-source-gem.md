---
title: "My First Open Source Gem"
date: 2026-02-09
description: "Why I built QueryLens and gave it away."
---

At [Topkey](https://www.topkey.io/), data questions come from everywhere. Customer success wants to know which accounts have the highest transaction volume. Ops wants onboarding completion rates. Finance wants revenue breakdowns by plan.

We've used [Blazer](https://github.com/ankane/blazer) for years and it's excellent — if you can write SQL. But the people who need answers most urgently are rarely the ones who can write queries. So engineers become the bottleneck for ad-hoc data requests, and that's time not spent building product.

I kept thinking: what if Blazer could just understand English?

## Learning by Building, Again

If you've read this blog before, you know the pattern. My [Shopify experiment](/posts/a-shopify-experiment) was about learning Python. That project accidentally turned into a six-figure business that I eventually [walked away from](/posts/walking-away-from-easy-money) because it wasn't the right path. I learn best by building real things in live environments. Want to learn French? Live in France.

QueryLens started the same way — scratch your own itch, build something real, learn in the arena. The difference this time is what I did with it. Instead of keeping it internal, I packaged it up and shipped it as an open source Ruby gem. My first.

## What It Does

You mount QueryLens in your Rails app, point it at your database, and ask questions in plain English. "Show me total revenue by plan for the last 6 months." An LLM generates the SQL, validates it through multiple safety layers, executes it read-only, and displays the results. Follow-up questions refine the query using conversation context — just like chatting with a DBA who knows your schema.

I built this at a fintech company. We can't be sloppy with database access. So QueryLens enforces 10 layers of safety — read-only transactions, SQL parsing, statement and function blocklists, query timeouts, row limits, table exclusions, and audit logging. Every query, every blocked attempt, everything is tracked.

It's powered by [RubyLLM](https://github.com/crmne/ruby_llm), which means it works with OpenAI, Anthropic, Gemini, DeepSeek, or fully local with Ollama. Zero API costs if you want them. Zero data leaving your network.

Here's a [quick demo](https://www.loom.com/share/595ed0ea3c1f42b28152a345db586c85) if you want to see it in action.

## The Bet

Open source is a different kind of bet than I'm used to. You're giving something away. There's no revenue line, no conversion metric, no six-figure upside. But the Rails community gave me Rails. Andrew Kane gave me Blazer. Carmine Paolino gave me RubyLLM. Every tool I've built on top of for the last decade was someone else's contribution.

QueryLens is my first contribution back. It feels overdue and it feels right.

If you're running Rails and want to try it, I built a [testbed app](https://github.com/bryanbeshore/query_lens_testbed) with a realistic SaaS dataset so you can be up and running in two minutes without touching your own database.

- [QueryLens on GitHub](https://github.com/bryanbeshore/query_lens)
- [QueryLens on RubyGems](https://rubygems.org/gems/query_lens)
- [Testbed App](https://github.com/bryanbeshore/query_lens_testbed)

Onward and upward.
