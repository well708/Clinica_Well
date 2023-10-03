CREATE SCHEMA clinica;

USE clinica;

CREATE TABLE usuarios (
    id_user INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    senha VARCHAR(100) NOT NULL 
);

CREATE TABLE animalcliente (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nome_animal VARCHAR(50) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(50),
    data_nascimento DATE,
    id_cliente INT,
   FOREIGN KEY (id_cliente) REFERENCES usuarios (id_user)
);



-- Inserir 10 usuários
INSERT INTO usuarios (nome, email, senha) VALUES
    ('Usuário 1', 'usuario1@email.com', 'senha1'),
    ('Usuário 2', 'usuario2@email.com', 'senha2'),
    ('Usuário 3', 'usuario3@email.com', 'senha3'),
    ('Usuário 4', 'usuario4@email.com', 'senha4'),
    ('Usuário 5', 'usuario5@email.com', 'senha5'),
    ('Usuário 6', 'usuario6@email.com', 'senha6'),
    ('Usuário 7', 'usuario7@email.com', 'senha7'),
    ('Usuário 8', 'usuario8@email.com', 'senha8'),
    ('well', 'wellingtonsfarias8@gmail.com', '123'),
    ('Usuário 10', 'usuario10@email.com', 'senha10');

-- Inserir 5 animais para cada usuário
-- Usuário 1
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2020-01-01', 1),
    ('Animal 2', 'Gato', 'Raça 2', '2019-02-15', 1),
    ('Animal 3', 'Cachorro', 'Raça 3', '2022-05-10', 1),
    ('Animal 4', 'Gato', 'Raça 4', '2018-07-20', 1),
    ('Animal 5', 'Cachorro', 'Raça 5', '2021-03-05', 1);

-- Usuário 2
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2019-03-10', 2),
    ('Animal 2', 'Gato', 'Raça 2', '2018-05-15', 2),
    ('Animal 3', 'Cachorro', 'Raça 3', '2020-07-20', 2),
    ('Animal 4', 'Gato', 'Raça 4', '2017-09-25', 2),
    ('Animal 5', 'Cachorro', 'Raça 5', '2021-01-15', 2);

-- Usuário 3
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2018-08-10', 3),
    ('Animal 2', 'Gato', 'Raça 2', '2019-04-25', 3),
    ('Animal 3', 'Cachorro', 'Raça 3', '2020-06-15', 3),
    ('Animal 4', 'Gato', 'Raça 4', '2021-02-05', 3),
    ('Animal 5', 'Cachorro', 'Raça 5', '2017-11-20', 3);

-- Usuário 4
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2019-07-30', 4),
    ('Animal 2', 'Gato', 'Raça 2', '2020-03-12', 4),
    ('Animal 3', 'Cachorro', 'Raça 3', '2018-04-05', 4),
    ('Animal 4', 'Gato', 'Raça 4', '2021-09-18', 4),
    ('Animal 5', 'Cachorro', 'Raça 5', '2022-01-22', 4);

-- Usuário 5
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2018-03-10', 5),
    ('Animal 2', 'Gato', 'Raça 2', '2019-05-15', 5),
    ('Animal 3', 'Cachorro', 'Raça 3', '2020-07-20', 5),
    ('Animal 4', 'Gato', 'Raça 4', '2021-09-25', 5),
    ('Animal 5', 'Cachorro', 'Raça 5', '2022-01-15', 5);

-- Usuário 6
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2019-04-15', 6),
    ('Animal 2', 'Gato', 'Raça 2', '2020-06-20', 6),
    ('Animal 3', 'Cachorro', 'Raça 3', '2021-08-10', 6),
    ('Animal 4', 'Gato', 'Raça 4', '2022-10-05', 6),
    ('Animal 5', 'Cachorro', 'Raça 5', '2020-12-25', 6);

-- Usuário 7
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2019-01-30', 7),
    ('Animal 2', 'Gato', 'Raça 2', '2020-03-15', 7),
    ('Animal 3', 'Cachorro', 'Raça 3', '2021-05-20', 7),
    ('Animal 4', 'Gato', 'Raça 4', '2022-07-10', 7),
    ('Animal 5', 'Cachorro', 'Raça 5', '2020-09-05', 7);

-- Usuário 8
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2017-12-10', 8),
    ('Animal 2', 'Gato', 'Raça 2', '2018-04-15', 8),
    ('Animal 3', 'Cachorro', 'Raça 3', '2019-06-20', 8),
    ('Animal 4', 'Gato', 'Raça 4', '2020-08-10', 8),
    ('Animal 5', 'Cachorro', 'Raça 5', '2021-10-05', 8);

-- Usuário 9
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2020-02-10', 9),
    ('Animal 2', 'Gato', 'Raça 2', '2021-04-15', 9),
    ('Animal 3', 'Cachorro', 'Raça 3', '2019-06-20', 9),
    ('Animal 4', 'Gato', 'Raça 4', '2022-08-10', 9),
    ('Animal 5', 'Cachorro', 'Raça 5', '2018-10-05', 9);

-- Usuário 10
INSERT INTO animalcliente (nome_animal, especie, raca, data_nascimento, id_cliente) VALUES
    ('Animal 1', 'Cachorro', 'Raça 1', '2019-01-10', 10),
    ('Animal 2', 'Gato', 'Raça 2', '2020-03-15', 10),
    ('Animal 3', 'Cachorro', 'Raça 3', '2021-05-20', 10),
    ('Animal 4', 'Gato', 'Raça 4', '2022-07-10', 10),
    ('Animal 5', 'Cachorro', 'Raça 5', '2020-09-05', 10);

select * from usuarios;

select * from animalcliente;

/*drop schema clinica;*/









