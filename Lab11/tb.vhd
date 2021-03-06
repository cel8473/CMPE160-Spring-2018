--Company : RIT
--Author : Chris Larson
--Created : 11 April 2018
--Project Name : Lab 11
--File Name : DM74LS153
--Entity : DM74LS153
--Architecture : behv, df, struct (DM74LS153) 
--Tool : VHDL '93
--Description : The testbench to test how all of the different models compare to each other, showing that they are the same.
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--declares the entity tb
entity tb is 
end tb;

--declares the behavioral model of tb
architecture behv of tb is 
	component DM74LS153 is
	port(
		G1, G2, A, B : in std_logic; -- inputs
		C1, C2 : in std_logic_vector(3 downto 0); -- 4-bit input vectors
		Y1, Y2 : out std_logic); --outputs
	end component;
--declares the signals
signal sA: std_logic := '0';
signal sB: std_logic := '0';
signal sG1: std_logic := '0';
signal sG2: std_logic := '0';
signal sC1: std_logic_vector(3 downto 0) := "0000";
signal sC2: std_logic_vector(3 downto 0) := "0000";
signal sY1A: std_logic := '0';
signal sY2A: std_logic := '0';
signal sY1B: std_logic := '0';
signal sY2B: std_logic := '0';
signal sY1C: std_logic := '0';
signal sY2C: std_logic := '0';
--tells which UUT to use what entity
for UUT1 : DM74LS153 use entity work.DM74LS153(df);
for UUT2 : DM74LS153 use entity work.DM74LS153(behv);
for UUT3 : DM74LS153 use entity work.DM74LS153(struct);

begin
--assigns the values for each of the inputs and outputs in the circuit
	UUT1 : DM74LS153 port map (A => sA, B => sB, G1 => sG1, G2 => sG2, C1 => sC1, C2 => sC2, Y1 => sY1A, Y2 => sY2A);
	UUT2 : DM74LS153 port map (A => sA, B => sB, G1 => sG1, G2 => sG2, C1 => sC1, C2 => sC2, Y1 => sY1B, Y2 => sY2B);
	UUT3 : DM74LS153 port map (A => sA, B => sB, G1 => sG1, G2 => sG2, C1 => sC1, C2 => sC2, Y1 => sY1C, Y2 => sY2C);

process
-- the 4 test cases that show multiple situations 
begin
	-- Test set 1 G =0
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
	sC1 <= "1000" ;
	sC2 <= "1000" ;
	wait for 100 ns;
	--Test set 2 G =0
	sA <= '0' ;
	sB <= '0' ;
	sC1 <= "1010" ;
	sC2 <= "1010" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '0' ;
	sC1 <= "1010" ;
	sC2 <= "1010" ;
	wait for 100 ns;
	
	sA <= '0' ;
	sB <= '1' ;
	sC1 <= "1010" ;
	sC2 <= "1010" ;
	wait for 100 ns;
	
	sA <= '1' ;
	sB <= '1' ;
	sC1 <= "1010" ;
	sC2 <= "1010" ;
	wait for 100 ns;

	sA <= '0' ;
	sB <= '0' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '0' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;
	
	sA <= '0' ;
	sB <= '1' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '1' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;
	-- Test set 1 G =1
	sG1 <= '1';
	sG2 <= '1';
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
	sC1 <= "1000" ;
	sC2 <= "1000" ;
	wait for 100 ns;
	-- Test set 2 G =1
	sA <= '0' ;
	sB <= '0' ;
	sC1 <= "1010" ;sA <= '0' ;
	sB <= '0' ;
	sC1 <= "1010" ;
	sC2 <= "1010" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '0' ;
	sC1 <= "1010" ;
	sC2 <= "1010" ;
	wait for 100 ns;
	
	sA <= '0' ;
	sB <= '1' ;
	sC1 <= "1010" ;
	sC2 <= "1010" ;
	wait for 100 ns;
	
	sA <= '1' ;
	sB <= '1' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;

	sA <= '0' ;
	sB <= '0' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '0' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;
	
	sA <= '0' ;
	sB <= '1' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;

	sA <= '1' ;
	sB <= '1' ;
	sC1 <= "0101" ;
	sC2 <= "0101" ;
	wait for 100 ns;
end process;
end;