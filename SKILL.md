---
name: pomodoro-timer
description: A self-contained Pomodoro timer web tool (single HTML file, zero
  dependencies). This skill should be used when the user asks to create,
  generate, or set up a pomodoro timer, focus timer, or 25-minute countdown
  productivity timer. Also triggers on requests for a "番茄钟", "专注计时器",
  or similar productivity timer with background sound and completion alerts.
agent_created: true
---

# Pomodoro Timer

## Overview

A self-contained Pomodoro timer web tool shipped as a single HTML file with zero
external dependencies. It provides a 25-minute countdown, start/pause/reset
controls, ambient light music with white noise, a completion bell, a task
completion modal, and automatic focus-duration logging with localStorage
persistence.

## Features

- **25-minute countdown** with SVG circular progress ring
- **Start / Pause / Reset** controls (keyboard: Space = start/pause, R = reset)
- **Ambient light music** generated in real-time via Web Audio API — C major
  pentatonic random melody (sine + triangle oscillators), delay reverb, and
  white-noise floor
- **Canvas frequency visualizer** — 28 gradient bars driven by an AnalyserNode,
  color shifts from red (focusing) to green (complete)
- **Completion bell** — A major triad sine-wave chime with decay envelope
- **Task completion modal** — asks "这件事完成了吗?" on timer finish, records
  the answer
- **Focus logging** — each session (start time, end time, duration, completed
  status) is stored in localStorage; today's stats (total minutes, done count,
  incomplete count) displayed on screen with a collapsible session log
- **Clean, warm-toned design** — light cream background, tomato-red accents,
  green on completion

## Usage

To deploy the timer, copy the bundled HTML file to the desired location and
open it in a browser:

1. Copy `assets/pomodoro.html` to the user's desired directory.
2. Open the file directly in a browser, or serve it via any static HTTP server.
3. No build step, no dependencies, no external assets required.

To preview during a WorkBuddy session, use `present_files` with the HTML file
path — the built-in preview panel renders it with full audio support.

## Customization

The timer is fully self-contained. Common modifications:

- **Duration**: change `TOTAL_SECONDS` in the `<script>` section.
- **Colors**: edit CSS variables (`.progress-ring__fg` stroke, `.btn-primary`
  background, etc.).
- **Music scale**: modify the `scale` array in `startLightMusic()`.
- **Bell sound**: modify frequencies in `playBell()`.

## Resources

### assets/pomodoro.html

The complete, ready-to-use Pomodoro timer web tool. Single file, ~800 lines,
no external dependencies. Copy and open in any modern browser.
