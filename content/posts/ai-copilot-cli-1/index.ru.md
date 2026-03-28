---
author: "Maria Kot"
title: "AI и Copilot CLI #1"
date: "2026-03-28"
description: "Ресерч об AI инструментах, скиллах и агентах для эффективной разработки с Github Copilot CLI"
tags: [ai, tools, productivity]
ShowToc: true
cover:
    image: "cover.png"
    alt: "GitHub Copilot"
    relative: true
    hidden: false
    hiddenInList: false
    hiddenInSingle: false
---

За все время только прошедшего кубкона я не была ни на одном докладе по AI.
Но тема автоматизации процессов разработки и повышения эффективности работы с AI остается для меня одной из самых актуальных.

Нужно принять несколько фактов:

- в том или ином виде ты будешь использовать генеративный AI в работе
- твои коллеги будут использовать генеративный AI, особенно важным этот факт становится в местах, где много незнакомой кодовой базы

Я поспрашивала знакомых об опыте и несмотря на в основном позитивный фидбек, все еще остается большая проблема с написанием качественного кода, который легко поддерживать, тестировать и читать.

Поидее, эту проблему должны были решить и инструменты предыдущего поколения (в моем случае это в основном экстеншны для VSCode по типу Cline/Roo Code), но они использовали свой собственный формат.
Теперь этот формат нужно переписывать и конечно делать это каждые несколько месяцев совсем не хочется.

Здесь и начался мой ресерч о том, как вообще писать skills, agents и в целом эффективнее работать с Github Copilot CLI.

## Видео

- [Spec-Driven Development: AI Assisted Coding Explained](https://youtu.be/mViFYTwWvcM?si=UhikYomkFDqBIGF8)

  Понравилось, что в видео подробно объясняют разницы между spec driven development и vibe coding.

- [The 6 Levels of Claude Code Explained](https://youtu.be/TUKYbUIXLOE?si=0u7g_BXOvGcLWLwW)

  Подробное видео о разных уровнях 'продвинутости' в использовании AI.

- Несколько видео с канала Берка Холланда (очень крутое качество контента по уровню практичности и отсутствию воды)

  - [You can build your own personal AI assistant - it's super easy](https://youtu.be/PEtM45hG-5A?si=76LBPMXibUMQvj78)

    Практическое видео по Github Copilot SDK + Telegram Bot.

  - [You need to try the GitHub Copilot CLI right now](https://youtu.be/CqcqWLv-sDM?si=W9Ecz-HBQnyXyo1d)

    Очень подробно описываются все основные фичи и как настроить VSCode для эффективной работы. Планирую почти все утащить себе.

## Статьи

- [Github CLI best practices](https://docs.github.com/en/copilot/how-tos/copilot-cli/cli-best-practices)

  Отличная статья если вы собираетесь внедрять Github Copilot CLI в свою разработку или разработку команды/проекта.

- [Скилл от JetBrains для написания современного Go кода](https://github.com/JetBrains/go-modern-guidelines/tree/main)

  В последних релизах добавляют все больше и больше синтаксического сахара и новых конструкций. Этот скилл помогает находить устаревшие паттерны в существующей кодовой базе и генерировать новый код без них.

- [Practical Guide to Evaluating and Testing Agent Skills](https://www.philschmid.de/testing-skills)

  Гайд по тестированию скиллов для агента. Пригодится, если команда пишет много скиллов и использует их для работы с sensitive информацией/безопасность/продакшн окружениями.
