library ieee;
use ieee.std_logic_1164.all;

entity full_adder is 
	port(A , B, Cin : in std_logic;
	     Sum, Cout : out std_logic);
	end full_adder;

architecture struct of full_adder is
	component xor3 is 
	port (A, B, C : in std_logic;
	      Y : out std_logic);
	end component;

	component and2 is 
	port(A, B : in std_logic;
	     Y : out std_logic);
	end component;
	
	component or3 is 
	port(A, B, C : in std_logic;
	     Y : out std_logic);
	end component;
	
	signal s_1, s_2, s_3 : std_logic:='0';
begin
	xor3_instance1 : xor3 port map (A => A , B => B, C => Cin, Y => Sum);

	and2_instance1 : and2 port map (A => A,  B => B, Y => s_1); 
	and2_instance2 : and2 port map (A => A,  B => Cin, Y => s_2); 
	and2_instance3 : and2 port map (A => Cin,  B => B, Y => s_3);

	or3_instance1 : or3 port map (A => s_1, B => s_2, C => s_3, Y => Cout);

end;