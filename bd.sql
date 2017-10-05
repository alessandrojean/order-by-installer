-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: 19-Nov-2015 às 14:45
-- Versão do servidor: 5.6.27
-- PHP Version: 5.5.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
;

--
-- Database: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `acoes_recentes`
--

CREATE TABLE `acoes_recentes` (
  `idar` int(11) NOT NULL,
  `cpffuncionario_ar` varchar(11) NOT NULL,
  `texto_ac` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `acoes_recentes`
--

INSERT INTO `acoes_recentes` (`idar`, `cpffuncionario_ar`, `texto_ac`) VALUES
(1, '12345678901', 'Matéria Adesão de Sua Mãe ao meu pênis Adicionada'),
(2, '12345678901', 'Sala 246 Adicionada'),
(3, '12345678901', 'Funcionario 4 Adicionado');

-- --------------------------------------------------------

--
-- Estrutura da tabela `alunos`
--

CREATE TABLE `alunos` (
  `rm_aluno` varchar(7) NOT NULL,
  `nome_aluno` text NOT NULL,
  `foto_aluno` mediumblob,
  `cpf_aluno` varchar(11) DEFAULT NULL,
  `rg_aluno` varchar(9) NOT NULL,
  `tel_aluno` varchar(10) NOT NULL,
  `cel_aluno` varchar(11) NOT NULL,
  `cpf_responsavel_aluno` varchar(11) NOT NULL,
  `enderecosidedereco_aluno` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aula`
--

CREATE TABLE `aula` (
  `idaula_aula` int(11) NOT NULL,
  `salasidsala_aula` varchar(30) NOT NULL,
  `turmasidturma_aula` int(11) NOT NULL,
  `materiasidmateria_aula` int(11) NOT NULL,
  `dia_aula` varchar(11) NOT NULL,
  `inicio_aula` time NOT NULL,
  `fim_aula` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `aulas_professores`
--

CREATE TABLE `aulas_professores` (
  `professorescpf_ap` varchar(11) NOT NULL,
  `aulasidaula_ap` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `enderecos`
--

CREATE TABLE `enderecos` (
  `idendereco` int(11) NOT NULL,
  `tipo_endereco` varchar(20) NOT NULL,
  `estado_endereco` varchar(2) NOT NULL,
  `cidade_endereco` varchar(50) NOT NULL,
  `bairro_endereco` varchar(50) NOT NULL,
  `rua_endereco` varchar(50) NOT NULL,
  `cep_endereco` varchar(8) NOT NULL,
  `numero_endereco` int(11) NOT NULL,
  `complemento_endereco` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `enderecos`
--

INSERT INTO `enderecos` (`idendereco`, `tipo_endereco`, `estado_endereco`, `cidade_endereco`, `bairro_endereco`, `rua_endereco`, `cep_endereco`, `numero_endereco`, `complemento_endereco`) VALUES
(2, 'Comercial', 'SP', 'Jordinópilis', 'Parasópolis', 'Dr Fernando Ademir', '12345678', 2, NULL),
(3, 'Residencial', 'AL', '4', '4', '4', '4', 4, '4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `faltas`
--

CREATE TABLE `faltas` (
  `idfalta` int(11) NOT NULL,
  `quantidade_falta` double NOT NULL,
  `mes_falta` int(11) NOT NULL,
  `materiasidmateria_falta` int(11) NOT NULL,
  `alunosrm_falta` varchar(7) NOT NULL,
  `cpfprof_falta` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `faltas_materias`
--

CREATE TABLE `faltas_materias` (
  `id_falta` int(11) NOT NULL,
  `materiaidmateria` int(11) NOT NULL,
  `aulas_dadas` double NOT NULL,
  `aulas_pre` double NOT NULL,
  `mes_mf` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionarios`
--

CREATE TABLE `funcionarios` (
  `cpf_funcionarios` varchar(11) NOT NULL,
  `nome_funcionarios` text NOT NULL,
  `telefone_funcionarios` int(11) NOT NULL,
  `celular_funcionarios` int(11) NOT NULL,
  `senha_funcionarios` varchar(32) NOT NULL,
  `cargo_funcionarios` varchar(50) NOT NULL,
  `enderecosidendereco_funcionarios` int(11) NOT NULL,
  `tipo_funcionarios` varchar(50) NOT NULL,
  `rg_funcionarios` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `funcionarios`
--

INSERT INTO `funcionarios` (`cpf_funcionarios`, `nome_funcionarios`, `telefone_funcionarios`, `celular_funcionarios`, `senha_funcionarios`, `cargo_funcionarios`, `enderecosidendereco_funcionarios`, `tipo_funcionarios`, `rg_funcionarios`) VALUES
('12345678901', 'Padrão', 12345678, 12345678, '12345', 'Administrador', 2, 'Administrador', '123456789'),
('4', '4', 4, 4, '4', '4', 3, 'Usuário', '4');

-- --------------------------------------------------------

--
-- Estrutura da tabela `horario_professor`
--

CREATE TABLE `horario_professor` (
  `idhp` int(11) NOT NULL,
  `entrada_horario_p` time NOT NULL,
  `saida_horario_p` time NOT NULL,
  `dia_horario_p` varchar(30) NOT NULL,
  `professorcpf_horario` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `horario_turma`
--

CREATE TABLE `horario_turma` (
  `idht` int(11) NOT NULL,
  `entrada_horario_t` time NOT NULL,
  `saida_horario_t` time NOT NULL,
  `idturma_t` int(11) NOT NULL,
  `tipo_horario_t` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `materias`
--

CREATE TABLE `materias` (
  `idmateria` int(11) NOT NULL,
  `nome_materias` text NOT NULL,
  `sigla_materias` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `materias`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `materias_turmas`
--

CREATE TABLE `materias_turmas` (
  `materiasidmateria_mt` int(11) NOT NULL,
  `turmasidturma_mt` int(11) NOT NULL,
  `limite_aula_mt` int(11) NOT NULL,
  `prioridade_mt` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notas`
--

CREATE TABLE `notas` (
  `idnota` int(11) NOT NULL,
  `nota_nota` varchar(2) NOT NULL,
  `bimestre_nota` int(11) NOT NULL,
  `alunosrm_nota` varchar(7) NOT NULL,
  `cpfprof_notas` varchar(11) NOT NULL,
  `materiasidmateria_nota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias`
--

CREATE TABLE `noticias` (
  `id_noticia` int(11) NOT NULL,
  `titulo_noticia` varchar(300) NOT NULL,
  `conteudo_noticia` longtext NOT NULL,
  `imagem_noticia` mediumblob,
  `criador_noticia` varchar(11) NOT NULL,
  `data_noticia` datetime NOT NULL,
  `destaque_noticia` tinyint(1) NOT NULL,
  `tipo_noticia` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `noticias_tags`
--

CREATE TABLE `noticias_tags` (
  `id_tag` int(11) NOT NULL,
  `nome_tag` varchar(50) NOT NULL,
  `noticia_tag` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `prof_mat_tur_sal`
--

CREATE TABLE `prof_mat_tur_sal` (
  `cpfprof_pmts` varchar(11) NOT NULL,
  `idmat_pmts` int(11) NOT NULL,
  `idtur_pmts` int(11) NOT NULL,
  `idsala_pmts` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores`
--

CREATE TABLE `professores` (
  `cpf_professores` varchar(11) NOT NULL,
  `nome_professores` text NOT NULL,
  `telefone_professores` int(11) NOT NULL,
  `celular_professores` int(11) NOT NULL,
  `sigla_professores` varchar(3) NOT NULL,
  `senha_professores` varchar(32) NOT NULL,
  `enderecosidendereco_professores` int(11) NOT NULL,
  `rg_professores` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `professores_materias`
--

CREATE TABLE `professores_materias` (
  `professorescpf_pm` varchar(11) NOT NULL,
  `materiasidmateria_pm` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `responsaveis`
--

CREATE TABLE `responsaveis` (
  `cpf_responsaveis` varchar(11) NOT NULL,
  `nome_responsaveis` text NOT NULL,
  `tel_com_responsaveis` varchar(10) NOT NULL,
  `ramal_responsaveis` int(11) NOT NULL,
  `celular_responsaveis` varchar(11) NOT NULL,
  `enderecosidendereco_responsaveis` int(11) NOT NULL,
  `rg_responsaveis` varchar(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `salas`
--

CREATE TABLE `salas` (
  `idsala` varchar(30) NOT NULL,
  `tipo_sala` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `salas`
--

INSERT INTO `salas` (`idsala`, `tipo_sala`) VALUES
('246', 'Normal');

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas`
--

CREATE TABLE `turmas` (
  `idturma` int(11) NOT NULL,
  `grau_turmas` int(11) NOT NULL,
  `classe_turmas` varchar(50) NOT NULL,
  `curso_turmas` varchar(30) NOT NULL,
  `período_turmas` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `turmas_alunos`
--

CREATE TABLE `turmas_alunos` (
  `turmasidturma_ta` int(11) NOT NULL,
  `alunosrm_ta` varchar(7) NOT NULL,
  `numero_ta` int(11) NOT NULL,
  `situacao_ta` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `acoes_recentes`
--
ALTER TABLE `acoes_recentes`
  ADD PRIMARY KEY (`idar`);

--
-- Indexes for table `alunos`
--
ALTER TABLE `alunos`
  ADD PRIMARY KEY (`rm_aluno`),
  ADD KEY `enderecosidedereco_aluno` (`enderecosidedereco_aluno`),
  ADD KEY `cpf_responsavel_aluno` (`cpf_responsavel_aluno`);

--
-- Indexes for table `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`idaula_aula`),
  ADD KEY `salasidsala_aula` (`salasidsala_aula`),
  ADD KEY `turmasidturma_aula` (`turmasidturma_aula`),
  ADD KEY `materiasidmateria_aula` (`materiasidmateria_aula`);

--
-- Indexes for table `aulas_professores`
--
ALTER TABLE `aulas_professores`
  ADD PRIMARY KEY (`professorescpf_ap`,`aulasidaula_ap`),
  ADD KEY `fk_aula` (`aulasidaula_ap`);

--
-- Indexes for table `enderecos`
--
ALTER TABLE `enderecos`
  ADD PRIMARY KEY (`idendereco`);

--
-- Indexes for table `faltas`
--
ALTER TABLE `faltas`
  ADD PRIMARY KEY (`idfalta`),
  ADD KEY `materiasidmateria_falta` (`materiasidmateria_falta`),
  ADD KEY `alunosrm_falta` (`alunosrm_falta`),
  ADD KEY `cpfprof_falta` (`cpfprof_falta`);

--
-- Indexes for table `faltas_materias`
--
ALTER TABLE `faltas_materias`
  ADD PRIMARY KEY (`id_falta`),
  ADD KEY `materiaidmateria` (`materiaidmateria`);

--
-- Indexes for table `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD PRIMARY KEY (`cpf_funcionarios`),
  ADD KEY `endercosidendereco_funcionarios` (`enderecosidendereco_funcionarios`);

--
-- Indexes for table `horario_professor`
--
ALTER TABLE `horario_professor`
  ADD PRIMARY KEY (`idhp`),
  ADD KEY `professorcpf_horario` (`professorcpf_horario`);

--
-- Indexes for table `horario_turma`
--
ALTER TABLE `horario_turma`
  ADD PRIMARY KEY (`idht`),
  ADD KEY `idturma_t` (`idturma_t`);

--
-- Indexes for table `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`idmateria`);

--
-- Indexes for table `materias_turmas`
--
ALTER TABLE `materias_turmas`
  ADD PRIMARY KEY (`materiasidmateria_mt`,`turmasidturma_mt`),
  ADD KEY `fk_turma` (`turmasidturma_mt`);

--
-- Indexes for table `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`idnota`),
  ADD KEY `alunosrm_nota` (`alunosrm_nota`),
  ADD KEY `materiasidmateria_nota` (`materiasidmateria_nota`),
  ADD KEY `cpfprof_notas` (`cpfprof_notas`);

--
-- Indexes for table `noticias`
--
ALTER TABLE `noticias`
  ADD PRIMARY KEY (`id_noticia`),
  ADD KEY `criador_noticia` (`criador_noticia`);

--
-- Indexes for table `noticias_tags`
--
ALTER TABLE `noticias_tags`
  ADD PRIMARY KEY (`id_tag`);

--
-- Indexes for table `prof_mat_tur_sal`
--
ALTER TABLE `prof_mat_tur_sal`
  ADD PRIMARY KEY (`cpfprof_pmts`,`idmat_pmts`,`idtur_pmts`,`idsala_pmts`),
  ADD KEY `idmat_pmts` (`idmat_pmts`),
  ADD KEY `idtur_pmts` (`idtur_pmts`),
  ADD KEY `idsala_pmts` (`idsala_pmts`);

--
-- Indexes for table `professores`
--
ALTER TABLE `professores`
  ADD PRIMARY KEY (`cpf_professores`),
  ADD KEY `enderecosidendereco_professores` (`enderecosidendereco_professores`);

--
-- Indexes for table `professores_materias`
--
ALTER TABLE `professores_materias`
  ADD PRIMARY KEY (`professorescpf_pm`,`materiasidmateria_pm`),
  ADD KEY `fk_mat` (`materiasidmateria_pm`);

--
-- Indexes for table `responsaveis`
--
ALTER TABLE `responsaveis`
  ADD PRIMARY KEY (`cpf_responsaveis`),
  ADD KEY `enderecosidendereco_responsaveis` (`enderecosidendereco_responsaveis`);

--
-- Indexes for table `salas`
--
ALTER TABLE `salas`
  ADD PRIMARY KEY (`idsala`);

--
-- Indexes for table `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`idturma`);

--
-- Indexes for table `turmas_alunos`
--
ALTER TABLE `turmas_alunos`
  ADD PRIMARY KEY (`turmasidturma_ta`,`alunosrm_ta`),
  ADD KEY `fk_aluno1` (`alunosrm_ta`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `acoes_recentes`
--
ALTER TABLE `acoes_recentes`
  MODIFY `idar` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `aula`
--
ALTER TABLE `aula`
  MODIFY `idaula_aula` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `enderecos`
--
ALTER TABLE `enderecos`
  MODIFY `idendereco` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `faltas`
--
ALTER TABLE `faltas`
  MODIFY `idfalta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `faltas_materias`
--
ALTER TABLE `faltas_materias`
  MODIFY `id_falta` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `horario_professor`
--
ALTER TABLE `horario_professor`
  MODIFY `idhp` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `horario_turma`
--
ALTER TABLE `horario_turma`
  MODIFY `idht` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `materias`
--
ALTER TABLE `materias`
  MODIFY `idmateria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `notas`
--
ALTER TABLE `notas`
  MODIFY `idnota` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `noticias`
--
ALTER TABLE `noticias`
  MODIFY `id_noticia` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `noticias_tags`
--
ALTER TABLE `noticias_tags`
  MODIFY `id_tag` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `turmas`
--
ALTER TABLE `turmas`
  MODIFY `idturma` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `alunos`
--
ALTER TABLE `alunos`
  ADD CONSTRAINT `fk_ed_al` FOREIGN KEY (`enderecosidedereco_aluno`) REFERENCES `enderecos` (`idendereco`),
  ADD CONSTRAINT `fk_re` FOREIGN KEY (`cpf_responsavel_aluno`) REFERENCES `responsaveis` (`cpf_responsaveis`);

--
-- Limitadores para a tabela `aula`
--
ALTER TABLE `aula`
  ADD CONSTRAINT `fk_ma_al` FOREIGN KEY (`materiasidmateria_aula`) REFERENCES `materias` (`idmateria`),
  ADD CONSTRAINT `fk_sala` FOREIGN KEY (`salasidsala_aula`) REFERENCES `salas` (`idsala`),
  ADD CONSTRAINT `fk_tu` FOREIGN KEY (`turmasidturma_aula`) REFERENCES `turmas` (`idturma`);

--
-- Limitadores para a tabela `aulas_professores`
--
ALTER TABLE `aulas_professores`
  ADD CONSTRAINT `fk_aula` FOREIGN KEY (`aulasidaula_ap`) REFERENCES `aula` (`idaula_aula`),
  ADD CONSTRAINT `fk_professres` FOREIGN KEY (`professorescpf_ap`) REFERENCES `professores` (`cpf_professores`);

--
-- Limitadores para a tabela `faltas`
--
ALTER TABLE `faltas`
  ADD CONSTRAINT `faltas_ibfk_1` FOREIGN KEY (`materiasidmateria_falta`) REFERENCES `materias` (`idmateria`),
  ADD CONSTRAINT `faltas_ibfk_2` FOREIGN KEY (`alunosrm_falta`) REFERENCES `alunos` (`rm_aluno`),
  ADD CONSTRAINT `faltas_ibfk_3` FOREIGN KEY (`cpfprof_falta`) REFERENCES `professores` (`cpf_professores`);

--
-- Limitadores para a tabela `faltas_materias`
--
ALTER TABLE `faltas_materias`
  ADD CONSTRAINT `faltas_materias_ibfk_1` FOREIGN KEY (`materiaidmateria`) REFERENCES `materias` (`idmateria`);

--
-- Limitadores para a tabela `funcionarios`
--
ALTER TABLE `funcionarios`
  ADD CONSTRAINT `fk_ed_fu` FOREIGN KEY (`enderecosidendereco_funcionarios`) REFERENCES `enderecos` (`idendereco`);

--
-- Limitadores para a tabela `horario_professor`
--
ALTER TABLE `horario_professor`
  ADD CONSTRAINT `horario_professor_ibfk_1` FOREIGN KEY (`professorcpf_horario`) REFERENCES `professores` (`cpf_professores`);

--
-- Limitadores para a tabela `horario_turma`
--
ALTER TABLE `horario_turma`
  ADD CONSTRAINT `horario_turma_ibfk_1` FOREIGN KEY (`idturma_t`) REFERENCES `turmas` (`idturma`);

--
-- Limitadores para a tabela `materias_turmas`
--
ALTER TABLE `materias_turmas`
  ADD CONSTRAINT `materias_turmas_ibfk_1` FOREIGN KEY (`materiasidmateria_mt`) REFERENCES `materias` (`idmateria`),
  ADD CONSTRAINT `materias_turmas_ibfk_2` FOREIGN KEY (`turmasidturma_mt`) REFERENCES `turmas` (`idturma`);

--
-- Limitadores para a tabela `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `notas_ibfk_1` FOREIGN KEY (`alunosrm_nota`) REFERENCES `alunos` (`rm_aluno`),
  ADD CONSTRAINT `notas_ibfk_2` FOREIGN KEY (`cpfprof_notas`) REFERENCES `professores` (`cpf_professores`),
  ADD CONSTRAINT `notas_ibfk_3` FOREIGN KEY (`materiasidmateria_nota`) REFERENCES `materias` (`idmateria`);

--
-- Limitadores para a tabela `noticias`
--
ALTER TABLE `noticias`
  ADD CONSTRAINT `noticias_ibfk_1` FOREIGN KEY (`criador_noticia`) REFERENCES `funcionarios` (`cpf_funcionarios`);

--
-- Limitadores para a tabela `prof_mat_tur_sal`
--
ALTER TABLE `prof_mat_tur_sal`
  ADD CONSTRAINT `prof_mat_tur_sal_ibfk_1` FOREIGN KEY (`cpfprof_pmts`) REFERENCES `professores` (`cpf_professores`),
  ADD CONSTRAINT `prof_mat_tur_sal_ibfk_2` FOREIGN KEY (`idmat_pmts`) REFERENCES `materias` (`idmateria`),
  ADD CONSTRAINT `prof_mat_tur_sal_ibfk_3` FOREIGN KEY (`idtur_pmts`) REFERENCES `turmas` (`idturma`),
  ADD CONSTRAINT `prof_mat_tur_sal_ibfk_4` FOREIGN KEY (`idsala_pmts`) REFERENCES `salas` (`idsala`);

--
-- Limitadores para a tabela `professores`
--
ALTER TABLE `professores`
  ADD CONSTRAINT `fk_ed_pr` FOREIGN KEY (`enderecosidendereco_professores`) REFERENCES `enderecos` (`idendereco`);

--
-- Limitadores para a tabela `professores_materias`
--
ALTER TABLE `professores_materias`
  ADD CONSTRAINT `fk_mat` FOREIGN KEY (`materiasidmateria_pm`) REFERENCES `materias` (`idmateria`),
  ADD CONSTRAINT `fk_professor` FOREIGN KEY (`professorescpf_pm`) REFERENCES `professores` (`cpf_professores`);

--
-- Limitadores para a tabela `responsaveis`
--
ALTER TABLE `responsaveis`
  ADD CONSTRAINT `fk_ed_re` FOREIGN KEY (`enderecosidendereco_responsaveis`) REFERENCES `enderecos` (`idendereco`);

--
-- Limitadores para a tabela `turmas_alunos`
--
ALTER TABLE `turmas_alunos`
  ADD CONSTRAINT `fk_aluno1` FOREIGN KEY (`alunosrm_ta`) REFERENCES `alunos` (`rm_aluno`),
  ADD CONSTRAINT `fk_turma1` FOREIGN KEY (`turmasidturma_ta`) REFERENCES `turmas` (`idturma`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
