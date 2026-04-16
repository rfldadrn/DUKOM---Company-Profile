-- Update Contact Info dengan Social Media
-- File: update-contact-info.sql
-- Fungsi: Update contact_info di company_profiles dengan data lengkap

-- Example 1: Update Full Contact Info (Instagram, Facebook, Twitter, TikTok, YouTube, LinkedIn)
UPDATE company_profiles
SET contact_info = '{
  "email": "duniacomputer@gmail.com",
  "phone": "0822-8444-4399",
  "whatsapp": "082284444399",
  "instagram": "@duniacomputer__",
  "facebook": "@duniacomputerofficial",
  "twitter": "@duniacomputer",
  "tiktok": "@duniacomputerid",
  "youtube": "@duniacomputer",
  "linkedin": "duniacomputer"
}'::jsonb
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Example 2: Update hanya field tertentu (merge dengan data existing)
UPDATE company_profiles
SET contact_info = contact_info || '{
  "instagram": "@duniacomputer__",
  "tiktok": "@duniacomputerid"
}'::jsonb
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Example 3: Update individual field
UPDATE company_profiles
SET contact_info = jsonb_set(
    COALESCE(contact_info, '{}'::jsonb),
    '{instagram}',
    '"@duniacomputer__"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Example 4: Minimal Contact Info (hanya yang tersedia)
UPDATE company_profiles
SET contact_info = '{
  "email": "store@example.com",
  "phone": "081234567890",
  "whatsapp": "081234567890",
  "instagram": "@mystore"
}'::jsonb
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');

-- Supported Social Media Fields:
-- ✅ instagram  - Format: @username atau username
-- ✅ facebook   - Format: @username, username, atau full URL
-- ✅ twitter    - Format: @username atau username
-- ✅ tiktok     - Format: @username atau username
-- ✅ youtube    - Format: @channelname atau full URL
-- ✅ linkedin   - Format: username atau full URL
-- ✅ whatsapp   - Format: 08xxx atau 62xxx (auto-converted)

-- View current contact_info
SELECT 
  c.company_code,
  cp.contact_info
FROM company_profiles cp
JOIN companies c ON cp.company_id = c.id
WHERE c.company_code = 'techstore-001';
