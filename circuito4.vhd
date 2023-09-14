-- Circuito4/circuito4.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

library ieee;
use ieee.std_logic_1164.all;

entity circuito4 is
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
end entity;

architecture arch_1 of circuito4 is
begin
   --   PROCESS (i_REQ_0, i_REQ_1, i_REQ_2, i_REQ_3)
   --   BEGIN
   o_REQ_0 <= i_REQ_0;
   o_REQ_1 <= '1' when (i_REQ_0 = '0' and i_REQ_1 = '1') else
      '0';
   o_REQ_2 <= '1' when (i_REQ_0 = '0' and i_REQ_1 = '0' and i_REQ_2 = '1') else
      '0';
   o_REQ_3 <= '1' when (i_REQ_0 = '0' and i_REQ_1 = '0' and i_REQ_2 = '0' and i_REQ_3 = '1') else
      '0';
   --   END PROCESS;
end architecture;