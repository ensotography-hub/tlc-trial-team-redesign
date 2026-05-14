// TLC Trial Team — v23
// 1. Mobile drawer toggle
// 2. Sticky CTA: show after hero scroll, hide when footer is in view

document.addEventListener('DOMContentLoaded', () => {
  // ── Mobile burger drawer ──────────────────────────────
  const burger = document.querySelector('.burger');
  const nav = document.querySelector('.nav');
  if (burger && nav) {
    burger.addEventListener('click', () => {
      const open = nav.classList.toggle('nav--open');
      // Inline-styled mobile menu drawer (kept simple, no external CSS need)
      if (open) {
        Object.assign(nav.style, {
          display: 'flex',
          flexDirection: 'column',
          position: 'fixed',
          top: '72px',
          left: '0',
          right: '0',
          background: 'rgba(10, 10, 12, 0.96)',
          backdropFilter: 'blur(14px)',
          padding: '1.5rem 1.5rem 2rem',
          gap: '1rem',
          borderBottom: '1px solid rgba(247, 242, 232, 0.10)',
          zIndex: '49',
        });
      } else {
        nav.removeAttribute('style');
      }
    });
    // Close on link tap
    nav.querySelectorAll('a').forEach(a => {
      a.addEventListener('click', () => {
        nav.classList.remove('nav--open');
        nav.removeAttribute('style');
      });
    });
  }

  // ── Sticky bottom CTA — show on scroll past hero, hide near footer ──
  const cta = document.getElementById('stickyCta');
  const hero = document.querySelector('.hero');
  const footer = document.querySelector('.ftr');
  if (cta && hero && footer) {
    const onScroll = () => {
      const heroBottom = hero.getBoundingClientRect().bottom;
      const footerTop = footer.getBoundingClientRect().top;
      const vh = window.innerHeight;
      // Visible: when hero has scrolled out of view AND footer not yet in view
      const passedHero = heroBottom < vh * 0.4;
      const reachedFooter = footerTop < vh - 80;
      cta.classList.toggle('show', passedHero && !reachedFooter);
    };
    window.addEventListener('scroll', onScroll, { passive: true });
    window.addEventListener('resize', onScroll);
    onScroll();
  }
});
