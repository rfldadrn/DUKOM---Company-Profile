// =============================================
// TechStore - Main Application
// Fetch and display data from Supabase
// =============================================

// Initialize Supabase Client
const { createClient } = supabase
let supabaseClient = null

// State Management
const appState = {
  companyData: null,
  companyProfile: null,
  offerings: [],
  isLoading: true
}

// =============================================
// Initialization
// =============================================
async function initApp() {
  try {
    console.log('🚀 Initializing TechStore App...')
    
    // Validate configuration
    if (window.validateSupabaseConfig) {
      const configErrors = window.validateSupabaseConfig()
      if (configErrors.length > 0) {
        const errorMsg = '\n\n⚠️ KONFIGURASI BELUM DIISI!\n\n' +
          configErrors.join('\n') +
          '\n\n📝 Cara mengisi:\n' +
          '1. Buka file: config.js\n' +
          '2. Ganti YOUR_SUPABASE_URL dengan URL Supabase Anda\n' +
          '3. Ganti YOUR_SUPABASE_ANON_KEY dengan anon key Anda\n' +
          '4. Refresh browser\n\n' +
          '💡 Lihat file QUICK-START.md untuk panduan lengkap'
        
        console.error(errorMsg)
        throw new Error('Configuration not completed. Please update config.js')
      }
    }
    
    // Check if config is loaded
    if (!window.SUPABASE_CONFIG || !window.SUPABASE_CONFIG.url || !window.SUPABASE_CONFIG.anonKey) {
      throw new Error('⚠️ Supabase configuration not found! Please check config.js')
    }
    
    // Initialize Supabase client
    supabaseClient = createClient(
      window.SUPABASE_CONFIG.url,
      window.SUPABASE_CONFIG.anonKey
    )
    
    console.log('✅ Supabase client initialized')
    
    // Fetch all data
    await fetchCompanyData()
    await fetchOfferings()
    
    // Render UI
    renderCompanyProfile()
    renderProducts()
    
    // Hide loading overlay
    hideLoading()
    
    console.log('✅ App initialized successfully!')
    
  } catch (error) {
    console.error('❌ Error initializing app:', error)
    
    // Better error messages
    let errorMsg = 'Gagal memuat aplikasi. '
    
    if (error.message.includes('Invalid supabaseUrl')) {
      errorMsg = '⚠️ KONFIGURASI BELUM DIISI!\n\n' +
        'File config.js masih berisi placeholder.\n\n' +
        'Langkah perbaikan:\n' +
        '1. Buka file: config.js\n' +
        '2. Ganti YOUR_SUPABASE_URL dengan URL Supabase Anda\n' +
        '3. Ganti YOUR_SUPABASE_ANON_KEY dengan anon key Anda\n' +
        '4. Save dan refresh browser\n\n' +
        '📖 Baca QUICK-START.md untuk panduan lengkap'
    } else if (error.message.includes('not found')) {
      errorMsg += '\n\nCompany dengan code "' + window.COMPANY_CODE + '" tidak ditemukan.\n' +
        'Pastikan sudah menjalankan sample-data-techstore.sql'
    } else if (error.message.includes('Configuration not completed')) {
      errorMsg = '⚠️ Silakan lengkapi konfigurasi di file config.js\n\n' +
        'Buka file config.js dan isi:\n' +
        '- SUPABASE_CONFIG.url\n' +
        '- SUPABASE_CONFIG.anonKey\n\n' +
        'Lihat QUICK-START.md untuk panduan step-by-step'
    }
    
    showError(errorMsg)
    hideLoading()
  }
}

// =============================================
// Data Fetching Functions
// =============================================

async function fetchCompanyData() {
  try {
    console.log(`📡 Fetching company data for: ${window.COMPANY_CODE}`)
    
    // Fetch company and profile in one query using join
    const { data, error } = await supabaseClient
      .from('companies')
      .select(`
        *,
        company_profiles (*)
      `)
      .eq('company_code', window.COMPANY_CODE)
      .single()
    
    if (error) throw error
    
    if (!data) {
      throw new Error(`Company with code "${window.COMPANY_CODE}" not found`)
    }
    
    appState.companyData = data
    appState.companyProfile = data.company_profiles
    
    console.log('✅ Company data fetched:', data)
    
  } catch (error) {
    console.error('❌ Error fetching company data:', error)
    throw error
  }
}

async function fetchOfferings() {
  try {
    console.log('📡 Fetching offerings...')
    
    if (!appState.companyData) {
      throw new Error('Company data not loaded')
    }
    
    const { data, error } = await supabaseClient
      .from('offerings')
      .select('*')
      .eq('company_id', appState.companyData.id)
      .eq('is_active', true)
      .order('display_order', { ascending: true })
    
    if (error) throw error
    
    appState.offerings = data || []
    
    console.log(`✅ Fetched ${appState.offerings.length} offerings`)
    
  } catch (error) {
    console.error('❌ Error fetching offerings:', error)
    throw error
  }
}

// =============================================
// Rendering Functions
// =============================================

function renderCompanyProfile() {
  const profile = appState.companyProfile
  
  if (!profile) {
    console.warn('⚠️ No company profile data to render')
    return
  }
  
  console.log('🎨 Rendering company profile...')
  
  // Update company name
  updateElement('company-name', profile.display_name)
  updateElement('hero-title', profile.display_name || 'Solusi Komputer Terlengkap')
  
  // Update about section
  updateElement('about-text', profile.about_us || 'Informasi perusahaan akan segera hadir.')
  
  // Update contact info
  updateElement('company-address', profile.address || 'Alamat tidak tersedia')
  
  // Update contact details
  const contactInfo = profile.contact_info || {}
  const contactHTML = `
    ${contactInfo.phone ? `<p>📞 ${contactInfo.phone}</p>` : ''}
    ${contactInfo.email ? `<p>📧 ${contactInfo.email}</p>` : ''}
    ${contactInfo.whatsapp ? `<p>💬 ${contactInfo.whatsapp}</p>` : ''}
  `
  updateElement('company-contact', contactHTML || '<p>Kontak tidak tersedia</p>')
  
  // Update vision & mission
  const visionMission = profile.vision_mission || {}
  updateElement('company-vision', visionMission.vision || 'Visi perusahaan akan segera hadir.')
  
  // Render mission (could be array or string)
  if (visionMission.mission) {
    let missionHTML = ''
    if (Array.isArray(visionMission.mission)) {
      missionHTML = '<ul>' + visionMission.mission.map(m => `<li>${m}</li>`).join('') + '</ul>'
    } else {
      missionHTML = `<p>${visionMission.mission}</p>`
    }
    updateElement('company-mission', missionHTML)
  } else {
    updateElement('company-mission', '<p>Misi perusahaan akan segera hadir.</p>')
  }
  
  // Update branding (logo, colors, etc.)
  const branding = profile.branding || {}
  
  // Set logo if available
  if (branding.logo_url) {
    const logoImg = document.getElementById('logo-img')
    if (logoImg) {
      logoImg.src = getPublicUrl(branding.logo_url)
      logoImg.style.display = 'block'
    }
  }
  
  // Set banner if available
  if (branding.banner_url) {
    const heroBanner = document.getElementById('hero-banner')
    if (heroBanner) {
      heroBanner.style.backgroundImage = `linear-gradient(rgba(37, 99, 235, 0.8), rgba(14, 165, 233, 0.8)), url('${getPublicUrl(branding.banner_url)}')`
    }
  }
  
  // Apply custom colors if available
  if (branding.primary_color) {
    document.documentElement.style.setProperty('--primary-color', branding.primary_color)
  }
  if (branding.secondary_color) {
    document.documentElement.style.setProperty('--secondary-color', branding.secondary_color)
  }
  
  // Update footer
  updateElement('footer-text', `© ${new Date().getFullYear()} ${profile.display_name}. All rights reserved.`)
  
  // Update contact section
  const contactSectionHTML = `
    <p><strong>Alamat:</strong> ${profile.address || '-'}</p>
    ${contactInfo.phone ? `<p><strong>Telepon:</strong> ${contactInfo.phone}</p>` : ''}
    ${contactInfo.email ? `<p><strong>Email:</strong> ${contactInfo.email}</p>` : ''}
    ${contactInfo.whatsapp ? `<p><strong>WhatsApp:</strong> ${contactInfo.whatsapp}</p>` : ''}
  `
  updateElement('contact-info', contactSectionHTML)
  
  console.log('✅ Company profile rendered')
}

function renderProducts() {
  const productsGrid = document.getElementById('products-grid')
  
  if (!productsGrid) {
    console.warn('⚠️ Products grid element not found')
    return
  }
  
  console.log('🎨 Rendering products...')
  
  // Clear skeleton loaders
  productsGrid.innerHTML = ''
  
  if (appState.offerings.length === 0) {
    productsGrid.innerHTML = `
      <div style="grid-column: 1 / -1; text-align: center; padding: 3rem;">
        <p style="font-size: 1.25rem; color: var(--text-light);">
          Belum ada produk yang tersedia saat ini.
        </p>
      </div>
    `
    return
  }
  
  // Render each product
  appState.offerings.forEach(product => {
    const productCard = createProductCard(product)
    productsGrid.appendChild(productCard)
  })
  
  console.log(`✅ Rendered ${appState.offerings.length} products`)
}

function createProductCard(product) {
  const card = document.createElement('div')
  card.className = 'product-card'
  
  // Get image URL (support both storage path and direct URL)
  let imageUrl = 'https://via.placeholder.com/300x220?text=No+Image'
  if (product.image_path) {
    imageUrl = getPublicUrl(product.image_path)
  }
  
  card.innerHTML = `
    <img src="${imageUrl}" 
         alt="${escapeHtml(product.title)}" 
         class="product-image"
         onerror="this.src='https://via.placeholder.com/300x220?text=No+Image'">
    <div class="product-content">
      <h3 class="product-title">${escapeHtml(product.title)}</h3>
      <p class="product-description">${escapeHtml(product.description || 'Deskripsi tidak tersedia')}</p>
      <div class="product-price">${escapeHtml(product.price_label || 'Hubungi Kami')}</div>
      ${product.is_active ? '<span class="product-badge">Tersedia</span>' : ''}
    </div>
  `
  
  return card
}

// =============================================
// Helper Functions
// =============================================

function getPublicUrl(path) {
  if (!path) return ''
  
  // If already a full URL, return as is
  if (path.startsWith('http://') || path.startsWith('https://')) {
    return path
  }
  
  // Otherwise, construct Supabase storage URL
  return supabaseClient.storage
    .from('company-assets')
    .getPublicUrl(path).data.publicUrl
}

function updateElement(id, content) {
  const element = document.getElementById(id)
  if (element) {
    element.innerHTML = content
  }
}

function escapeHtml(text) {
  if (!text) return ''
  const div = document.createElement('div')
  div.textContent = text
  return div.innerHTML
}

function showLoading() {
  const overlay = document.getElementById('loading-overlay')
  if (overlay) {
    overlay.classList.remove('hidden')
  }
}

function hideLoading() {
  const overlay = document.getElementById('loading-overlay')
  if (overlay) {
    overlay.classList.add('hidden')
  }
}

function showError(message) {
  // Show error in overlay instead of alert for better UX
  const overlay = document.getElementById('loading-overlay')
  if (overlay) {
    overlay.innerHTML = `
      <div style="max-width: 600px; background: white; padding: 2rem; border-radius: 12px; color: #1e293b; text-align: left;">
        <h2 style="color: #dc2626; margin-bottom: 1rem;">⚠️ Error</h2>
        <pre style="white-space: pre-wrap; font-family: 'Segoe UI', sans-serif; line-height: 1.6;">${escapeHtml(message)}</pre>
        <div style="margin-top: 1.5rem; padding-top: 1rem; border-top: 1px solid #e5e7eb;">
          <p style="margin-bottom: 0.5rem;"><strong>Butuh bantuan?</strong></p>
          <p style="font-size: 0.9rem; color: #64748b;">Buka browser console (tekan F12) untuk detail error.</p>
        </div>
        <button onclick="location.reload()" style="margin-top: 1rem; padding: 0.75rem 1.5rem; background: #2563eb; color: white; border: none; border-radius: 6px; cursor: pointer; font-weight: 600;">
          🔄 Refresh Page
        </button>
      </div>
    `
    overlay.classList.remove('hidden')
  } else {
    alert(`❌ Error: ${message}`)
  }
}

// =============================================
// Event Listeners
// =============================================

// Smooth scrolling for navigation links
document.addEventListener('DOMContentLoaded', () => {
  const navLinks = document.querySelectorAll('.nav a[href^="#"]')
  
  navLinks.forEach(link => {
    link.addEventListener('click', (e) => {
      e.preventDefault()
      const targetId = link.getAttribute('href').substring(1)
      const targetElement = document.getElementById(targetId)
      
      if (targetElement) {
        targetElement.scrollIntoView({
          behavior: 'smooth',
          block: 'start'
        })
      }
    })
  })
  
  // Initialize app
  initApp()
})

// Add some console styling for debugging
console.log('%c🚀 TechStore App Loaded', 'color: #2563eb; font-size: 20px; font-weight: bold;')
console.log('%cCheck the README.md for setup instructions', 'color: #64748b; font-size: 12px;')
