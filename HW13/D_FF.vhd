library ieee;
use ieee.std_logic_1164.all;

entity D_FF is
port(D, reset, clk : in std_logic;
     Q, QN : inout std_logic := '0');
end D_FF;

architecture behv of D_FF is
begin 
process(reset, clk)
begin
	if(rising_edge(clk)) and reset = '0' then
		Q <= D after 5 ns;
		QN <= NOT D after 5 ns; 
	elsif reset = '1' then
		Q <= '0' after 5 ns;
		QN <= '1' after 5 ns;
	end if;
end process;
end;
