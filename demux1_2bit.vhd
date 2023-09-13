-- Circuito2/demux1_2bit.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY demux1_2bit IS
  PORT (
    i_SEL : IN std_logic;   -- selector
    i_A   : IN std_logic;   -- data input
    o_S1  : OUT std_logic;  -- data output1
    o_S2  : OUT std_logic); -- data output2
END ENTITY;

ARCHITECTURE arch_1 OF demux1_2bit IS
BEGIN
  PROCESS (i_SEL, i_A)
  BEGIN
    IF (i_SEL = '0') THEN 
      o_S1 <= i_A;
      o_S2 <= '0';
    ELSE
      o_S1 <= '0';
      o_S2 <= i_A;
    END IF;
  END PROCESS;
END ARCHITECTURE;