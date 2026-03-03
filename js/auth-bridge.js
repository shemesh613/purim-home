/**
 * auth-bridge.js — Listens for postMessage from sticker-album React SPA
 * Stores auth state in sessionStorage and updates UI chip in header.
 */
(function () {
  'use strict'

  const AUTH_KEY = 'purim_auth'

  // Listen for auth messages from sticker-album iframe/window
  window.addEventListener('message', function (event) {
    if (!event.data || event.data.type !== 'FB_AUTH_TOKEN') return

    const { uid, displayName } = event.data
    if (!uid) return

    // Store in sessionStorage
    sessionStorage.setItem(AUTH_KEY, JSON.stringify({ uid, displayName }))

    // Update UI
    updateAuthChip(displayName)
  })

  // On load, check if we have stored auth
  function init() {
    try {
      const stored = sessionStorage.getItem(AUTH_KEY)
      if (stored) {
        const { displayName } = JSON.parse(stored)
        updateAuthChip(displayName)
      }
    } catch (e) {
      // Ignore parse errors
    }
  }

  function updateAuthChip(displayName) {
    const chip = document.getElementById('auth-status')
    if (!chip) return

    if (displayName) {
      chip.textContent = '👤 ' + displayName
      chip.classList.add('logged-in')
    } else {
      chip.textContent = '👤 אורח'
      chip.classList.remove('logged-in')
    }
  }

  // Init when DOM is ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init)
  } else {
    init()
  }
})()
