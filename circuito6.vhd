-- Circuito6/circuito6.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alission Boeing

library ieee;
use ieee.std_logic_1164.all;

entity circuito6 is
 port (
  -- Input requests
  i_REQ_0 : in std_logic;
  i_REQ_1 : in std_logic;
  i_REQ_2 : in std_logic;
  i_REQ_3 : in std_logic;
  -- Output resutlts
  o_REQ : out std_logic_vector(1 downto 0);
  o_ON  : out std_logic
 );
end entity;

architecture arch_1 of circuito6 is
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
begin
 u_circ5 : circuito5 port map(
  i_REQ_0 => i_REQ_0,
  i_REQ_1 => i_REQ_1,
  i_REQ_2 => i_REQ_2,
  i_REQ_3 => i_REQ_3,
  --
  o_REQ => o_REQ
 );
 o_ON <= '1' when (i_REQ_0 = '1' or i_REQ_1 = '1' or i_REQ_2 = '1' or i_REQ_3 = '1') else
  '0';
end architecture;