-- Circuito2/demux1_2bit.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

library ieee;
use ieee.std_logic_1164.all;

entity demux1_2bit is
   port (
      i_SEL : in std_logic;   -- selector
      i_A   : in std_logic;   -- data input
      o_S1  : out std_logic;  -- data output1
      o_S2  : out std_logic); -- data output2
end entity;

architecture arch_1 of demux1_2bit is
begin
   process (i_SEL, i_A)
   begin
      o_S1 <= i_A and (not i_SEL);
      o_S2 <= i_A and i_SEL;
   end process;
end architecture;