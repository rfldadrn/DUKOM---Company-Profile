# 🚀 Quick Start Guide - TechStore Frontend

Panduan super cepat untuk menjalankan frontend dalam **5 menit**!

## ✅ Checklist Setup

- [ ] Supabase project sudah dibuat
- [ ] Schema SQL sudah dijalankan
- [ ] Sample data sudah diinsert
- [ ] Config.js sudah diupdate
- [ ] Website dibuka di browser

## 📋 Step-by-Step (5 Menit!)

### Step 1: Setup Database (2 menit)

1. **Buka Supabase Dashboard**  
   👉 https://supabase.com/dashboard

2. **Pilih Project Anda** (atau buat baru)

3. **Buka SQL Editor**  
   👉 Dashboard → SQL Editor → New Query

4. **Jalankan Schema**  
   - Copy isi file: `../schema.sql`
   - Paste ke SQL Editor
   - Klik **Run**
   - ✅ Database tables created!

5. **Insert Sample Data**  
   - Copy isi file: `sample-data-techstore.sql`
   - Paste ke SQL Editor
   - Klik **Run**
   - ✅ Demo data inserted!

### Step 2: Konfigurasi Frontend (1 menit)

1. **Buka file `config.js`**

2. **Update kredensial Supabase:**

   ```javascript
   const SUPABASE_CONFIG = {
     url: 'https://xxxxx.supabase.co',  // ← Paste URL Anda
     anonKey: 'eyJh.......'              // ← Paste anon key Anda
   }
   ```

   **Cara dapat kredensial:**
   - Supabase Dashboard → Settings → API
   - Copy **Project URL** dan **anon public** key

3. **Save file config.js**

### Step 3: Jalankan Website (1 menit)

**Pilih salah satu cara:**

#### 🟢 Option A: Double Click (Paling Mudah)
```
Double click index.html → Langsung buka di browser ✅
```

#### 🟢 Option B: VS Code Live Server (Recommended)
```
1. Install extension "Live Server" di VS Code
2. Right-click index.html → "Open with Live Server"
3. Browser otomatis terbuka ✅
```

#### 🟢 Option C: Python Server
```bash
python -m http.server 8000
# Buka: http://localhost:8000
```

### Step 4: Verifikasi (30 detik)

Buka browser, cek apakah muncul:
- ✅ Header dengan nama "TechStore Computer Center"
- ✅ Hero banner biru dengan teks
- ✅ Tentang Kami section dengan alamat & kontak
- ✅ 10 produk komputer (laptop, monitor, keyboard, dll)
- ✅ Footer dengan copyright

## 🎯 Testing Checklist

### ✅ Semua Berfungsi Jika:

1. **Loading overlay** muncul sebentar lalu hilang
2. **Company name** berubah dari "TechStore" ke "TechStore Computer Center"
3. **Products** muncul 10 items (laptop, monitor, dll)
4. **About section** berisi alamat: "Jl. Sudirman No. 123..."
5. **Contact** menampilkan telepon & email
6. **Vision & Mission** terisi dengan data lengkap

### ❌ Troubleshooting Cepat

| Problem | Solution |
|---------|----------|
| Loading terus-terusan | Cek console (F12) → Pastikan config.js benar |
| "Company not found" | Cek `COMPANY_CODE` di config.js = `'techstore-001'` |
| Produk kosong | Jalankan ulang `sample-data-techstore.sql` |
| Gambar 404 | Normal! Gambar dari Unsplash, perlu internet |

## 🔧 Quick Commands

### Cek Data di Supabase

```sql
-- Cek company ada atau tidak
SELECT * FROM companies WHERE company_code = 'techstore-001';

-- Cek produk
SELECT title, price_label FROM offerings 
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001')
ORDER BY display_order;

-- Cek profile
SELECT display_name, address FROM company_profiles
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');
```

### Reset Data (Jika Mau Mulai Ulang)

```sql
-- Hapus semua data TechStore
DELETE FROM companies WHERE company_code = 'techstore-001';
-- Karena ON DELETE CASCADE, semua data terkait ikut terhapus

-- Lalu jalankan ulang sample-data-techstore.sql
```

## 🎨 Customization

### Ganti Warna Tema

Edit `styles.css` di bagian `:root`:

```css
:root {
  --primary-color: #2563eb;      /* ← Ubah warna utama */
  --secondary-color: #0ea5e9;    /* ← Ubah warna sekunder */
  --accent-color: #f59e0b;       /* ← Ubah warna aksen */
}
```

### Ganti Logo & Banner

Update di Supabase:

```sql
UPDATE company_profiles
SET branding = jsonb_set(
  branding,
  '{logo_url}',
  '"https://url-logo-anda.com/logo.png"'
)
WHERE company_id = (SELECT id FROM companies WHERE company_code = 'techstore-001');
```

### Tambah Produk Baru

1. Buka Supabase Dashboard → Table Editor → `offerings`
2. Klik **Insert Row**
3. Isi data:
   - `company_id`: (pilih dari dropdown)
   - `title`: Nama produk
   - `description`: Deskripsi
   - `price_label`: "Rp X.XXX.XXX"
   - `image_path`: URL gambar
   - `is_active`: true
4. **Save** → Refresh website → Produk baru muncul! ✅

## 📱 Next Steps

Setelah berhasil, Anda bisa:

1. **Deploy ke hosting:**
   - Netlify (gratis)
   - Vercel (gratis)
   - GitHub Pages (gratis)

2. **Tambah fitur:**
   - Shopping cart
   - Product search
   - WhatsApp quick order button
   - Contact form

3. **Upgrade tech stack:**
   - Migrate ke React/Next.js
   - Tambah TypeScript
   - Implement SSR

## 💡 Tips

- **Development**: Gunakan Live Server untuk auto-reload
- **Production**: Deploy ke Netlify/Vercel (tinggal drag & drop folder)
- **SEO**: Tambahkan meta tags di `<head>` untuk better SEO
- **Performance**: Compress images sebelum upload ke Supabase Storage

## 🆘 Need Help?

**Console Browser (F12) adalah teman terbaik Anda!**

Buka dengan:
- Windows/Linux: `F12` atau `Ctrl + Shift + I`
- Mac: `Cmd + Option + I`

Lihat tab **Console** untuk error messages yang helpful.

---

## ✨ Success!

Jika semua sudah berjalan, selamat! 🎉

Anda sekarang punya:
- ✅ Backend CMS engine di Supabase
- ✅ Frontend yang connect ke backend
- ✅ Sample data toko komputer
- ✅ Website yang siap di-customize

**Happy coding!** 🚀
