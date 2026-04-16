// =============================================
// Supabase Configuration - EXAMPLE
// =============================================
// Copy file ini menjadi 'config.js' dan isi dengan credentials Anda
// Jangan commit config.js ke Git (sudah ada di .gitignore)
// =============================================

const SUPABASE_CONFIG = {
  // 1. Dapatkan URL dari: Supabase Dashboard → Settings → API → Project URL
  url: 'https://xxxxxxxxxxxxxxxxx.supabase.co',
  
  // 2. Dapatkan anon key dari: Supabase Dashboard → Settings → API → Project API keys → anon public
  anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inh4eHh4eHh4eHh4eCIsInJvbGUiOiJhbm9uIiwiaWF0IjoxNjAwMDAwMDAwLCJleHAiOjE5MTUzNjAwMDB9.xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx'
}

// Company code untuk demo
// Pastikan ini sesuai dengan company_code di database Anda
// Untuk TechStore sample data, gunakan: 'techstore-001'
const COMPANY_CODE = 'techstore-001'

// Export config
window.SUPABASE_CONFIG = SUPABASE_CONFIG
window.COMPANY_CODE = COMPANY_CODE

// =============================================
// SECURITY NOTES:
// =============================================
// ⚠️ Anon key BOLEH di-expose di frontend (ini public key)
// ⚠️ JANGAN taruh service_role key di sini! (itu secret key)
// ⚠️ RLS (Row Level Security) di Supabase harus diaktifkan
// =============================================
