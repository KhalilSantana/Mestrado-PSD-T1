-- Circuito5/circuito5.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alission Boeing

library ieee;
use ieee.std_logic_1164.all;

entity circuito5 is
   port (
      -- Input requests
      i_REQ_0 : in std_logic;
      i_REQ_1 : in std_logic;
      i_REQ_2 : in std_logic;
      i_REQ_3 : in std_logic;
      -- Output resutlts
      o_REQ : out std_logic_vector(1 downto 0)
   );
end entity;

architecture arch_1 of circuito5 is
   signal w_REQ_0, w_REQ_1, w_REQ_2, w_REQ_3 : std_logic;

   component circuito4 is
      port (
         -- Input requests
         i_REQ_0 : in std_logic;
         i_REQ_1 : in std_logic;
         i_REQ_2 : in std_logic;
         i_REQ_3 : in std_logic;
         -- Output resutlts
         o_REQ_0 : out std_logic;
         o_REQ_1 : out std_logic;
         o_REQ_2 : out std_logic;
         o_REQ_3 : out std_logic
      );
   end component;
begin
   u_circ4 : circuito4 port map(
      i_REQ_0 => i_REQ_0,
      i_REQ_1 => i_REQ_1,
      i_REQ_2 => i_REQ_2,
      i_REQ_3 => i_REQ_3,
      --
      o_REQ_0 => w_REQ_0,
      o_REQ_1 => w_REQ_1,
      o_REQ_2 => w_REQ_2,
      o_REQ_3 => w_REQ_3
   );
   o_REQ <= "00" when w_REQ_0 = '1' else
      "01" when w_REQ_1 = '1' else
      "10" when w_REQ_2 = '1' else
      "11" when w_REQ_3 = '1' else
      "00";
end architecture;