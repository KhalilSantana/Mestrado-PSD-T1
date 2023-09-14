-- Circuito1/demux2_1bit_tb.vhd
-- Disciplina : Projeto de Sistemas Digitais
-- Atividade  : Avaliação 1 - Projeto de Circuitos Combinacionais usando VHDL
-- Alunos     : Khalil G. Q. de Santana, Alisson Boeing

library ieee;
use ieee.std_logic_1164.all;

entity circuito6_tb is
   -- empty
end entity;

architecture arch_1 of circuito6_tb is
   signal w_REQ_0, w_REQ_1, w_REQ_2, w_REQ_3 : std_logic;
   signal w_ON                               : std_logic;
   signal w_REQ                              : std_logic_vector(1 downto 0);
   -- DUV component
   component circuito6 is
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
   end component;

begin
   -- Connect DUV
   u_DUT : circuito6 port map(
      -- Input requests
      i_REQ_0 => w_REQ_0,
      i_REQ_1 => w_REQ_1,
      i_REQ_2 => w_REQ_2,
      i_REQ_3 => w_REQ_3,
      -- Output resutlts
      o_REQ => w_REQ,
      o_ON  => w_ON
   );

   process
   begin
      --
      w_REQ_0 <= '0';
      w_REQ_1 <= '0';
      w_REQ_2 <= '0';
      w_REQ_3 <= '0';
      wait for 1 ns;
      assert(w_REQ = "00" and w_ON = '0') report "Fail @ REQ_0=off; REQ_1=off; REQ_2=off; REQ_3=off" severity error;
      --
      w_REQ_0 <= '0';
      w_REQ_1 <= '0';
      w_REQ_2 <= '0';
      w_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_REQ = "11" and w_ON = '1') report "Fail @ REQ_0=off; REQ_1=off; REQ_2=off; REQ_3=ON" severity error;
      --
      w_REQ_0 <= '0';
      w_REQ_1 <= '0';
      w_REQ_2 <= '1';
      w_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_REQ = "10" and w_ON = '1') report "Fail @ REQ_0=off; REQ_1=off; REQ_2=ON; REQ_3=ON" severity error;
      --
      w_REQ_0 <= '0';
      w_REQ_1 <= '1';
      w_REQ_2 <= '1';
      w_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_REQ = "01" and w_ON = '1') report "Fail @ REQ_0=off; REQ_1=ON; REQ_2=ON; REQ_3=ON" severity error;
      --
      w_REQ_0 <= '1';
      w_REQ_1 <= '1';
      w_REQ_2 <= '1';
      w_REQ_3 <= '1';
      wait for 1 ns;
      assert(w_REQ = "00" and w_ON = '1') report "Fail @ REQ_0=ON; REQ_1=ON; REQ_2=ON; REQ_3=ON" severity error;
      -- Clear inputs
      assert false report "Test done." severity note;
      wait;

   end process;
end architecture;