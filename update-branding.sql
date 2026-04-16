-- =============================================
-- Update Branding (Logo, Banner, Colors)
-- =============================================

-- CARA 1: Update semua branding sekaligus
-- =============================================
UPDATE company_profiles
SET branding = '{
  "logo_url": "branding/toko-komputer-xyz/logo.png",
  "banner_url": "branding/toko-komputer-xyz/banner.jpg",
  "primary_color": "#DC2626",
  "secondary_color": "#991B1B"
}'::jsonb
WHERE company_id = (
  SELECT id FROM companies 
  WHERE company_code = 'techstore-001'
);

-- =============================================
-- CARA 2: Update satu per satu (lebih aman)
-- =============================================

-- Update Logo
UPDATE company_profiles
SET branding = jsonb_set(
  branding,
  '{logo_url}',
  '"branding/toko-komputer-xyz/logo.png"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Update Banner
UPDATE company_profiles
SET branding = jsonb_set(
  branding,
  '{banner_url}',
  '"branding/toko-komputer-xyz/banner.jpg"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Update Primary Color
UPDATE company_profiles
SET branding = jsonb_set(
  branding,
  '{primary_color}',
  '"#DC2626"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Update Secondary Color
UPDATE company_profiles
SET branding = jsonb_set(
  branding,
  '{secondary_color}',
  '"#991B1B"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- =============================================
-- CARA 3: Pakai URL External (Tanpa upload ke Storage)
-- =============================================

-- Logo dari URL external (imgur, cloudinary, dll)
UPDATE company_profiles
SET branding = jsonb_set(
  branding,
  '{logo_url}',
  '"https://i.imgur.com/your-logo.png"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Banner dari URL external
UPDATE company_profiles
SET branding = jsonb_set(
  branding,
  '{banner_url}',
  '"https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?w=1200"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- =============================================
-- Verifikasi Update
-- =============================================
SELECT 
  cp.display_name,
  cp.branding->'logo_url' as logo_url,
  cp.branding->'banner_url' as banner_url,
  cp.branding->'primary_color' as primary_color,
  cp.branding->'secondary_color' as secondary_color
FROM company_profiles cp
JOIN companies c ON cp.company_id = c.id
WHERE c.company_code = 'techstore-001';

-- =============================================
-- NOTES:
-- =============================================
-- 1. Logo/Banner Path Options:
--    a) Storage path: "branding/folder/file.png" 
--       → Upload dulu ke Supabase Storage bucket 'company-assets'
--    
--    b) External URL: "https://example.com/image.png"
--       → Frontend auto-detect dan langsung pakai
--
-- 2. Recommended Logo Size: 200x50px atau 400x100px (landscape)
-- 3. Recommended Banner Size: 1920x500px atau 1200x400px
-- 4. Format: PNG (logo dengan transparansi) atau JPG (banner)
-- 5. Max file size di Supabase Storage: Default 5MB
--
-- 6. Color format: Hex color (#RRGGBB)
--    Contoh: #DC2626 (red), #3B82F6 (blue), #10B981 (green)
-- =============================================
