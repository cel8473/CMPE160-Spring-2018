library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity tb is
end tb;

architecture behv of tb is 
	component four_bit is
	port(Y1, Y2, Y3, Y4, A_S : in std_logic;
	     X1, X2, X3, X4 : in std_logic;
	     S1, S2, S3, S4, Cout : out std_logic);
	end component;

signal aY1 : std_logic := '0';
signal aY2 : std_logic := '0';
signal aY3 : std_logic := '0';
signal aY4 : std_logic := '0';
signal aX1 : std_logic := '0';
signal aX2 : std_logic := '0';
signal aX3 : std_logic := '0';
signal aX4 : std_logic := '0';
signal aS1 : std_logic := '0';
signal aS2 : std_logic := '0';
signal aS3 : std_logic := '0';
signal aS4 : std_logic := '0';
signal aCout : std_logic := '0';
signal aA_S : std_logic := '0';

for UUT : four_bit use entity work.four_bit(struct);
begin 

	UUT : four_bit port map (Y1 => aY1, Y2 => aY2, Y3 => aY3, Y4 => aY4,
				 X1 => aX1, X2 => aX2, X3 => aX3, X4 => aX4, 
				 A_S => aA_S, S1 => aS1, S2 => aS2, S3 => aS3,  S4 => aS4, Cout => aCout);

process
begin
	aY1 <= '1';
	aY2 <= '0';
	aY3 <= '1';
	aY4 <= '0';
	aX1 <= '0';
	aX2 <= '1';
	aX3 <= '0';
	aX4 <= '1';
	aA_S <= '0';
	wait for 50 ns;

	aY1 <= '1';
	aY2 <= '1';
	aY3 <= '0';
	aY4 <= '0';
	aX1 <= '0';
	aX2 <= '1';
	aX3 <= '0';
	aX4 <= '1';
	aA_S <= '0';
	wait for 50 ns;

	aY1 <= '1';
	aY2 <= '1';
	aY3 <= '1';
	aY4 <= '1';
	aX1 <= '1';
	aX2 <= '1';
	aX3 <= '1';
	aX4 <= '1';
	aA_S <= '0';
	wait for 50 ns;

	aY1 <= '1';
	aY2 <= '1';
	aY3 <= '0';
	aY4 <= '0';
	aX1 <= '1';
	aX2 <= '1';
	aX3 <= '1';
	aX4 <= '0';
	aA_S <= '1';
	wait for 50 ns;
	
	aY1 <= '1';
	aY2 <= '1';
	aY3 <= '0';
	aY4 <= '0';
	aX1 <= '0';
	aX2 <= '1';
	aX3 <= '0';
	aX4 <= '1';
	aA_S <= '1';
	wait for 50 ns;
	
	aY1 <= '0';
	aY2 <= '1';
	aY3 <= '0';
	aY4 <= '1';
	aX1 <= '1';
	aX2 <= '0';
	aX3 <= '1';
	aX4 <= '0';
	aA_S <= '1';
	wait for 50 ns;
end process;
end;