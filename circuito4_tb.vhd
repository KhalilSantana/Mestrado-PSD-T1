-- Circuito4/circuito4_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY circuito4_tb IS
  -- empty
END ENTITY;

ARCHITECTURE arch_1 OF circuito4_tb IS

  -- DUV component
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

  SIGNAL w_i_REQ_0, w_i_REQ_1, w_i_REQ_2, w_i_REQ_3  : std_logic;
  SIGNAL w_o_REQ_0, w_o_REQ_1, w_o_REQ_2, w_o_REQ_3  : std_logic;

BEGIN
  -- Connect DUV
  u_DUT : circuito4 PORT MAP(
    i_REQ_0 => w_i_REQ_0,
    i_REQ_1 => w_i_REQ_1,
    i_REQ_2 => w_i_REQ_2,
    i_REQ_3 => w_i_REQ_3,
    o_REQ_0 => w_o_REQ_0,
	 o_REQ_1 => w_o_REQ_1,
	 o_REQ_2 => w_o_REQ_2,
	 o_REQ_3 => w_o_REQ_3
  );

  PROCESS
  BEGIN
    w_i_REQ_0 <= '0';
    w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '0') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '1')) REPORT "Fail @ 0001" SEVERITY error;
	 
	 w_i_REQ_0 <= '0';
    w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '0') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '1')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 0010" SEVERITY error;

	 w_i_REQ_0 <= '0';
	 w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '0') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '1')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 0011" SEVERITY error;

    w_i_REQ_0 <= '0';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '0') and (w_o_REQ_1 = '1')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 0100" SEVERITY error;

	 w_i_REQ_0 <= '0';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '0') and (w_o_REQ_1 = '1')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 0101" SEVERITY error;

	 w_i_REQ_0 <= '0';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '0') and (w_o_REQ_1 = '1')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 0110" SEVERITY error;

	 w_i_REQ_0 <= '0';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '0') and (w_o_REQ_1 = '1')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 0111" SEVERITY error;

	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1000" SEVERITY error;

	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1001" SEVERITY error;

	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1010" SEVERITY error;

	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1011" SEVERITY error;

	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1100" SEVERITY error;

	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1101" SEVERITY error;

	 
	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '0';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1110" SEVERITY error;

	 w_i_REQ_0 <= '1';
	 w_i_REQ_1 <= '1';
    w_i_REQ_2 <= '1';
    w_i_REQ_3 <= '1';
    WAIT FOR 1 ns;
    ASSERT((w_o_REQ_0 = '1') and (w_o_REQ_1 = '0')  and (w_o_REQ_2 = '0')  and (w_o_REQ_3 = '0')) REPORT "Fail @ 1111" SEVERITY error;

	 
    -- Clear inputs

	 w_i_REQ_0 <= '0';
	 w_i_REQ_1 <= '0';
    w_i_REQ_2 <= '0';
    w_i_REQ_3 <= '0';
    ASSERT false REPORT "Test done." SEVERITY note;
    WAIT;

  END PROCESS;
END ARCHITECTURE;