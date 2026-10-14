# 🍅 Pomodoro Timer — WorkBuddy Skill

A self-contained Pomodoro timer web tool packaged as a WorkBuddy AI skill. Single HTML file, zero dependencies.

## Features

- **25-minute countdown** with SVG circular progress ring
- **Start / Pause / Reset** controls (keyboard: `Space` = start/pause, `R` = reset)
- **Ambient light music** — real-time generated via Web Audio API (C major pentatonic random melody + delay reverb + white noise floor)
- **Canvas frequency visualizer** — 28 gradient bars driven by AnalyserNode, color shifts red→green on completion
- **Completion bell** — A major triad sine-wave chime with decay envelope
- **Task completion modal** — asks "这件事完成了吗?" on timer finish
- **Focus logging** — each session stored in localStorage (start time, end time, duration, completed status)
- **Today's stats** — total focus minutes, completed/incomplete counts, collapsible session log
- **Clean warm-toned design** — cream background, tomato-red accents

## Quick Start

1. Download `assets/pomodoro.html`
2. Open it in any modern browser
3. No build step, no dependencies, no external assets required

## Skill Structure

```
pomodoro-timer/
├── SKILL.md              # Skill metadata and instructions
└── assets/
    └── pomodoro.html      # The complete timer tool (~800 lines, single file)
```

## Customization

Edit `assets/pomodoro.html` directly:

| What | Where |
|------|-------|
| Timer duration | `TOTAL_SECONDS` in `<script>` |
| Colors | CSS rules (`.progress-ring__fg`, `.btn-primary`, etc.) |
| Music scale | `scale` array in `startLightMusic()` |
| Bell sound | `freqs` array in `playBell()` |
| Visualizer bars | `barCount` in `startVisualizer()` |

## Install as WorkBuddy Skill

1. Copy or symlink the `pomodoro-timer/` directory to `~/.workbuddy-ai/skills/`
2. Restart WorkBuddy AI (or reload skills)
3. Ask WorkBuddy to "create a pomodoro timer" — the skill will be triggered automatically

## License

MIT
