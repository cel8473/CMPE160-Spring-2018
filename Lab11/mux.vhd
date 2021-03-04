--Company : RIT
--Author : Chris Larson
--Created : 11 April 2018
--Project Name : Lab 11
--File Name : DM74LS153
--Entity : DM74LS153
--Architecture : behv, df, struct (DM74LS153) 
--Tool : VHDL '93
--Description : A 4_1 mux that uses not, 4 input AND gates and 4 input OR gates.
library ieee;
use ieee.std_logic_1164.all;

--creates the entity mux
entity mux is
port(G, A, B: in std_logic;
     C : in std_logic_vector(3 downto 0);
     Y : out std_logic);
end mux;

--structural model of mux
architecture struct of mux is
--declares the components used in the mux
component and4 is
	port( A, B, C, D : in std_logic; --inputs
	      Y : out std_logic); --outputs
end component;

component or4 is
	port( A, B, C, D : in std_logic; --inputs
	      Y : out std_logic); --outputs
end component;

component not1 is
	port( A : in std_logic; --inputs
	      Y : out std_logic); --outputs
end component;
--declares the signals that are used in the mux
signal s_1, s_2, s_3, s_4, s_5 , s_6, s_7 :  std_logic := '0';

begin	
	not1_instance1 : not1 port map (A => A, Y => s_1); --creates an instance using the not1 gate
	not1_instance2 : not1 port map (A => B, Y => s_2);
	not1_instance3 : not1 port map (A => G, Y => s_3);

	and4_instance1 : and4 port map (A => s_1, B => s_2, C => s_3, D => C(0), Y => s_4); --creates an instance using the and4 gate
	and4_instance2 : and4 port map (A => A, B => s_2, C => s_3, D => C(1), Y => s_5);
	and4_instance3 : and4 port map (A => s_1, B => B, C => s_3, D => C(2), Y => s_6);
	and4_instance4 : and4 port map (A => A, B => B, C => s_3, D => C(3), Y => s_7);

	or4_instance1 : or4 port map (A => s_4, B => s_5, C => s_6, D => s_7, Y => Y); --creates an instance using the or4 gate
end ;
