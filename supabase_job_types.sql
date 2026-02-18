-- job_types tablosu
-- Supabase Dashboard > SQL Editor'da bu dosyayı çalıştırın
create table if not exists job_types (
  id uuid default gen_random_uuid() primary key,
  name text not null,
  job_class smallint not null check (job_class in (1, 2)),
  job_total_cost numeric default 0,
  sort_order int default 0,
  unique(name, job_class)
);

alter table job_types enable row level security;

create policy "Allow all for job_types" on job_types for all using (true) with check (true);

-- Bakım & Onarım (job_class=1)
insert into job_types (name, job_class, sort_order, job_total_cost) values
  ('Elektrik Sistemleri', 1, 1, 0),
  ('Mekanik Sistemler', 1, 2, 0),
  ('Pompa Sistemleri', 1, 3, 0),
  ('HVAC (İklimlendirme & Havalandırma)', 1, 4, 0),
  ('Tesisat (Su, Atık Su, Gaz)', 1, 5, 0),
  ('Güvenlik & Yangın Sistemleri', 1, 6, 0),
  ('Dış Mekan & Ahşap Yüzeyler', 1, 7, 0),
  ('Boya & Tamirat İşlemleri', 1, 8, 0),
  ('Mobilya & Döşeme', 1, 9, 0),
  ('Donatı & Ekipman', 1, 10, 0),
  ('Drenaj & Vidanjör', 1, 11, 0)
on conflict (name, job_class) do nothing;

-- Start Up (job_class=2)
insert into job_types (name, job_class, sort_order, job_total_cost) values
  ('Animasyon', 2, 1, 0),
  ('Bahçe', 2, 2, 0),
  ('Bilgi İşlem', 2, 3, 0),
  ('F&B Servis', 2, 4, 0),
  ('Güvenlik', 2, 5, 0),
  ('Housekeeping', 2, 6, 0),
  ('Kalite', 2, 7, 0),
  ('Linen', 2, 8, 0),
  ('Mutfak', 2, 9, 0),
  ('Önbüro', 2, 10, 0),
  ('Pastane', 2, 11, 0),
  ('Personel Lojmanı', 2, 12, 0),
  ('Spa', 2, 13, 0),
  ('Steward', 2, 14, 0),
  ('Uniforma', 2, 15, 0)
on conflict (name, job_class) do nothing;
