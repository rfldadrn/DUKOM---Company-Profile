# 🖥️ TechStore Frontend - HTML, CSS, JavaScript

Frontend sederhana untuk CMS Engine Supabase dengan tema **Toko Komputer**.

## 📁 Struktur File

```
frontend/
├── index.html      # Main HTML file
├── styles.css      # Styling (tema toko komputer)
├── app.js          # JavaScript untuk fetch data dari Supabase
├── config.js       # Konfigurasi Supabase
└── README.md       # Dokumentasi ini
```

## 🚀 Cara Setup

### 1. Konfigurasi Supabase

Buka file **`config.js`** dan update dengan kredensial Supabase Anda:

```javascript
const SUPABASE_CONFIG = {
  url: 'https://xxxxxxxxxxxxx.supabase.co',        // ← Ganti ini
  anonKey: 'your-anon-key-here'                     // ← Ganti ini
}

const COMPANY_CODE = 'techstore-001'                 // ← Sesuaikan dengan data Anda
```

**Cara mendapatkan kredensial:**
1. Buka [Supabase Dashboard](https://supabase.com/dashboard)
2. Pilih project Anda
3. Klik **Settings** → **API**
4. Copy **Project URL** dan **anon/public key**

### 2. Insert Sample Data (Toko Komputer)

Jalankan query SQL berikut di **Supabase SQL Editor** untuk membuat data demo:

```sql
-- Lihat file: sample-data-techstore.sql
```

Atau gunakan file terpisah: **`sample-data-techstore.sql`**

### 3. Jalankan Website

Karena ini murni HTML/CSS/JS, Anda bisa membukanya dengan beberapa cara:

#### **Option A: Langsung Buka di Browser**
- Double click `index.html`
- Website akan terbuka di browser

#### **Option B: Gunakan Live Server (Recommended)**
Jika menggunakan VS Code:
1. Install extension **Live Server**
2. Right-click pada `index.html`
3. Pilih **"Open with Live Server"**

#### **Option C: Python Simple Server**
```bash
# Python 3
python -m http.server 8000

# Buka browser: http://localhost:8000
```

#### **Option D: Node.js http-server**
```bash
npm install -g http-server
http-server

# Buka browser: http://localhost:8080
```

## 📖 Fitur

### ✅ Apa yang ditampilkan:

1. **Header** dengan logo dan navigasi
2. **Hero Banner** dengan gambar dan teks utama
3. **About Section**:
   - Deskripsi perusahaan
   - Alamat
   - Kontak (telepon, email, WhatsApp)
   - Visi & Misi
4. **Products Section**: Grid produk dari database `offerings`
5. **Contact Section**: Informasi kontak lengkap
6. **Footer**: Copyright dan powered by

### 🎨 Desain

- **Modern & Professional** dengan warna biru (tech theme)
- **Responsive Design** (mobile-friendly)
- **Loading Animation** saat fetch data
- **Smooth Scrolling** untuk navigasi
- **Hover Effects** pada produk

## 🔍 Troubleshooting

### ❌ Error: "Supabase configuration not found"

**Solusi:**
- Pastikan file `config.js` sudah diupdate dengan URL dan API key yang benar
- Cek di browser console (F12) untuk error details

### ❌ Error: "Company with code 'xxx' not found"

**Solusi:**
- Pastikan `COMPANY_CODE` di `config.js` sesuai dengan data di database
- Jalankan query ini untuk cek company codes yang ada:
  ```sql
  SELECT company_code FROM companies;
  ```

### ❌ Produk tidak muncul

**Solusi:**
- Cek apakah ada data di table `offerings`:
  ```sql
  SELECT * FROM offerings WHERE is_active = true;
  ```
- Pastikan `company_id` di offerings sesuai dengan company Anda

### ❌ Gambar tidak muncul

**Solusi:**
- Pastikan Storage Bucket `company-assets` sudah dibuat
- Cek RLS policies di Supabase Storage
- Atau gunakan URL langsung di field `image_path`

## 📊 Data Structure

Frontend ini mengambil data dari:

### 1. **companies** + **company_profiles**
```sql
-- Informasi dasar perusahaan
display_name, address, contact_info, branding, 
about_us, vision_mission
```

### 2. **offerings**
```sql
-- Produk/layanan
title, description, price_label, image_path, 
display_order, is_active
```

## 🎯 Next Steps

### Mau tambah fitur?

**Rekomendasi pengembangan:**

1. **Shopping Cart**: Tambah keranjang belanja
2. **Product Detail Page**: Halaman detail per produk
3. **Search & Filter**: Cari produk by kategori
4. **Contact Form**: Form kontak yang kirim ke Supabase
5. **WhatsApp Integration**: Tombol quick order via WA

### Mau upgrade ke Framework?

Jika project berkembang, consider:

- **React** / **Next.js** - Untuk app yang lebih kompleks
- **Vue** / **Nuxt** - Alternatif yang lebih simple
- **Svelte** / **SvelteKit** - Lightweight & fast

**Tapi untuk MVP dan testing, HTML/CSS/JS sudah cukup!** ✅

## 🛠️ Tech Stack

- **HTML5** - Struktur
- **CSS3** - Styling dengan custom properties (CSS variables)
- **Vanilla JavaScript** - Logic tanpa framework
- **Supabase JS Client** - CDN version (via CDN)

## 📝 Notes

- **No Build Process**: Langsung jalan tanpa npm install/build
- **No Dependencies**: Kecuali Supabase client dari CDN
- **SEO-Friendly**: Karena SSR-like rendering di client
- **Fast Loading**: Minimal JavaScript overhead

## 🙋 Need Help?

Jika ada masalah:
1. Check browser console (F12) untuk error messages
2. Pastikan internet connection aktif (untuk fetch dari Supabase)
3. Verify Supabase credentials di config.js

---

**Happy Coding! 🚀**

Made with ❤️ using Supabase CMS Engine
