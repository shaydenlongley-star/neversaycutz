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

// ── GALLERY FILTER
const filterBtns = document.querySelectorAll('.filter-btn');
if (filterBtns.length) {
    filterBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            filterBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            const filter = btn.dataset.filter;
            document.querySelectorAll('.gallery-item-full').forEach(item => {
                item.style.display = (filter === 'all' || item.dataset.cat === filter) ? '' : 'none';
            });
        });
    });
}

// ── ZONE FILTER (locations page)
const zoneBtns = document.querySelectorAll('.zone-btn');
if (zoneBtns.length) {
    zoneBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            zoneBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');
            const zone = btn.dataset.zone;
            document.querySelectorAll('.location-card').forEach(card => {
                card.style.display = (zone === 'all' || card.dataset.zone === zone) ? '' : 'none';
            });
            document.querySelectorAll('.locations-region').forEach(region => {
                const anyVisible = [...region.querySelectorAll('.location-card')].some(c => c.style.display !== 'none');
                region.style.display = anyVisible ? '' : 'none';
            });
        });
    });
}

// ── FIND NEAREST BRANCH
const nearestBtn = document.getElementById('findNearest');
if (nearestBtn) {
    const branchCoords = {
        'thonglor':                  [13.7215, 100.6068],
        'sukhumvit-20':              [13.7374, 100.5601],
        'sukhumvit-51':              [13.7250, 100.6010],
        'onnut':                     [13.7050, 100.6037],
        'ari':                       [13.7745, 100.5479],
        'siam-square-one':           [13.7453, 100.5337],
        'silom':                     [13.7259, 100.5293],
        'town-in-town':              [13.7900, 100.5950],
        'ratchayothin':              [13.8195, 100.5673],
        'central-world':             [13.7466, 100.5393],
        'mbk':                       [13.7459, 100.5294],
        'victoria-gardens-bang-kae': [13.7018, 100.4443],
        'central-pinklao':           [13.7683, 100.4806],
        'don-muang':                 [13.9130, 100.5977],
        'the-circle-ratchapruk':     [13.7302, 100.4549],
        'the-mall-ngamwongwan':      [13.8324, 100.5551],
        'little-walk-bangna':        [13.6743, 100.6108],
        'lasalle':                   [13.6810, 100.6147],
        'the-crystal-park':          [13.8346, 100.6338],
        '101-true-digital-park':     [13.6882, 100.6047],
        'the-nine-rama-9':           [13.7512, 100.5793],
        'the-mall-bangkapi':         [13.7683, 100.6458],
        'the-mall-bangkhae':         [13.7029, 100.4454],
        'covehill':                  [13.7207, 100.4938],
        'the-mall-thapra':           [13.7179, 100.4892],
        'muang-thong':               [13.8895, 100.5551],
        'korat':                     [14.9774, 102.0953],
        'the-bright-rama-ii':        [13.6658, 100.4840],
        'ptt-prachauthit':           [13.7678, 100.5845],
        'ptt-vibhavadi':             [13.8437, 100.5627],
        'ptt-boromratchachonnani':   [13.7743, 100.4228],
        'market-place-nawamin':      [13.8126, 100.5929],
        'charn-at-the-avenue':       [13.8708, 100.5289],
        'the-quarter-silom':         [13.7294, 100.5259],
    };
    const origHTML = nearestBtn.innerHTML;
    nearestBtn.addEventListener('click', () => {
        if (!navigator.geolocation) { alert('Geolocation not supported by your browser.'); return; }
        nearestBtn.textContent = 'Locating\u2026';
        navigator.geolocation.getCurrentPosition(pos => {
            const { latitude: lat, longitude: lng } = pos.coords;
            let nearest = null, minDist = Infinity;
            for (const [slug, [blat, blng]] of Object.entries(branchCoords)) {
                const d = Math.hypot(lat - blat, lng - blng);
                if (d < minDist) { minDist = d; nearest = slug; }
            }
            // Reset filters, show all
            zoneBtns.forEach(b => b.classList.remove('active'));
            const allBtn = document.querySelector('.zone-btn[data-zone="all"]');
            if (allBtn) allBtn.classList.add('active');
            document.querySelectorAll('.location-card, .locations-region').forEach(el => el.style.display = '');
            // Highlight nearest
            document.querySelectorAll('.location-card').forEach(c => c.classList.remove('nearest-branch'));
            const card = document.querySelector(`.location-card[data-slug="${nearest}"]`);
            if (card) {
                card.classList.add('nearest-branch');
                card.scrollIntoView({ behavior: 'smooth', block: 'center' });
            }
            nearestBtn.innerHTML = origHTML;
        }, () => {
            nearestBtn.innerHTML = origHTML;
            alert('Could not get your location. Please check your browser permissions.');
        });
    });
}

// ── CONTACT FORM — Netlify AJAX submit
const contactForm = document.getElementById('contactForm');
if (contactForm) {
    contactForm.addEventListener('submit', async (e) => {
        e.preventDefault();
        const data = new FormData(contactForm);
        await fetch('/', { method: 'POST', headers: { 'Content-Type': 'application/x-www-form-urlencoded' }, body: new URLSearchParams(data).toString() });
        contactForm.style.display = 'none';
        document.getElementById('formSuccess').style.display = 'flex';
    });
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
