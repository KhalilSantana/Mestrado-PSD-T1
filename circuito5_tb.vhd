-- Circuito5/circuito5_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

library ieee;
use ieee.std_logic_1164.all;

entity circuito5_tb is
   -- empty
end entity;

architecture arch_1 of circuito5_tb is

   -- DUV component
   component circuito5 is
      port (
         -- Input requests
         i_REQ_0 : in std_logic;
         i_REQ_1 : in std_logic;
         i_REQ_2 : in std_logic;
         i_REQ_3 : in std_logic;
         -- Output resutlts
         o_REQ : out std_logic_vector(1 downto 0)

      );
   end component;

   signal w_i_REQ_0, w_i_REQ_1, w_i_REQ_2, w_i_REQ_3 : std_logic;
   signal w_o_REQ                                    : std_logic_vector(1 downto 0);

begin
   -- Connect DUV
   u_DUT : circuito5 port map(
      i_REQ_0 => w_i_REQ_0,
      i_REQ_1 => w_i_REQ_1,
      i_REQ_2 => w_i_REQ_2,
      i_REQ_3 => w_i_REQ_3,
      o_REQ   => w_o_REQ
   );

   process
   begin
      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = ("11")) report "Fail @ 0001" severity error;

      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_o_REQ = ("10")) report "Fail @ 0010" severity error;

      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = ("10")) report "Fail @ 0011" severity error;

      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_o_REQ = ("01")) report "Fail @ 0100" severity error;

      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = ("01")) report "Fail @ 0101" severity error;

      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_o_REQ = ("01")) report "Fail @ 0110" severity error;

      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = ("01")) report "Fail @ 0111" severity error;

      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_o_REQ = ("00")) report "Fail @ 1000" severity error;

      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = ("00")) report "Fail @ 1001" severity error;

      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_o_REQ = ("00")) report "Fail @ 1010" severity error;

      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = ("00")) report "Fail @ 1011" severity error;

      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_o_REQ = ("00")) report "Fail @ 1100" severity error;

      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = ("00")) report "Fail @ 1101" severity error;
      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_o_REQ = ("00")) report "Fail @ 1110" severity error;

      w_i_REQ_0 <= '1';
      w_i_REQ_1 <= '1';
      w_i_REQ_2 <= '1';
      w_i_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_o_REQ = "00") report "Fail @ 1111" severity error;
      -- Clear inputs

      w_i_REQ_0 <= '0';
      w_i_REQ_1 <= '0';
      w_i_REQ_2 <= '0';
      w_i_REQ_3 <= '0';
      assert false report "Test done." severity note;
      wait;

   end process;
end architecture;