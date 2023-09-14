-- Circuito1/demux2_1bit_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

library ieee;
use ieee.std_logic_1164.all;

entity demux1_2bit_tb is
   -- empty
end entity;

architecture arch_1 of demux1_2bit_tb is

   -- DUV component
   component demux1_2bit is
      port (
         i_SEL : in std_logic;   -- selector
         i_A   : in std_logic;   -- data input
         o_S1  : out std_logic;  -- data output
         o_S2  : out std_logic); -- data output
   end component;

   signal w_SEL, w_A, w_S1, w_S2 : std_logic;

begin
   -- Connect DUV
   u_DUT : demux1_2bit port map(
      i_SEL => w_SEL,
      i_A   => w_A,
      o_S1  => w_S1,
      o_S2  => w_S2);

   process
   begin
      -- Set S1 to input channel A=0
      w_SEL <= '0';
      w_A   <= '0';
      wait for 1 ns;
      assert(w_S1 = '0') report "Fail @ A=0; SEL=0" severity error;

      -- Set S1 to input channel A=1
      w_SEL <= '0';
      w_A   <= '1';
      wait for 1 ns;
      assert(w_S1 = '1') report "Fail @ A=1; SEL=0" severity error;

      -- Set S2 to input channel A=0
      w_SEL <= '1';
      w_A   <= '0';
      wait for 1 ns;
      assert(w_S2 = '0') report "Fail @ A=0; SEL=1" severity error;

      -- Set S2 to input channel A=1
      w_SEL <= '1';
      w_A   <= '1';
      wait for 1 ns;
      assert(w_S2 = '1') report "Fail @ A=1; SEL=1" severity error;

      -- Clear inputs
      w_SEL <= '0';
      w_A   <= '0';
      assert false report "Test done." severity note;
      wait;

   end process;
end architecture;