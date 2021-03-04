library ieee;
use ieee.std_logic_1164.all;

entity or2 is
    port(A,B : in std_logic;
         Y : out std_logic);
end or2;

architecture df of or2 is
begin
  
  Y <= A or B after 4 ns;
end;