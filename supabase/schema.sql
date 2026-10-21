-- Encuesta de Pilates: tabla de respuestas anónimas
-- Ejecutar una vez en Supabase → SQL Editor → New query → Run

create table if not exists public.respuestas (
  id                uuid primary key default gen_random_uuid(),
  creado            timestamptz not null default now(),
  fecha             date not null,
  hora              time,
  dolor_inicio      smallint not null check (dolor_inicio between 0 and 10),
  zonas             text[] not null default '{}',
  motivacion_inicio smallint not null check (motivacion_inicio between 0 and 10),
  dolor_fin         smallint not null check (dolor_fin between 0 and 10),
  motivacion_fin    smallint not null check (motivacion_fin between 0 and 10),
  gustado           text check (char_length(gustado) <= 2000),
  cambiarias        text check (char_length(cambiarias) <= 2000),
  constraint zonas_max check (cardinality(zonas) <= 10)
);

alter table public.respuestas enable row level security;

-- Permisos: el público (anon) solo puede INSERTAR; tú (usuario con sesión) puedes leer y borrar.
revoke all on public.respuestas from anon, authenticated;
grant insert on public.respuestas to anon, authenticated;
grant select, delete on public.respuestas to authenticated;

drop policy if exists "cualquiera puede responder" on public.respuestas;
create policy "cualquiera puede responder"
  on public.respuestas for insert
  to anon, authenticated
  with check (true);

drop policy if exists "solo la admin lee" on public.respuestas;
create policy "solo la admin lee"
  on public.respuestas for select
  to authenticated
  using (true);

drop policy if exists "solo la admin borra" on public.respuestas;
create policy "solo la admin borra"
  on public.respuestas for delete
  to authenticated
  using (true);
