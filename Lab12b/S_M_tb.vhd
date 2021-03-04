library ieee;
use ieee.std_logic_1164.all;

entity S_M_tb is
end S_M_tb;

architecture behv of S_M_tb is
	component S_M is
		port(start, clk, clear : in std_logic;
    		     control_output : out std_logic_vector(3 downto 0));
	end component;


constant clk_period : time := 100 ns;
signal sStart: std_logic := '0';
signal sCLK: std_logic := '0';
signal sClear: std_logic := '0';
signal sControl_output: std_logic_vector(3 downto 0) := "0000";

for UUT : S_M use entity work.S_M(behv);
begin
UUT : S_M port map (start => sStart, clear => sclear, clk => sCLK, control_output => sControl_output);

clk_process: process
	begin
		sclk <= '0';
		wait for clk_period/2;
		sclk <= '1';
		wait for clk_period/2;
	end process clk_process;

process
begin
wait for 50 ns;
sClear <= '1';
sStart <= '1';
wait for 800 ns;
sStart <= '0';
end process;
end;
