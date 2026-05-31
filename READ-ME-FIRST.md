# Manufacturing Boot Camp — Test Package

This is a complete, self-contained copy of the app you can test on your own
computer before deploying. Nothing here connects to the internet except the
YouTube thumbnails and the software install links (which is the point).

---

## Two ways to test

### Option A — Quickest (double-click index.html)
Just double-click **index.html**. It opens in your browser and you can test
everything: all 34 trades, the software tool panels, the install links, the
intro videos, the banners, the syllabi.

The ONE thing that won't work this way: the **Advanced Mold Making** lessons
(the only trade with full built-out lessons). Browsers block local file loading
for those. Everything else works perfectly.

### Option B — Full test (recommended) — runs a tiny local server
This makes 100% of the app work, including Mold's lessons.

- **Mac:** double-click **START-HERE-Mac.command**
- **Windows:** double-click **START-HERE-Windows.bat**

A small black window opens and your browser launches the app automatically.
Leave that window open while testing. Close it when you're done.
(This uses Python, which is built into most Macs and many PCs. If it says
Python isn't installed, just use Option A above.)

---

## What to check (your test checklist)

1. **Software tool panel** — Open any trade (e.g. PCB Design, CNC, Project
   Management). At the top of the curriculum you should see an orange-bordered
   box titled **"Software for this trade"** with:
   - the tool name (e.g. Autodesk Fusion 360),
   - a short description,
   - an intro video you can click to play,
   - a big orange **Install** button (opens the official download page),
   - an **Open on YouTube** link.

2. **Tool assignments** — Most trades point to Autodesk Fusion 360 (CAD/CAM/CAE/
   electronics/2D drawings, free for students). A few use ProjectLibre, OpenPLC,
   Arduino IDE, Blender, FreeCAD, or Tinkercad where those fit better.

3. **Banners** — Each trade page has a themed illustration banner at the top,
   and each module (in Mold) has a numbered banner.

4. **Syllabus preview** — 33 trades show their planned curriculum grouped into
   modules, marked "in development." Advanced Mold Making has full lessons.

5. **Header** — The top of every page reads "Manufacturing Boot Camp."

6. **Bilingual** — Use the language button (top right) to switch EN / ES and
   confirm the tool panels translate.

---

## When you're happy with it

Deploy by uploading **index.html** to your GitHub repo (Add file → Upload
files → replace index.html → Commit). Netlify republishes in about a minute.
Only index.html changes; the trades/ folder is already on your site.

The correct index.html is about 577 KB and contains the text
"Software for this trade" — handy for confirming the right file is live.
