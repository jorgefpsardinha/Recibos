-- Recibos: tabela de dados, só acessível pelo próprio utilizador.
create table if not exists public.records (
  user_id uuid not null default auth.uid() references auth.users (id) on delete cascade,
  id text not null,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (user_id, id)
);

alter table public.records enable row level security;

drop policy if exists "Ler os meus registos" on public.records;
drop policy if exists "Criar os meus registos" on public.records;
drop policy if exists "Alterar os meus registos" on public.records;
drop policy if exists "Apagar os meus registos" on public.records;

create policy "Ler os meus registos" on public.records
  for select to authenticated using (auth.uid() = user_id);
create policy "Criar os meus registos" on public.records
  for insert to authenticated with check (auth.uid() = user_id);
create policy "Alterar os meus registos" on public.records
  for update to authenticated using (auth.uid() = user_id) with check (auth.uid() = user_id);
create policy "Apagar os meus registos" on public.records
  for delete to authenticated using (auth.uid() = user_id);

revoke all on public.records from anon;
grant select, insert, update, delete on public.records to authenticated;

-- Função mínima usada pelo GitHub Actions para manter o projeto ativo (não lê dados).
create or replace function public.ping() returns int language sql stable as $$ select 1 $$;
grant execute on function public.ping() to anon;
