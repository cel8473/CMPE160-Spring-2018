library ieee;
use ieee.std_logic_1164.all;

entity D_counter is
port(clk_d, reset_d : in std_logic;
     Q0, Q1, Q2 : inout std_logic);
end D_counter;

architecture struct of D_counter is
component D_FF is
port(D, reset, clk : in std_logic;
     Q, QN : inout std_logic);
end component;

signal sQ0, sQ1, sQ2 : std_logic;
begin

	D_FF_instance1 : D_FF port map (D => sQ0, reset => reset_d, clk => clk_d, Q => Q0, QN => sQ0);
	D_FF_instance2 : D_FF port map (D => sQ1, reset => reset_d, clk => sQ0, Q => Q1, QN => sQ1);
	D_FF_instance3 : D_FF port map (D => sQ2, reset => reset_d, clk => sQ1, Q => Q2, QN => sQ2);
end;