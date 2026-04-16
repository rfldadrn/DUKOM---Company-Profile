-- ============================================
-- SCHEMA MIGRATION - Add SEO Fields
-- ============================================
-- Tambahkan field untuk SEO optimization
-- Run this ONCE di Supabase SQL Editor

-- ============================================
-- 1. ALTER TABLE - Add SEO Fields
-- ============================================

-- Add tagline field (untuk subtitle/slogan)
ALTER TABLE public.company_profiles 
ADD COLUMN IF NOT EXISTS tagline TEXT;

-- Add description field (untuk meta description SEO)
ALTER TABLE public.company_profiles 
ADD COLUMN IF NOT EXISTS description TEXT;

-- Add category & tags to offerings (optional, untuk advanced filtering)
ALTER TABLE public.offerings 
ADD COLUMN IF NOT EXISTS category VARCHAR(100);

ALTER TABLE public.offerings 
ADD COLUMN IF NOT EXISTS tags TEXT[];

ALTER TABLE public.offerings 
ADD COLUMN IF NOT EXISTS brand VARCHAR(50);

-- Add comments untuk dokumentasi
COMMENT ON COLUMN public.company_profiles.tagline IS 'Company slogan/subtitle for SEO title (max 60 chars)';
COMMENT ON COLUMN public.company_profiles.description IS 'Company description for SEO meta description (120-160 chars optimal)';
COMMENT ON COLUMN public.offerings.category IS 'Product category for filtering and SEO keywords';
COMMENT ON COLUMN public.offerings.tags IS 'Array of tags for advanced search and filtering';
COMMENT ON COLUMN public.offerings.brand IS 'Product brand name';


-- ============================================
-- 2. UPDATE EXISTING DATA - Set Default Values
-- ============================================

-- Update records yang belum punya tagline (gunakan about_us sebagai fallback)
UPDATE public.company_profiles
SET tagline = CASE 
    WHEN about_us IS NOT NULL AND LENGTH(about_us) > 0 
    THEN LEFT(about_us, 60)
    ELSE 'Premium Solutions for Your Business'
END
WHERE tagline IS NULL OR tagline = '';

-- Update records yang belum punya description (gunakan about_us sebagai fallback)
UPDATE public.company_profiles
SET description = CASE 
    WHEN about_us IS NOT NULL AND LENGTH(about_us) > 0 
    THEN LEFT(about_us, 160)
    ELSE 'Quality products and services with excellent customer support. Trusted by thousands of satisfied customers.'
END
WHERE description IS NULL OR description = '';


-- ============================================
-- 3. CREATE INDEXES - Performance Optimization
-- ============================================

-- Index untuk faster search
CREATE INDEX IF NOT EXISTS idx_offerings_category ON public.offerings(category);
CREATE INDEX IF NOT EXISTS idx_offerings_brand ON public.offerings(brand);
CREATE INDEX IF NOT EXISTS idx_offerings_tags ON public.offerings USING GIN(tags);
CREATE INDEX IF NOT EXISTS idx_offerings_company_active ON public.offerings(company_id, is_active);

-- Index untuk company lookup
CREATE INDEX IF NOT EXISTS idx_company_profiles_company_id ON public.company_profiles(company_id);


-- ============================================
-- 4. VIEW SCHEMA - Verify Changes
-- ============================================

-- Check company_profiles columns
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'company_profiles'
ORDER BY ordinal_position;

-- Check offerings columns
SELECT column_name, data_type, character_maximum_length
FROM information_schema.columns
WHERE table_schema = 'public' 
  AND table_name = 'offerings'
ORDER BY ordinal_position;


-- ============================================
-- MIGRATION COMPLETE! ✅
-- ============================================
-- Next steps:
-- 1. Run the data update queries from seo-database-update.sql
-- 2. Test the frontend - refresh browser
-- 3. Check meta tags in View Page Source
