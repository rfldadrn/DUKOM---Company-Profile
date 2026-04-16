// =============================================
// Supabase Configuration
// =============================================
// ⚠️ PENTING: Ganti dengan credentials Supabase Anda!
// Cara mendapatkan:
// 1. Buka: https://supabase.com/dashboard
// 2. Pilih project Anda
// 3. Klik: Settings → API
// 4. Copy "Project URL" dan "anon public" key
// =============================================

const SUPABASE_CONFIG = {
  // ✅ URL Supabase Anda
  url: 'https://quwziwvgrlezvxhulidf.supabase.co',
  
  // ❌ MASIH PERLU DIISI! Ganti dengan anon key Anda
  // Cara mendapatkan:
  // 1. Buka: https://supabase.com/dashboard/project/quwziwvgrlezvxhulidf/settings/api
  // 2. Copy "anon public" key di bagian "Project API keys"
  // 3. Paste di bawah (replace YOUR_SUPABASE_ANON_KEY)
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF1d3ppd3ZncmxlenZ4aHVsaWRmIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzYyMjU1MDksImV4cCI6MjA5MTgwMTUwOX0.woxYyP_9PZ_s0_3MQpmSmoRz9Ne4CuOXLZc_Qf6pu3E'
}

// Company code untuk demo (sesuaikan dengan data di database Anda)
// Untuk sample data TechStore, gunakan: 'techstore-001'
const COMPANY_CODE = 'cp-dukom-pdg'

// Validasi config
function validateConfig() {
  const errors = []
  
  if (!SUPABASE_CONFIG.url || SUPABASE_CONFIG.url === 'YOUR_SUPABASE_URL') {
    errors.push('❌ Supabase URL belum diisi!')
  } else if (!SUPABASE_CONFIG.url.match(/^https?:\/\//)) {
    errors.push('❌ Supabase URL harus dimulai dengan http:// atau https://')
  }
  
  if (!SUPABASE_CONFIG.anonKey || SUPABASE_CONFIG.anonKey === 'YOUR_SUPABASE_ANON_KEY') {
    errors.push('❌ Supabase anon key belum diisi!')
  }
  
  if (!COMPANY_CODE || COMPANY_CODE === 'YOUR_COMPANY_CODE') {
    errors.push('❌ Company code belum diisi!')
  }
  
  return errors
}

// Export config
window.SUPABASE_CONFIG = SUPABASE_CONFIG
window.COMPANY_CODE = COMPANY_CODE
window.validateSupabaseConfig = validateConfig
