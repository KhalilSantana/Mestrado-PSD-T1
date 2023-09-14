-- Circuito3/circuito3.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

library ieee;
use ieee.std_logic_1164.all;

entity circuito3 is
   port (
      i_SEL_MUX   : in std_logic;   -- selector
      i_SEL_DEMUX : in std_logic;   -- selector
      i_DATA_A    : in std_logic;   -- data input
      i_DATA_B    : in std_logic;   -- data input
      o_S1        : out std_logic;  -- data output1
      o_S2        : out std_logic); -- data output2
end entity;

architecture arch_1 of circuito3 is
   signal w_MUX_OUTPUT : std_logic;

   component mux2_1bit is
      port (
         i_SEL : in std_logic;   -- selector
         i_A   : in std_logic;   -- data input
         i_B   : in std_logic;   -- data input
         o_S   : out std_logic); -- data output
   end component;

   component demux1_2bit is
      port (
         i_SEL : in std_logic;   -- selector
         i_A   : in std_logic;   -- data input
         o_S1  : out std_logic;  -- data output
         o_S2  : out std_logic); -- data output
   end component;

begin
   u_MUX : mux2_1bit
   port map(
      i_SEL => i_SEL_MUX,
      i_A   => i_DATA_A,
      i_B   => i_DATA_B,
      o_S   => w_MUX_OUTPUT
   );
   u_DEMUX : demux1_2bit
   port map(
      i_SEL => i_SEL_DEMUX,
      i_A   => w_MUX_OUTPUT,
      o_S1  => o_S1,
      o_S2  => o_S2
   );
end architecture;