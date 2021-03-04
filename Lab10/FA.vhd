library ieee;
use ieee.std_logic_1164.all;

entity full_adder is
	port(
	A	: in std_logic;
	B	: in std_logic;
	Cin	: in std_logic;


	Sum	: out std_logic;
	Cout	: out std_logic);
	end full_adder;

architecture df of full_adder is 

	signal s_1, s_2, s_3 : std_logic:='0';
begin
  Sum <= A XOR B XOR Cin;
  
  s_1 <= A AND B;
  s_2 <= B AND Cin;
  s_3 <= A AND Cin;
    
  Cout <= s_1 OR s_2 OR s_3;
end;

architecture struct of full_adder is
  
  component xor3 is
      port(A, B, C : in std_logic;
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
  
  xor3_instance1 : xor3 port map (A => A, B => B, C => Cin, Y => Sum);
    
  add2_instance1 : and2 port map(A => A, B => B, Y => s_1);
  add2_instance2 : and2 port map(A => B, B => Cin, Y => s_2);
  add2_instance3 : and2 port map(A => A, B => Cin, Y => s_3);
    
  or3_instance1 : or3 port map(A => s_1, B => s_2, C => s_3, Y => Cout);
end;

architecture blerbler of full_adder is
  
  component hadder is
      port(A, B : in std_logic;
           S , C : out std_logic);
    end component;
    
  component or2 is 
    port(A, B : in std_logic;
           Y : out std_logic);
    end component;
    
    signal s_1, s_2, s_3 : std_logic:='0';
    
begin
  
  hadder_instance1 : hadder port map (A => A, B => B, S => s_1, C => s_2);
  hadder_instance2 : hadder port map (A => s_1, B => Cin, S => Sum, C => s_3);
  or2instance1 : or2 port map (A => s_2, B => s_3, Y => Cout);
end;