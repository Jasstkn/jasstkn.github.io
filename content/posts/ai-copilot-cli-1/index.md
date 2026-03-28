---
author: "Mariia Kotliarevskaia"
title: "AI and Copilot CLI #1"
date: "2026-03-28"
description: "Research on AI tools, skills and agents for effective development with Github Copilot CLI"
tags: [ai, tools, productivity]
cover:
    image: "images/ai-copilot-cli-1.png"
    alt: "GitHub Copilot"
    hidden: false
    hiddenInSingle: false
    hiddenInList: false
---

While I was at KubeCon, I intentionally didn't attend any AI talks. But of course, the topic of automating development processes and improving productivity with AI tools is still on the top of my mind.

Let's face some facts:

- you will be using generative AI for coding
- your colleagues will be using generative AI, it's especially important in projects with a lot of unfamiliar codebase

I discussed this topic with some of my friends and colleagues, and despite mostly positive feedback, there's still a big problem with generating high-quality code that is easy to maintain, test and read.

In theory, this problem should have been already solved by the previous generation of tools (in my case, it's mostly VSCode extensions like Cline/Roo Code), but every tool introduced its own abstractions and formats. Now we are all left with the need to rewrite all of these files into `<something new>`. This time I am trying to be more mindful and not rushing into the rewriting right away after switching fully to Github Copilot CLI.

This is how I actually started my research on how to write skills, compose agents and generally work effectively with Github Copilot CLI. Here is what I found so far.

## Videos

- [Spec-Driven Development: AI Assisted Coding Explained](https://youtu.be/mViFYTwWvcM?si=UhikYomkFDqBIGF8)

  I liked that the video explains in detail the differences between spec driven development and vibe coding.

- [The 6 Levels of Claude Code Explained](https://youtu.be/TUKYbUIXLOE?si=0u7g_BXOvGcLWLwW)

  A detailed video about different levels of 'sophistication' in using AI.

- A few videos from [Burke Holland's channel](https://www.youtube.com/@BurkeHolland) (very high quality content in terms of practicality and lack of fluff)

  - [You can build your own personal AI assistant - it's super easy](https://youtu.be/PEtM45hG-5A?si=76LBPMXibUMQvj78)

    A practical video on using Github Copilot SDK + Telegram Bot for building various automations, e.g. an AI assistant.

  - [You need to try the GitHub Copilot CLI right now](https://youtu.be/CqcqWLv-sDM?si=W9Ecz-HBQnyXyo1d)

    Very detailed description of all the main features and how to set up VSCode for effective work. I plan to steal almost everything for myself.

## Articles

- [Github CLI best practices](https://docs.github.com/en/copilot/how-tos/copilot-cli/cli-best-practices)

  A great article if you are planning to adopt Github Copilot CLI in your development or your team's/project's development.

- [Go Modern Guidelines Skill by JetBrains](https://github.com/JetBrains/go-modern-guidelines/tree/main)

  Recent Go releases have been adding more and more syntactic sugar and new constructs. This skill helps to find outdated patterns in the existing codebase or generate new code without them.

- [Practical Guide to Evaluating and Testing Agent Skills](https://www.philschmid.de/testing-skills)

  A practical guide on how to test AI skills. I think it would be useful, if you are planning to write your own skills or want to adopt this pattern in your team. Testing is essential for critical execution paths, e.g. it's working with sensitive data or performing actions in production.
