library ieee;
use ieee.std_logic_1164.all;

entity T_counter is
port(enable, clk_t, reset_t : in std_logic;
     Q0, Q1, Q2, Q3 : inout std_logic);
end T_counter;

architecture struct of T_counter is
component T_FF is
port(T, reset, clk : in std_logic;
     Q, QN : inout std_logic);
end component;

signal s1, s2, s3, sQ0, sQ1, sQ2, sQ3, s8, s9, s10, s11 : std_logic;

begin
	s1 <= enable AND sQ0;
	s2 <= s1 AND sQ1;
	s3 <= s2 AND sQ2;
	T_FF_instance1 : T_FF port map(T => enable, reset => reset_t, clk => clk_t, Q => sQ0, QN => s8); 
	T_FF_instance2 : T_FF port map(T => s1, reset => reset_t, clk => clk_t, Q => sQ1, QN => s9); 
	T_FF_instance3 : T_FF port map(T => s2, reset => reset_t, clk => clk_t, Q => sQ2, QN => s10);
	T_FF_instance4 : T_FF port map(T => s3, reset => reset_t, clk => clk_t, Q => sQ3, QN => s11);
	Q0 <= sQ0;
	Q1 <= sQ1;
	Q2 <= sQ2;
	Q3 <= sQ3;
end; 
