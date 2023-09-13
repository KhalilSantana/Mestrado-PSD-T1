-- Circuito3/circuito3.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circuito3 IS
  PORT (
    i_SEL_MUX   : IN std_logic;   -- selector
    i_SEL_DEMUX : IN std_logic;   -- selector
    i_DATA_A    : IN std_logic;   -- data input
    i_DATA_B    : IN std_logic;   -- data input
    o_S1        : OUT std_logic;  -- data output1
    o_S2        : OUT std_logic); -- data output2
END ENTITY;

ARCHITECTURE arch_1 OF circuito3 IS
  SIGNAL w_MUX_OUTPUT : std_logic;

  COMPONENT mux2_1bit IS
    PORT (
      i_SEL : IN std_logic;   -- selector
      i_A   : IN std_logic;   -- data input
      i_B   : IN std_logic;   -- data input
      o_S   : OUT std_logic); -- data output
  END COMPONENT;

  COMPONENT demux1_2bit IS
    PORT (
      i_SEL : IN std_logic;   -- selector
      i_A   : IN std_logic;   -- data input
      o_S1  : OUT std_logic;  -- data output
      o_S2  : OUT std_logic); -- data output
  END COMPONENT;

BEGIN
  u_MUX : mux2_1bit
  PORT MAP(
    i_SEL => i_SEL_MUX,
    i_A   => i_DATA_A,
    i_B   => i_DATA_B,
    o_S   => w_MUX_OUTPUT
  );
  u_DEMUX : demux1_2bit
  PORT MAP(
    i_SEL => i_SEL_DEMUX,
    i_A   => w_MUX_OUTPUT,
    o_S1  => o_S1,
    o_S2  => o_S2
  );
END ARCHITECTURE;