-- Circuito1/demux2_1bit_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

library ieee;
use ieee.std_logic_1164.all;

entity circuito3_tb is
   -- empty
end entity;

architecture arch_1 of circuito3_tb is

   -- DUV component
   component circuito3 is
      port (
         i_SEL_MUX   : in std_logic;   -- selector
         i_SEL_DEMUX : in std_logic;   -- selector
         i_DATA_A    : in std_logic;   -- data input
         i_DATA_B    : in std_logic;   -- data input
         o_S1        : out std_logic;  -- data output1
         o_S2        : out std_logic); -- data output2
   end component;

   signal w_SEL_MUX, w_SEL_DEMUX : std_logic;
   signal w_DATA_A, w_DATA_B     : std_logic;
   signal w_S1, w_S2             : std_logic;

begin
   -- Connect DUV
   u_DUT : circuito3 port map(
      i_SEL_MUX   => w_SEL_MUX,
      i_SEL_DEMUX => w_SEL_DEMUX,
      i_DATA_A    => w_DATA_A,
      i_DATA_B    => w_DATA_B,
      o_S1        => w_S1,
      o_S2        => w_S2
   );

   process
   begin
      -- Set S1 to input channel A=0
      w_SEL_MUX   <= '0';
      w_SEL_DEMUX <= '0';
      w_DATA_A    <= '0';
      w_DATA_B    <= '1';
      wait for 1 ns;
      assert(w_S1 = '0') report "Fail @ A=0; B=1; SEL_MUX=0; SEL_DEMUX=0" severity error;

      -- Set S1 to input channel A=0
      w_SEL_MUX <= '1';
      wait for 1 ns;
      assert(w_S1 = '1') report "Fail @ A=0; B=1; SEL_MUX=1; SEL_DEMUX=0" severity error;
      --
      w_SEL_MUX   <= '0';
      w_SEL_DEMUX <= '1';
      wait for 1 ns;
      assert(w_S2 = '0') report "Fail @ A=0; B=1; SEL_MUX=0; SEL_DEMUX=1" severity error;
      --
      w_SEL_MUX   <= '1';
      w_SEL_DEMUX <= '1';
      wait for 1 ns;
      assert(w_S2 = '1') report "Fail @ A=0; B=1; SEL_MUX=1; SEL_DEMUX=1" severity error;

      ---
      w_SEL_MUX   <= '0';
      w_SEL_DEMUX <= '0';
      w_DATA_A    <= '0';
      w_DATA_B    <= '1';
      wait for 1 ns;
      assert(w_S1 = '0') report "Fail @ A=0; B=1; SEL_MUX=0; SEL_DEMUX=0" severity error;
      -- Clear inputs
      w_SEL_MUX   <= '0';
      w_SEL_DEMUX <= '0';
      w_DATA_A    <= '0';
      w_DATA_B    <= '0';
      assert false report "Test done." severity note;
      wait;

   end process;
end architecture;