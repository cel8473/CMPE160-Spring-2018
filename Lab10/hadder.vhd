library ieee;
use ieee.std_logic_1164.all;

entity hadder is
	port(
	A	: in std_logic;
	B	: in std_logic;
	
	S : out std_logic;
	C : out std_logic);
	end hadder;
	
architecture df of hadder is 

  signal s_1, s_2 : std_logic:='0';
begin 
  S <= A XOR B;
  
  s_1 <= A AND B;
  
  C <= s_1;
end;