// ── NAV SCROLL
const navbar = document.getElementById('navbar');
window.addEventListener('scroll', () => {
    navbar.classList.toggle('scrolled', window.scrollY > 40);
});

// ── MOBILE MENU
const navToggle = document.getElementById('navToggle');
const mobileMenu = document.getElementById('mobileMenu');
navToggle.addEventListener('click', () => {
    navToggle.classList.toggle('open');
    mobileMenu.classList.toggle('open');
});
mobileMenu.querySelectorAll('a').forEach(a => {
    a.addEventListener('click', () => {
        navToggle.classList.remove('open');
        mobileMenu.classList.remove('open');
    });
});

// ── LANGUAGE TOGGLE
const langToggle = document.getElementById('langToggle');
const savedLang = localStorage.getItem('nvsc-lang') || 'en';

function setLang(lang) {
    document.body.classList.remove('lang-en', 'lang-th');
    document.body.classList.add('lang-' + lang);
    if (langToggle) langToggle.textContent = lang === 'en' ? 'ภาษาไทย' : 'English';
    localStorage.setItem('nvsc-lang', lang);
}

setLang(savedLang);

if (langToggle) {
    langToggle.addEventListener('click', () => {
        const current = document.body.classList.contains('lang-en') ? 'en' : 'th';
        setLang(current === 'en' ? 'th' : 'en');
    });
}

// ── SCROLL REVEAL
const reveals = document.querySelectorAll('.reveal');
const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => { if (e.isIntersecting) e.target.classList.add('visible'); });
}, { threshold: 0.12 });
reveals.forEach(el => observer.observe(el));

// ── ACTIVE NAV LINK
const navLinks = document.querySelectorAll('.nav-links a');
navLinks.forEach(link => {
    if (link.href === window.location.href) link.classList.add('active');
});

// ── PAGE TRANSITIONS
document.body.classList.add('page-ready');
document.addEventListener('click', e => {
    const link = e.target.closest('a[href]');
    if (!link) return;
    const href = link.getAttribute('href');
    if (!href || href.startsWith('#') || href.startsWith('mailto:') || href.startsWith('tel:')) return;
    if (link.target === '_blank' || e.ctrlKey || e.metaKey || e.shiftKey) return;
    if (link.hostname && link.hostname !== window.location.hostname) return;
    e.preventDefault();
    document.body.classList.remove('page-ready');
    setTimeout(() => { window.location = link.href; }, 220);
});

// ── STAT COUNTERS
const counterEls = document.querySelectorAll('.stat-num[data-count]');
if (counterEls.length) {
    const counterObserver = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (!entry.isIntersecting) return;
            counterObserver.unobserve(entry.target);
            const el = entry.target;
            const target = parseInt(el.dataset.count, 10);
            const duration = 1400;
            const start = performance.now();
            function tick(now) {
                const elapsed = now - start;
                const progress = Math.min(elapsed / duration, 1);
                const eased = 1 - Math.pow(1 - progress, 3);
                const current = Math.floor(eased * target);
                el.childNodes[0].nodeValue = current;
                if (progress < 1) requestAnimationFrame(tick);
                else el.childNodes[0].nodeValue = target;
            }
            requestAnimationFrame(tick);
        });
    }, { threshold: 0.5 });
    counterEls.forEach(el => counterObserver.observe(el));
}

// ── FLOATING BOOK BUTTON — hide when nav-book button is visible
const floatBtn = document.querySelector('.float-book');
if (floatBtn) {
    const navBook = document.querySelector('.btn-nav');
    const hideObserver = new IntersectionObserver(entries => {
        entries.forEach(e => {
            floatBtn.classList.toggle('hidden', e.isIntersecting);
        });
    }, { threshold: 0.5 });
    if (navBook) hideObserver.observe(navBook);
}
