-- Circuito5/circuito5.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circuito5 IS
  PORT (
    -- Input requests
    i_REQ_0 : IN std_logic;
    i_REQ_1 : IN std_logic;
    i_REQ_2 : IN std_logic;
    i_REQ_3 : IN std_logic;
    -- Output resutlts
    o_REQ : OUT std_logic_vector(1 DOWNTO 0)
  );
END ENTITY;

ARCHITECTURE arch_1 OF circuito5 IS
  SIGNAL w_REQ_0, w_REQ_1, w_REQ_2, w_REQ_3 : std_logic;

  COMPONENT circuito4 IS
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
  END COMPONENT;
BEGIN
  u_circ4 : circuito4 PORT MAP(
    i_REQ_0 => i_REQ_0,
    i_REQ_1 => i_REQ_1,
    i_REQ_2 => i_REQ_2,
    i_REQ_3 => i_REQ_3,
    --
    o_REQ_0 => w_REQ_0,
    o_REQ_1 => w_REQ_1,
    o_REQ_2 => w_REQ_2,
    o_REQ_3 => w_REQ_3
  );
  o_REQ <= "00" WHEN w_REQ_0 = '1' ELSE
    "01" WHEN w_REQ_1 = '1' ELSE
    "10" WHEN w_REQ_2 = '1' ELSE
    "11" WHEN w_REQ_3 = '1' ELSE
    "00";
END ARCHITECTURE;