-- Circuito6/circuito6.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alission Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circuito6 IS
  PORT (
    -- Input requests
    i_REQ_0 : IN std_logic;
    i_REQ_1 : IN std_logic;
    i_REQ_2 : IN std_logic;
    i_REQ_3 : IN std_logic;
    -- Output resutlts
    o_REQ : OUT std_logic_vector(1 DOWNTO 0);
    o_ON  : OUT std_logic
  );
END ENTITY;

ARCHITECTURE arch_1 OF circuito6 IS
  COMPONENT circuito5 IS
    PORT (
      -- Input requests
      i_REQ_0 : IN std_logic;
      i_REQ_1 : IN std_logic;
      i_REQ_2 : IN std_logic;
      i_REQ_3 : IN std_logic;
      -- Output resutlts
      o_REQ : OUT std_logic_vector(1 DOWNTO 0)
    );
  END COMPONENT;
BEGIN
  u_circ5 : circuito5 PORT MAP(
    i_REQ_0 => i_REQ_0,
    i_REQ_1 => i_REQ_1,
    i_REQ_2 => i_REQ_2,
    i_REQ_3 => i_REQ_3,
    --
    o_REQ => o_REQ
  );
  o_ON <= '1' WHEN (i_REQ_0 = '1' OR i_REQ_1 = '1' OR i_REQ_2 = '1' OR i_REQ_3 = '1') ELSE
    '0';
END ARCHITECTURE;