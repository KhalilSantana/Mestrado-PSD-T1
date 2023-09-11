-- Circuito1/mux2_1bit.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alission Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2_1bit IS
  PORT (
    i_SEL : IN std_logic;   -- selector
    i_A   : IN std_logic;   -- data input
    i_B   : IN std_logic;   -- data input
    o_S   : OUT std_logic); -- data output
END mux2_1bit;

ARCHITECTURE arch_1 OF mux2_1bit IS
BEGIN
  PROCESS (i_SEL, i_A, i_B)
  BEGIN
    IF (i_SEL = '0') THEN o_S <= i_A;
    ELSE
      o_S <= i_B;
    END IF;
  END PROCESS;
END arch_1;