library ieee;
use ieee.std_logic_1164.all;

entity four_bit is
	port(Y1, Y2, Y3, Y4, A_S : in std_logic;
	     X1, X2, X3, X4 : in std_logic;
	     S1, S2, S3, S4, Cout : out std_logic);
end four_bit;

architecture struct of four_bit is
	component xor2 is
		port (A, B : in std_logic;
		      Y : out std_logic);
	end component;

	component full_adder is 
		port(A, B, Cin : in std_logic;
		     Sum, Cout : out std_logic);
	end component;

	signal s_1, s_2, s_3, s_4, s_5, s_6, s_7 : std_logic := '0';

begin
	xor2_instance1 : xor2 port map (A => A_S, B => Y1, Y => s_1); 
	xor2_instance2 : xor2 port map (A => A_S, B => Y2, Y => s_2);
	xor2_instance3 : xor2 port map (A => A_S, B => Y3, Y => s_3);
	xor2_instance4 : xor2 port map (A => A_S, B => Y4, Y => s_4);
	
	full_adder_instance1 : full_adder port map (A => s_1, B => X1, Cin => A_S, Cout => s_5, Sum => S1);
	full_adder_instance2 : full_adder port map (A => s_2, B => X2, Cin => s_5, Cout => s_6, Sum => S2);
	full_adder_instance3 : full_adder port map (A => s_3, B => X3, Cin => s_6, Cout => s_7, Sum => S3);
	full_adder_instance4 : full_adder port map (A => s_4, B => X4, Cin => s_7, Cout => Cout, Sum => S4);
end;