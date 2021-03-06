library ieee;
use ieee.std_logic_1164.all;

entity or4 is
port(A, B, C, D: in std_logic;
     Y : out std_logic);
end or4;

architecture df of or4 is
begin
	Y <= A OR B OR C OR D after 7 ns;
end;
