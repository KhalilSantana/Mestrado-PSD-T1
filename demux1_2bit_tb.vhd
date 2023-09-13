-- Circuito1/demux2_1bit_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY demux1_2bit_tb IS
  -- empty
END ENTITY;

ARCHITECTURE arch_1 OF demux1_2bit_tb IS

  -- DUV component
  COMPONENT demux1_2bit IS
    PORT (
      i_SEL : IN std_logic;   -- selector
      i_A   : IN std_logic;   -- data input
      o_S1  : OUT std_logic;  -- data output
      o_S2  : OUT std_logic); -- data output
  END COMPONENT;

  SIGNAL w_SEL, w_A, w_S1, w_S2 : std_logic;

BEGIN
  -- Connect DUV
  u_DUT : demux1_2bit PORT MAP(
    i_SEL => w_SEL,
    i_A   => w_A,
    o_S1  => w_S1,
    o_S2  => w_S2);

  PROCESS
  BEGIN
    -- Set S1 to input channel A=0
    w_SEL <= '0';
    w_A   <= '0';
    WAIT FOR 1 ns;
    ASSERT(w_S1 = '0') REPORT "Fail @ A=0; SEL=0" SEVERITY error;

    -- Set S1 to input channel A=1
    w_SEL <= '0';
    w_A   <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S1 = '1') REPORT "Fail @ A=1; SEL=0" SEVERITY error;

    -- Set S2 to input channel A=0
    w_SEL <= '1';
    w_A   <= '0';
    WAIT FOR 1 ns;
    ASSERT(w_S2 = '0') REPORT "Fail @ A=0; SEL=1" SEVERITY error;

    -- Set S2 to input channel A=1
    w_SEL <= '1';
    w_A   <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S2 = '1') REPORT "Fail @ A=1; SEL=1" SEVERITY error;

    -- Clear inputs
    w_SEL <= '0';
    w_A   <= '0';
    ASSERT false REPORT "Test done." SEVERITY note;
    WAIT;

  END PROCESS;
END ARCHITECTURE;