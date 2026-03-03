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
    if (langToggle) langToggle.textContent = lang === 'en' ? 'TH' : 'EN';
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
