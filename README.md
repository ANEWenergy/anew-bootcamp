# ANEW Boot Camp — Manufacturing Simulator

A lightweight hub (index.html) plus one .html file per trade. The learner opens
index.html and taps a trade; that trade's file loads behind the scenes and the
lesson plays inside the same simulator screen. Each trade file can also be
opened on its own — it launches the simulator focused on that trade.

## What's in the package

```
index.html                              The hub: catalog, navigation, survey,
                                        leaderboard, UI, audio engine (~0.5 MB).
trades/
  Advanced Mold Making.html             5 modules
  PCB Design.html                       3 modules, 30 lessons
  Embedded Microprocessors.html         1 module, 8 lessons
  intro-song.m4a                        Intro song (loaded by the hub)
```

## The workflow you asked for

To build out a trade: open its file (e.g. "PCB Design.html"), edit the lesson
content inside it, save, and drop it back into the trades/ folder. The hub picks
up the updated file automatically the next time that trade is opened. No change
to index.html is needed to update an existing trade's content.

## Important: serve the folder (don't just double-click index.html)

The hub loads each trade by reading its .html file. Web browsers allow this when
the package is served over http(s) — i.e. any normal web host, which is how
funders will view it. Opening index.html straight off the disk (file://) can be
blocked by Chrome's security rules and trades may not load.

For a quick local preview, run a tiny web server from this folder:

    python3 -m http.server 8000      (then visit http://localhost:8000)

or use any static host. When deployed to real hosting, everything just works.

If a trade ever fails to load, the app shows a "try again" screen rather than
breaking, and the intro music falls back to a built-in synthesized track if the
song file can't be played — so a funder demo never breaks or plays silence.

## How a trade loads (for developers)

1. Learner taps a trade card -> openTrade(id) shows a brief loading screen.
2. ANEW.loadTrade(id) fetches the trade's .html file and runs the script tagged
   <script id="trade-content"> inside it.
3. That script calls ANEW.registerTrade(id, course); the course screen renders.
4. Loaded trades are cached; reopening is instant.

Opened directly, a trade file finds no hub present and redirects to
index.html#trade=<id>, which launches the simulator focused on that trade.

## Adding a NEW trade

1. Copy an existing trade file (Embedded Microprocessors.html is the smallest
   template) to a new name, e.g. "Robotics & PLC.html".
2. Edit the <script id="trade-content"> block: change the module/lesson content
   and the final ANEW.registerTrade('<id>', COURSE_X) call so '<id>' is the new
   trade's id. Also set the TID near the bottom bootstrap to the same '<id>'.
   Each learner-facing string uses L(en, es) for bilingual text; each quiz item
   has opts and a (the 0-based index of the correct option).
3. In index.html:
   - Add the file to the ANEW.tradeFiles map:  '<id>':'trades/<Your File>.html'
   - In the TRADES array, set that trade live:  live:true, mods:N, lang:'EN · ES'
That's all — each trade is built and tested on its own.
