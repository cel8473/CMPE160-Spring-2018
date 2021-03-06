library ieee;
use ieee.std_logic_1164.all;

entity D_T_TB is
end D_T_TB;

architecture behv of D_T_TB is 
component T_counter is
port(enable, clk_t, reset_t : in std_logic;
     Q0, Q1, Q2, Q3 : inout std_logic);
end component;

component D_counter is
port(clk_d, reset_d : in std_logic;
     Q0, Q1, Q2 : inout std_logic);
end component;

constant clk_period : time := 100 ns;
signal sClock : std_logic := '0';
signal sReset : std_logic := '0';
signal sEnable : std_logic := '0';

signal sQD : std_logic_vector(2 downto 0);
signal sQT : std_logic_vector(3 downto 0);

for UUT1 : T_counter use entity work.T_counter(struct);
for UUT2 : D_counter use entity work.D_counter(struct);

begin 

UUT1 : T_counter port map (enable => sEnable, clk_t => sClock, reset_t => sReset, Q0 => sQT(0), Q1 => sQT(1), Q2 => sQT(2), Q3 => sQT(3));
UUT2 : D_counter port map (clk_d => sClock, reset_d => sReset, Q0 => sQD(0), Q1 => sQD(1), Q2 => sQD(2));

clk_process : process
begin
	sClock <= '0';
	wait for clk_period/2;
	sClock <= '1';
	wait for clk_period/2;
end process clk_process;

process
begin	
	sreset <= '1';
	wait until rising_edge(sclock);
	sreset <= '0';
	senable <= '1';
	wait until sQT = "1111";
end process;
end;
