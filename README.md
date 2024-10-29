script do banco de dados:

-- Criação da tabela de usuários
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    role VARCHAR(10) NOT NULL CHECK (role IN ('Admin', 'User')), -- Admin ou User
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de projetos
CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(20), -- Ex: 'Em andamento', 'Concluído', 'Pendente'
    priority INTEGER CHECK (priority BETWEEN 1 AND 5), -- Prioridade de 1 a 5
    user_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de requisitos
CREATE TABLE requirements (
    id SERIAL PRIMARY KEY,
    project_id INTEGER REFERENCES projects(id) ON DELETE CASCADE,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    priority INTEGER CHECK (priority BETWEEN 1 AND 5), -- Prioridade de 1 a 5
    complexity INTEGER CHECK (complexity BETWEEN 1 AND 5), -- Complexidade de 1 a 5
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Criação da tabela de versões de requisitos
CREATE TABLE requirement_versions (
    id SERIAL PRIMARY KEY,
    requirement_id INTEGER REFERENCES requirements(id) ON DELETE CASCADE,
    version_number INTEGER NOT NULL, -- Número da versão (1, 2, 3, etc.)
    description TEXT, -- Descrição da versão do requisito
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
