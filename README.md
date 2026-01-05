# Bryan Beshore's Blog

Personal blog built with Rails 8 and Tailwind CSS.

## Development

```bash
cd blog
bundle install
bin/rails db:create
bin/dev
```

Visit http://localhost:3000

## Adding Posts

Create a new markdown file in `content/posts/`:

```markdown
---
title: "Your Post Title"
date: 2026-01-05
description: "A brief description for previews."
---

Your content here...
```

## Deployment

Deployed to Heroku. Push to main branch to deploy.

```bash
git push heroku main
```
