-- Circuito1/demux2_1bit_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alission Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circuito6_tb IS
  -- empty
END ENTITY;

ARCHITECTURE arch_1 OF circuito6_tb IS
  SIGNAL w_REQ_0, w_REQ_1, w_REQ_2, w_REQ_3 : std_logic;
  SIGNAL w_ON                               : std_logic;
  SIGNAL w_REQ                              : std_logic_vector(1 DOWNTO 0);
  -- DUV component
  COMPONENT circuito6 IS
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
  END COMPONENT;

BEGIN
  -- Connect DUV
  u_DUT : circuito6 PORT MAP(
    -- Input requests
    i_REQ_0 => w_REQ_0,
    i_REQ_1 => w_REQ_1,
    i_REQ_2 => w_REQ_2,
    i_REQ_3 => w_REQ_3,
    -- Output resutlts
    o_REQ => w_REQ,
    o_ON  => w_ON
  );

  PROCESS
  BEGIN
    --
    w_REQ_0 <= '0';
    w_REQ_1 <= '0';
    w_REQ_2 <= '0';
    w_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT(w_REQ = "00" AND w_ON = '0') REPORT "Fail @ REQ_0=off; REQ_1=off; REQ_2=off; REQ_3=off" SEVERITY error;
    --
    w_REQ_0 <= '0';
    w_REQ_1 <= '0';
    w_REQ_2 <= '0';
    w_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_REQ = "11" AND w_ON = '1') REPORT "Fail @ REQ_0=off; REQ_1=off; REQ_2=off; REQ_3=ON" SEVERITY error;
    --
    w_REQ_0 <= '0';
    w_REQ_1 <= '0';
    w_REQ_2 <= '1';
    w_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_REQ = "10" AND w_ON = '1') REPORT "Fail @ REQ_0=off; REQ_1=off; REQ_2=ON; REQ_3=ON" SEVERITY error;
    --
    w_REQ_0 <= '0';
    w_REQ_1 <= '1';
    w_REQ_2 <= '1';
    w_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_REQ = "01" AND w_ON = '1') REPORT "Fail @ REQ_0=off; REQ_1=ON; REQ_2=ON; REQ_3=ON" SEVERITY error;
    --
    w_REQ_0 <= '1';
    w_REQ_1 <= '1';
    w_REQ_2 <= '1';
    w_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT(w_REQ = "00" AND w_ON = '1') REPORT "Fail @ REQ_0=ON; REQ_1=ON; REQ_2=ON; REQ_3=ON" SEVERITY error;
    -- Clear inputs
    ASSERT false REPORT "Test done." SEVERITY note;
    WAIT;

  END PROCESS;
END ARCHITECTURE;