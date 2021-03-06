library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb is 
end tb;

architecture behv of tb is 
	component DM74LS153 is
	port(
		G1, G2, A, B : in std_logic;
		C1, C2 : in std_logic_vector(3 downto 0);
		Y1, Y2 : out std_logic);
	end component;

signal sA: std_logic := '0';
signal sB: std_logic := '0';
signal sG1: std_logic := '0';
signal sG2: std_logic := '0';
signal sC1: std_logic_vector(3 downto 0) := "0000";
signal sC2: std_logic_vector(3 downto 0) := "0000";
signal sY1: std_logic := '0';
signal sY2: std_logic := '0';

for UUT1 : DM74LS153 use entity work.DM74LS153(df);
for UUT2 : DM74LS153 use entity work.DM74LS153(behv);
for UUT3 : DM74LS153 use entity work.DM74LS153(struct);

begin
	UUT1 : DM74LS153 port map (A => sA, B => sB, G1 => sG1, G2 => sG2, C1 => sC1, C2 => sC2, Y1 => sY1, Y2 => sY2);
	UUT2 : DM74LS153 port map (A => sA, B => sB, G1 => sG1, G2 => sG2, C1 => sC1, C2 => sC2, Y1 => sY1, Y2 => sY2);
	UUT3 : DM74LS153 port map (A => sA, B => sB, G1 => sG1, G2 => sG2, C1 => sC1, C2 => sC2, Y1 => sY1, Y2 => sY2);

process
begin
	sA <= '0' ;
	sB <= '0' ;
	sC1 <= "1110" ;
	sC2 <= "1110" ;
	wait for 100 ns;
	
	sA <= '0' ;
	sB <= '0' ;
	sC1 <= "0001" ;
	sC2 <= "0001" ;
	wait for 100 ns;
	
	sA <= '1' ;
	sB <= '0' ;
	sC1 <= "1101" ;
	sC2 <= "1101" ;
	wait for 100 ns;
	
	sA <= '1' ;
	sB <= '0' ;
	sC1 <= "0010" ;
	sC2 <= "0010" ;
	wait for 100 ns;

	sA <= '0' ;
	sB <= '1' ;
	sC1 <= "1011" ;
	sC2 <= "1011" ;
	wait for 100 ns;

	sA <= '0' ;
	sB <= '1' ;
	sC1 <= "0100" ;
	sC2 <= "0100" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '1' ;
	sC1 <= "0111" ;
	sC2 <= "0111" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '1' ;
	sC1 <= "0001" ;
	sC2 <= "0001" ;
	wait for 100 ns;
end process;
end;