# Paleoplay GitHub Action

GitHub Action for running the Paleoplay tool for your gamelog.

## Inputs

| Input          | Description                          | Required | Default |
| -------------- | ------------------------------------ | -------- | ------- |
| user           | Steam user to pull screenshots from  | true     | n/a     |
| tinify_api_key | Tinify API key for optimising images | true     | n/a     |

## Outputs

None.

## Steam

The Steam user is the vanity URL from your Steam profile

```
https://steamcommunity.com/id/<user>/
```

## Tinify

Tinify is used to optimse images for size and content. A free account should be fine, but more prolific screenshotters may need to pay. 

You can sign up for a Tinify account on the [TinyPNG Developers page](https://tinypng.com/developers) and check your API consumption on your [Tinify Dashboard](https://tinify.com/dashboard/api).

## Examples

### Action

```yaml
- name: 🎮 Run Paleoplay
  uses: development-and-dinosaurs/paleoplay-github-action@v1
  with:
    user: <user>
    tinify_api_key: ${{ secrets.TINIFY_API_KEY }}
```

### Full Workflow

```yaml
name: 🎮📷 Post Screenshots

on:
  schedule:
    - cron: "55 23 * * *"
  workflow_dispatch:

permissions:
  contents: write

jobs:
  deploy:
    name: 🚀 Deploy Application
    runs-on: ubuntu-latest
    steps:
      - name: 🛒 Checkout code
        uses: actions/checkout@v4
        with:
          token: ${{ secrets.PAT }}
      - name: 🎮📷 Run Paleoplay
        uses: development-and-dinosaurs/paleoplay-github-action@v1
        with:
          user: <user>
          tinify_api_key: ${{ secrets.TINIFY_API_KEY }}
      - name: ⬆️ Push changes
        uses: stefanzweifel/git-auto-commit-action@v5
        with:
          commit_message: Add posts for today  
```
