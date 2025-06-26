# Medical Appointment System

## 📝 Descrição do Projeto

O **Medical Appointment System** é um sistema de agendamento de consultas médicas desenvolvido em Ruby on Rails. A aplicação permite:

* **Médicos (administradores)** agendarem, editarem e cancelarem consultas
* **Pacientes (usuários comuns)** visualizarem suas consultas agendadas
* Gerenciamento de sintomas associados às consultas

## 🔧 Tecnologias Utilizadas

* **Ruby on Rails 8.0.2**
* **SQLite3** (banco de dados de desenvolvimento)
* **Devise** (autenticação de usuários)
* **Bootstrap 5** (via CDN - interface responsiva)
* **JavaScript** (funcionalidades básicas do Bootstrap)

## 🗃️ Modelagem do Banco de Dados

### Relacionamentos Implementados

1. **1:1 (Um para Um)**
   * `User ↔ Patient` (Um usuário tem um perfil de paciente)
   * `User ↔ Doctor` (Um usuário tem um perfil de médico)

2. **1:N (Um para Muitos)**
   * `Doctor → Appointments` (Um médico pode ter várias consultas)
   * `Patient → Appointments` (Um paciente pode ter várias consultas)

3. **N:N (Muitos para Muitos)**
   * `Appointment ↔ Symptom` (Uma consulta pode ter vários sintomas, e um sintoma pode aparecer em várias consultas)

## 👥 Tipos de Usuários

| Tipo | Credenciais | Permissões |
|------|-------------|------------|
| Médico | medico@exemplo.com / senha123 | Criar/editar/excluir consultas, gerenciar sintomas |
| Paciente | paciente@exemplo.com / senha123 | Visualizar suas consultas agendadas |

## 🚀 Funcionalidades Implementadas

### Para Médicos (Admin)
* ✅ CRUD completo de consultas médicas
* ✅ Gerenciamento de sintomas (CRUD)
* ✅ Visualização de todas consultas agendadas
* ✅ Associação de múltiplos sintomas a uma consulta

### Para Pacientes
* ✅ Visualização de consultas agendadas
* ✅ Visualização de sintomas associados a cada consulta

### Gerais
* ✅ Sistema de autenticação com Devise
* ✅ Interface responsiva com Bootstrap
* ✅ Validações de dados no backend
* ✅ Mensagens flash para feedback ao usuário

## 🧪 Testes

O projeto inclui testes básicos para modelos e controllers. Para executar:

```bash
rake test
```

Principais testes implementados:
* Validações de modelos (User, Patient, Doctor, Appointment, Symptom)
* Testes de autenticação e autorização
* Testes de relações entre modelos

## 🎨 Interface (CSS/JS)

### CSS
* Bootstrap 5 (via CDN)
* Layout responsivo
* Componentes estilizados (tabelas, formulários, alertas)

### JavaScript
* Bootstrap JavaScript (modais, tooltips)
* Confirmação antes de exclusões
* Validações de formulário no frontend

## 🛠️ Como Executar o Projeto

1. **Instalação de dependências:**
   ```bash
   bundle install
   ```

2. **Configuração do banco de dados:**
   ```bash
   rails db:create db:migrate db:seed
   ```

3. **Iniciar o servidor:**
   ```bash
   rails server
   ```

4. **Acessar no navegador:**
   ```
   http://localhost:3000
   ```

