-- Circuito1/demux2_1bit_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circuito3_tb IS
  -- empty
END ENTITY;

ARCHITECTURE arch_1 OF circuito3_tb IS

  -- DUV component
  COMPONENT circuito3 IS
    PORT (
      i_SEL_MUX   : IN std_logic;   -- selector
      i_SEL_DEMUX : IN std_logic;   -- selector
      i_DATA_A    : IN std_logic;   -- data input
      i_DATA_B    : IN std_logic;   -- data input
      o_S1        : OUT std_logic;  -- data output1
      o_S2        : OUT std_logic); -- data output2
  END COMPONENT;

  SIGNAL w_SEL_MUX, w_SEL_DEMUX : std_logic;
  SIGNAL w_DATA_A, w_DATA_B     : std_logic;
  SIGNAL w_S1, w_S2             : std_logic;

BEGIN
  -- Connect DUV
  u_DUT : circuito3 PORT MAP(
    i_SEL_MUX   => w_SEL_MUX,
    i_SEL_DEMUX => w_SEL_DEMUX,
    i_DATA_A    => w_DATA_A,
    i_DATA_B    => w_DATA_B,
    o_S1        => w_S1,
    o_S2        => w_S2
  );

  PROCESS
  BEGIN
    -- Set S1 to input channel A=0
    w_SEL_MUX   <= '0';
    w_SEL_DEMUX <= '0';
    w_DATA_A    <= '0';
    w_DATA_B    <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S1 = '0') REPORT "Fail @ A=0; B=1; SEL_MUX=0; SEL_DEMUX=0" SEVERITY error;

    -- Set S1 to input channel A=0
    w_SEL_MUX <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S1 = '1') REPORT "Fail @ A=0; B=1; SEL_MUX=1; SEL_DEMUX=0" SEVERITY error;
    --
    w_SEL_MUX   <= '0';
    w_SEL_DEMUX <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S2 = '0') REPORT "Fail @ A=0; B=1; SEL_MUX=0; SEL_DEMUX=1" SEVERITY error;
    --
    w_SEL_MUX   <= '1';
    w_SEL_DEMUX <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S2 = '1') REPORT "Fail @ A=0; B=1; SEL_MUX=1; SEL_DEMUX=1" SEVERITY error;

    ---
    w_SEL_MUX   <= '0';
    w_SEL_DEMUX <= '0';
    w_DATA_A    <= '0';
    w_DATA_B    <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_S1 = '0') REPORT "Fail @ A=0; B=1; SEL_MUX=0; SEL_DEMUX=0" SEVERITY error;
    -- Clear inputs
    w_SEL_MUX   <= '0';
    w_SEL_DEMUX <= '0';
    w_DATA_A    <= '0';
    w_DATA_B    <= '0';
    ASSERT false REPORT "Test done." SEVERITY note;
    WAIT;

  END PROCESS;
END ARCHITECTURE;