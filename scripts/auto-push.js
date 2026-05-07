#!/usr/bin/env node
/* TLC Trial Team — auto-push watcher.
 * Watches the repo for file changes, debounces 5s, then auto-commits + pushes.
 * Run via auto-push.command (which Giovani double-clicks once and leaves open). */

const { execSync, spawnSync } = require('child_process');
const fs = require('fs');
const path = require('path');

const REPO = path.resolve(__dirname, '..');
const IGNORE = ['.git', 'node_modules', '_screenshots', '.DS_Store', '.vercel', '.next'];
const DEBOUNCE_MS = 5000;

let timer = null;
let pending = new Set();

function ts() { return new Date().toLocaleTimeString('en-US', { hour12: false }); }

function shouldIgnore(filename) {
  if (!filename) return true;
  return IGNORE.some(i => filename.startsWith(i + '/') || filename === i || filename.includes('/' + i + '/'));
}

function push() {
  process.chdir(REPO);
  const status = execSync('git status --porcelain', { encoding: 'utf8' });
  if (!status.trim()) {
    console.log(`[${ts()}] (nothing to commit)`);
    pending.clear();
    return;
  }

  const files = Array.from(pending).slice(0, 5);
  pending.clear();
  const filesSummary = files.length ? files.join(', ') : 'misc';
  const msg = `auto: ${filesSummary}`;

  try {
    execSync('git add -A');
    execSync(`git commit -m ${JSON.stringify(msg)}`);
    console.log(`[${ts()}] committed: ${msg}`);
    const r = spawnSync('git', ['push', 'origin', 'main'], { encoding: 'utf8' });
    if (r.status === 0) {
      console.log(`[${ts()}] ✓ pushed → vercel deploying (~30s)`);
      console.log(`         live: https://tlc-trial-team-redesign.vercel.app`);
    } else {
      console.error(`[${ts()}] ✗ push failed:`);
      console.error(r.stderr || r.stdout);
    }
  } catch (e) {
    console.error(`[${ts()}] error:`, e.message);
  }
}

function debounce(filename) {
  pending.add(filename);
  if (timer) clearTimeout(timer);
  timer = setTimeout(push, DEBOUNCE_MS);
}

console.log('================================================');
console.log('  TLC Trial Team — AUTO-PUSH WATCHER');
console.log('================================================');
console.log('');
console.log(`Watching: ${REPO}`);
console.log(`Debounce: ${DEBOUNCE_MS / 1000}s after last change`);
console.log(`Live URL: https://tlc-trial-team-redesign.vercel.app`);
console.log('');
console.log('Leave this window open. Close it to stop auto-pushing.');
console.log('');

// Initial sync — push any uncommitted changes that already exist
push();

fs.watch(REPO, { recursive: true }, (event, filename) => {
  if (shouldIgnore(filename)) return;
  console.log(`[${ts()}] changed: ${filename}`);
  debounce(filename);
});
