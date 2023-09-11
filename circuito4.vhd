-- Circuito4/circuito4.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alission Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circuito4 IS
  PORT (
    -- Input requests
    i_REQ_0 : IN std_logic;
    i_REQ_1 : IN std_logic;
    i_REQ_2 : IN std_logic;
    i_REQ_3 : IN std_logic;
    -- Output resutlts
    o_REQ_0 : OUT std_logic;
    o_REQ_1 : OUT std_logic;
    o_REQ_2 : OUT std_logic;
    o_REQ_3 : OUT std_logic
  );
END ENTITY;

ARCHITECTURE arch_1 OF circuito4 IS
BEGIN
  --   PROCESS (i_REQ_0, i_REQ_1, i_REQ_2, i_REQ_3)
  --   BEGIN
  o_REQ_0 <= i_REQ_0;
  o_REQ_1 <= '1' WHEN (i_REQ_0 = '0' AND i_REQ_1 = '1') ELSE
    '0';
  o_REQ_2 <= '1' WHEN (i_REQ_0 = '0' AND i_REQ_1 = '0' AND i_REQ_2 = '1') ELSE
    '0';
  o_REQ_3 <= '1' WHEN (i_REQ_0 = '0' AND i_REQ_1 = '0' AND i_REQ_2 = '1' AND i_REQ_3 = '1') ELSE
    '0';
  --   END PROCESS;
END ARCHITECTURE;