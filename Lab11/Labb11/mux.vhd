library ieee;
use ieee.std_logic_1164.all;

entity mux is
port(G, A, B: in std_logic;
     C : in std_logic_vector(3 downto 0);
     Y : out std_logic);
end mux;

architecture struct of mux is
component and4 is
	port( A, B, C, D : in std_logic;
	      Y : out std_logic);
end component;

component or4 is
	port( A, B, C, D : in std_logic;
	      Y : out std_logic);
end component;

component not1 is
	port( A : in std_logic;
	      Y : out std_logic);
end component;

signal s_1, s_2, s_3, s_4, s_5 , s_6, s_7 :  std_logic := '0';

begin	
	not1_instance1 : not1 port map (A => A, Y => s_1);
	not1_instance2 : not1 port map (A => B, Y => s_2);
	not1_instance3 : not1 port map (A => G, Y => s_3);

	and4_instance1 : and4 port map (A => s_1, B => s_2, C => s_3, D => C(0), Y => s_4); 
	and4_instance2 : and4 port map (A => A, B => s_2, C => s_3, D => C(1), Y => s_5);
	and4_instance3 : and4 port map (A => s_1, B => B, C => s_3, D => C(2), Y => s_6);
	and4_instance4 : and4 port map (A => A, B => B, C => s_3, D => C(3), Y => s_7);

	or4_instance1 : and4 port map (A => s_4, B => s_5, C => s_6, D => s_7, Y => Y);
end ;
