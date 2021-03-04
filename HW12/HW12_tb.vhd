library ieee;
use ieee.std_logic_1164.all;

entity HW12_tb is
end HW12_tb;

architecture behv of HW12_tb is
	component HW12 is
	port(x, rst, clk: in std_logic;
    	     z : out std_logic);
	end component;

constant clk_period : time := 100 ns;
signal sX: std_logic := '0';
signal sRST: std_logic := '0';
signal sCLK: std_logic := '0';
signal sZ: std_logic := '0';

for UUT : HW12 use entity work.HW12(behv);
begin

UUT : HW12 port map (x => sX, rst => sRST, clk => sCLK, z => sZ);

clk_process: process
	begin
		sclk <= '0';
		wait for clk_period/2;
		sclk <= '1';
		wait for clk_period/2;
	end process clk_process;

process
begin
wait until falling_edge(sclk);
sRST <= '1';
wait until falling_edge(sclk);
sX <= '0';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '0';
wait until falling_edge(sclk);
sX <= '0';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '0';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '0';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '1';
wait until falling_edge(sclk);
sX <= '0';
wait until falling_edge(sclk);
sX <= '0';
end process;
end;