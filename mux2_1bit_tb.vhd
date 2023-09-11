-- Circuito1/mux2_1bit_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alission Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux2_1bit_tb IS
  -- empty
END mux2_1bit_tb;

ARCHITECTURE arch_1 OF mux2_1bit_tb IS

  -- DUV component
  COMPONENT mux2_1bit IS
    PORT (
      i_SEL : IN std_logic;   -- selector
      i_A   : IN std_logic;   -- data input
      i_B   : IN std_logic;   -- data input
      o_S   : OUT std_logic); -- data output
  END COMPONENT;

  SIGNAL w_SEL, w_A, w_B, w_S : std_logic;

BEGIN
  -- Connect DUV
  u_DUT : mux2_1bit PORT MAP(
    i_SEL => w_SEL,
    i_A   => w_A,
    i_B   => w_B,
    o_S   => w_S);

  PROCESS
  BEGIN
    -- Select input channel A
    w_SEL <= '0';
    w_A   <= '0';
    w_B   <= '0';
    WAIT FOR 1 ns;
    ASSERT(w_S = '0') REPORT "Fail @ 000" SEVERITY error;

    w_SEL <= '0';
    w_A   <= '0';
    w_B   <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S = '0') REPORT "Fail @ 001" SEVERITY error;

    w_SEL <= '0';
    w_A   <= '1';
    w_B   <= '0';
    WAIT FOR 1 ns;
    ASSERT(w_S = '1') REPORT "Fail @ 010" SEVERITY error;

    w_SEL <= '0';
    w_A   <= '1';
    w_B   <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S = '1') REPORT "Fail @ 011" SEVERITY error;

    -- Select input channel B
    w_SEL <= '1';
    w_A   <= '0';
    w_B   <= '0';
    WAIT FOR 1 ns;
    ASSERT(w_S = '0') REPORT "Fail @ 100" SEVERITY error;

    w_SEL <= '1';
    w_A   <= '0';
    w_B   <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S = '1') REPORT "Fail @ 101" SEVERITY error;

    w_SEL <= '1';
    w_A   <= '1';
    w_B   <= '0';
    WAIT FOR 1 ns;
    ASSERT(w_S = '0') REPORT "Fail @ 110" SEVERITY error;

    w_SEL <= '1';
    w_A   <= '1';
    w_B   <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S = '1') REPORT "Fail @ 111" SEVERITY error;

    -- Clear inputs
    w_SEL <= '0';
    w_A   <= '0';
    w_B   <= '0';
    ASSERT false REPORT "Test done." SEVERITY note;
    WAIT;

  END PROCESS;
END arch_1;