# Deploy the ANEW Boot Camp demo via GitHub + Netlify

This is the most reliable way to host the demonstrator and update it later.
You upload the files to a GitHub repository once, connect Netlify to that repo,
and from then on every change you push is published automatically.

You do NOT drag any zip or folder onto Netlify with this method.

-------------------------------------------------------------------
## Part 1 — Put the files on GitHub (one time, ~5 minutes)

1. Go to https://github.com and sign in (create a free account if needed).
2. Click the "+" at the top right -> "New repository".
3. Name it something like:  anew-bootcamp
   - Set it to Public (or Private — both work with Netlify).
   - Do NOT check "Add a README" (we already have one).
   - Click "Create repository".
4. On the new empty repo page, click the link
   "uploading an existing file" (in the line "...or upload an existing file").
5. From THIS package, drag these items into the upload box:
       index.html
       netlify.toml
       README.md
       the entire  trades  folder
   (You can drag them all at once. GitHub keeps the folder structure.)
6. Scroll down, click "Commit changes".

Your repo now contains index.html at the top level, with the trades folder
beside it — exactly the structure Netlify needs.

-------------------------------------------------------------------
## Part 2 — Connect Netlify to the repo (one time, ~3 minutes)

1. Go to https://app.netlify.com and sign in.
2. Click "Add new site" -> "Import an existing project".
3. Choose "Deploy with GitHub" and authorize Netlify if it asks.
4. Pick your  anew-bootcamp  repository from the list.
5. Leave the build settings empty/default:
       Build command:   (leave blank)
       Publish directory:  .   (a single dot, or leave as the repo root)
   The netlify.toml in the package already sets this, so defaults are fine.
6. Click "Deploy".

Netlify builds the site and gives you a URL like
   https://something-random-123.netlify.app
Open it — the ANEW hub should load. Done.

-------------------------------------------------------------------
## Updating content later (the workflow you wanted)

To change a trade — say, build out PCB Design:
1. In your GitHub repo, open  trades/pcb-design.html
2. Click the pencil (Edit) icon, make your changes, "Commit changes".
   (Or upload a replacement file with the same name.)
Netlify detects the change and republishes automatically within a minute.
No re-uploading the whole site, no dragging anything.

-------------------------------------------------------------------
## File names (note)

The trade files use simple, space-free names so they work cleanly on the web:
   trades/advanced-mold-making.html
   trades/pcb-design.html
   trades/embedded-microprocessors.html
The names shown to learners inside the app are unchanged (e.g. "PCB Design").
