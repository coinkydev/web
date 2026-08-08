import { translations } from './translations.js';

// Theme Toggle
const themeBtn = document.getElementById('theme-toggle');
const htmlEl = document.documentElement;

themeBtn.addEventListener('click', () => {
  htmlEl.classList.toggle('dark');
  htmlEl.classList.toggle('light');
});

// Localization Setup
const langSelect = document.getElementById('lang-select');
let currentLang = localStorage.getItem('coinky_lang') || getInitialLang();

function getInitialLang() {
  const navLang = navigator.language || navigator.userLanguage || 'en';
  if (navLang.startsWith('pt')) return 'pt';
  if (navLang.startsWith('es')) return 'es';
  return 'en';
}

function updateLanguage(lang) {
  currentLang = lang;
  localStorage.setItem('coinky_lang', lang);
  if (langSelect) langSelect.value = lang;

  const t = translations[lang] || translations.en;

  document.querySelectorAll('[data-i18n]').forEach(el => {
    const key = el.getAttribute('data-i18n');
    if (t[key]) {
      el.textContent = t[key];
    }
  });

  // Refresh Showcase Content
  const activeTab = document.querySelector('.tab-btn.active');
  if (activeTab) {
    const key = activeTab.getAttribute('data-key') || '01';
    renderShowcase(key, lang);
  }
}

function renderShowcase(key, lang = currentLang) {
  const data = (translations[lang] || translations.en).showcase_data[key];
  if (data) {
    showcaseTitle.textContent = data.title;
    showcaseDesc.textContent = data.desc;
    showcaseList.innerHTML = data.list.map(item => `<li>${item}</li>`).join('');
  }
}

// App Showcase Tab Switcher
const tabBtns = document.querySelectorAll('.tab-btn');
const showcaseImg = document.getElementById('showcase-screen');
const showcaseTitle = document.getElementById('showcase-title');
const showcaseDesc = document.getElementById('showcase-desc');
const showcaseList = document.getElementById('showcase-list');

tabBtns.forEach(btn => {
  btn.addEventListener('click', () => {
    tabBtns.forEach(b => b.classList.remove('active'));
    btn.classList.add('active');

    const imgSrc = btn.getAttribute('data-img');
    const key = btn.getAttribute('data-key');

    if (imgSrc) showcaseImg.src = imgSrc;
    if (key) renderShowcase(key);
  });
});

if (langSelect) {
  langSelect.value = currentLang;
  langSelect.addEventListener('change', (e) => {
    updateLanguage(e.target.value);
  });
}

// Initialize on page load
updateLanguage(currentLang);

// Savings Calculator Widget
const spendInput = document.getElementById('monthly-spend');
const trimInput = document.getElementById('budget-trim');
const spendVal = document.getElementById('spend-val');
const trimVal = document.getElementById('trim-val');
const monthlySavingsEl = document.getElementById('monthly-savings');
const yearlySavingsEl = document.getElementById('yearly-savings');

function updateCalculator() {
  const spend = parseFloat(spendInput.value);
  const trimPct = parseFloat(trimInput.value);

  spendVal.textContent = `$${spend.toLocaleString()}`;
  trimVal.textContent = `${trimPct}%`;

  const monthlySavings = (spend * (trimPct / 100));
  const yearlySavings = monthlySavings * 12;

  monthlySavingsEl.textContent = `$${Math.round(monthlySavings).toLocaleString()}`;
  yearlySavingsEl.textContent = `$${Math.round(yearlySavings).toLocaleString()}`;
}

if (spendInput && trimInput) {
  spendInput.addEventListener('input', updateCalculator);
  trimInput.addEventListener('input', updateCalculator);
  updateCalculator();
}

// FAQ Accordion
const faqItems = document.querySelectorAll('.faq-item');

faqItems.forEach(item => {
  const questionBtn = item.querySelector('.faq-question');
  questionBtn.addEventListener('click', () => {
    const isActive = item.classList.contains('active');
    faqItems.forEach(i => i.classList.remove('active'));
    if (!isActive) {
      item.classList.add('active');
    }
  });
});
