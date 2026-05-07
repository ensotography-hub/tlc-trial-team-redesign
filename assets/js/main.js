// v3 — minimal JS. Lenis smooth scroll removed (was janky on this build).
// Native CSS scroll-behavior: smooth handles anchor links.
// Mobile drawer toggle only.

document.addEventListener('DOMContentLoaded', () => {
  const burger = document.querySelector('.burger');
  if (burger) {
    burger.addEventListener('click', () => {
      const links = document.querySelector('.nav-links');
      if (!links) return;
      const open = links.style.display === 'flex';
      links.style.display = open ? '' : 'flex';
      links.style.position = 'absolute';
      links.style.top = '76px';
      links.style.left = '0';
      links.style.right = '0';
      links.style.flexDirection = 'column';
      links.style.background = '#fff';
      links.style.padding = '1.5rem var(--pad-x)';
      links.style.borderBottom = '1px solid var(--line-soft)';
      links.style.gap = '1.2rem';
    });
  }
});
