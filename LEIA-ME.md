# Recibos: instalação

Demora cerca de 15 minutos e faz-se uma única vez. Os nomes dos menus podem variar ligeiramente.

Antes de começar, no Windows: clica com o botão direito no ZIP, **Extrair tudo**. Usa o Edge ou o Chrome para os passos seguintes.

## 1. Supabase (base de dados)

1. Vai a supabase.com e cria conta. A forma mais rápida é entrar com a conta do GitHub.
2. Cria um projeto novo:
   - Nome: `recibos`
   - Palavra-passe da base de dados: gera uma e guarda-a num sítio seguro (a app não a usa, mas pode fazer falta)
   - Região: uma da Europa, por exemplo Paris ou Frankfurt
3. Abre o **SQL Editor**, cria uma query nova, cola o conteúdo de `supabase.sql` e carrega em **Run**. Deve aparecer "Success".
4. Vai a **Authentication → Sign In / Providers → Email** e desliga **Confirm email**. Guarda.
5. Vai a **Project Settings → API** (ou **API Keys**) e copia dois valores:
   - **Project URL** (começa por `https://` e acaba em `.supabase.co`)
   - **Chave pública**: a `anon` ou `publishable`
   
   Nunca uses a chave `service_role` nem a `secret`.

## 2. GitHub (alojamento)

1. Cria conta em github.com, se ainda não tiveres.
2. Cria um repositório novo com o nome `recibos`, **Public**.
3. Na página do repositório, escolhe **uploading an existing file**. Abre a pasta `recibos-app` no Explorador de Ficheiros, seleciona tudo o que está lá dentro (Ctrl + A), incluindo a pasta `.github`, e arrasta para a página.
   - Se a pasta `.github` não aparecer na lista do GitHub depois de arrastar, não faz mal: no fim, usa **Add file → Create new file**, escreve como nome `.github/workflows/manter-supabase-ativo.yml`, cola o conteúdo desse ficheiro (abre-o com o Bloco de Notas) e faz **Commit changes**.
4. Carrega em **Commit changes**.
5. Vai a **Settings → Pages**. Em Source escolhe **Deploy from a branch**, depois `main` e `/ (root)`, e guarda.
6. Espera um ou dois minutos. A app fica em `https://O-TEU-UTILIZADOR.github.io/recibos/`.

## 3. Primeira utilização

1. Abre o endereço da app no computador.
2. Cola o Project URL e a chave pública e carrega em **Ligar**.
3. Carrega em **Criar conta** com o teu email e uma palavra-passe forte.
4. Volta ao Supabase, a **Authentication → Sign In / Providers**, e desliga **Allow new users to sign up**. Assim mais ninguém consegue criar conta na tua app.
5. As datas que já tinhas (início a 23/8, 1.º período até 3/10) vêm configuradas. Preenche o resto em **Definições**.

## 4. Instalar

- **iPhone:** abre o endereço no Safari, Partilhar, Adicionar ao ecrã principal. Liga e entra com a mesma conta.
- **Windows:** no Edge ou no Chrome, clica no ícone de instalar à direita da barra de endereço (ou menu ⋯ → Aplicações → Instalar este site como aplicação). Fica no menu Iniciar e podes afixá-la na barra de tarefas.
- **Mac:** no Safari, Ficheiro, Adicionar à Dock.

## 5. Manter o Supabase ativo

Os projetos gratuitos do Supabase entram em pausa depois de uma semana sem uso. Como só faturas de 4 em 4 semanas, convém ativar isto:

1. No repositório do GitHub, vai a **Settings → Secrets and variables → Actions**.
2. Cria dois segredos (**New repository secret**):
   - `SUPABASE_URL` com o Project URL
   - `SUPABASE_KEY` com a chave pública
3. Vai ao separador **Actions**, ativa os workflows se pedir, abre **Manter Supabase ativo** e carrega em **Run workflow** para testar. Depois corre sozinho a cada 3 dias.

Se mesmo assim o projeto entrar em pausa, a app continua a funcionar com a cópia guardada no dispositivo. Basta reativar o projeto no painel do Supabase e tudo sincroniza.

## Atualizar a app

Quando houver uma versão nova do `index.html`, guarda-o numa pasta no PC, vai ao repositório, **Add file → Upload files**, arrasta o ficheiro novo e faz **Commit changes**. Em cerca de um minuto a app atualiza em todos os dispositivos (pode ser preciso fechá-la e abrir de novo).

## Segurança

- Os dados ficam na tua base de dados do Supabase, protegidos por login. As regras da tabela só deixam a tua conta ler e escrever.
- O código no GitHub é público, mas não contém dados nem palavras-passe. A chave pública do Supabase pode ser vista sem problema; o que protege os dados são as regras da tabela.
- Não guardes na app palavras-passe nem dados de acesso ao banco ou ao Portal das Finanças.
- Faz uma **Cópia de segurança** em Definições de vez em quando.
