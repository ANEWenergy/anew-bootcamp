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

## Trade file index (all 35 trades)

Every trade now has its own independently-editable file in `trades/`. Three are
built out; the rest are scaffolded with a starter module, two placeholder
lessons, and an authoring guide inside each file. Edit one file without touching
any other trade or the hub.

Built out:

```
trades/advanced-mold-making.html        Advanced Mold Making      (complete)
trades/pcb-design.html                  PCB Design                (built)
trades/embedded-microprocessors.html    Embedded Microprocessors  (built)
```

Scaffolded — ready for curriculum (id : file):

```
plasticpart  trades/plastic-part-design.html             Plastic Part Design
moldflow     trades/mold-flow-simulations.html           Mold Flow Simulations
molddesign   trades/mold-design.html                     Mold Design
material     trades/material-science.html                Material Science
cnc          trades/cnc-machine-operations.html          CNC Machine Operations
multiaxis    trades/multi-axis-machining.html            Multi-Axis Machining
cycle        trades/calculating-cycle-times.html         Calculating Cycle Times
cadcam       trades/cad-cam-cae-programming.html         CAD/CAM/CAE Programming
weld         trades/automated-welding.html               Automated Welding
seal         trades/seal-dispensing.html                 Seal Dispensing
sheet        trades/sheet-metal-stamping-fabrication.html Sheet Metal Stamping & Fabrication
diestamp     trades/metal-stamping-die-design.html       Metal Stamping & Die Design
fixture      trades/fixture-design.html                  Fixture Design
wire         trades/electrical-wire-schematics.html      Electrical Wire Schematics
pcbmfg       trades/pcb-manufacturing.html               PCB Manufacturing
robot        trades/robotics-plc-programming.html        Robotics & PLC Programming
power        trades/power-system-designs.html            Power System Designs
battery      trades/battery-fundamentals.html            Battery Fundamentals
industrial   trades/industrial-design.html               Industrial Design
styling      trades/product-styling.html                 Product Styling
drawing      trades/drawings-revision-control.html       2D & 3D Drawings & Revision Control
assembly     trades/complex-assembly-design.html         Complex Assembly Design & Management
facility     trades/facility-design.html                 Facility Design
maint        trades/machine-maintenance.html             Machine Maintenance
nesting      trades/nesting-factory-travelers.html       Nesting & Factory Travelers
pid          trades/pid-diagramming.html                 P&ID Diagramming
logic        trades/system-logic-diagrams.html           System Logic Diagrams
pm           trades/project-management.html              Project Management
cost         trades/purchasing-project-costing.html      Purchasing & Project Costing
quality      trades/quality-controls-analytics.html      Quality Controls & Statistical Analytics
safety       trades/safety-regulatory-compliance.html    Safety & Regulatory Compliance
digitaltwin  trades/factory-digital-twin.html            Factory Industrial Design + Digital Twin
```

## Building out a scaffolded trade

1. Open the trade's file in `trades/` (e.g. `cnc-machine-operations.html`).
2. Scroll to the `lesson-content` script block. A commented AUTHORING GUIDE at
   the top explains the format. In short:
   - Each learner-facing string is bilingual: `_L('English','Espanol')`.
     If you only have English, write `_L('English')` for now.
   - A lesson has a `body` array (use `{p:...}` paragraphs and `{ul:[...]}`
     bullet lists) and a `quiz` array. Each quiz item has `opts`, plus `a` =
     the 0-based index of the correct option, and `fb` = feedback text.
   - Copy the `M1` module block to add `M2`, `M3`, ... then list them in
     `modules:[ M1, M2, ... ]`. Keep lesson ids unique (m1l1, m1l2, m2l1, ...).
3. Save and drop the file back into `trades/`. The hub picks it up the next time
   that trade is opened. No change to index.html is required.

Each scaffolded trade already renders in the demo with its placeholder lessons,
so funders see every trade working; replace the placeholders as curriculum is
written.

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
