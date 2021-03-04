--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : and2
--Entity : and2
--Architecture : behv of and2
--Tool : VHDL '93
--Description : A two input and gate
library ieee;
use ieee.std_logic_1164.all;
--creates the entity
entity and2 is
port(A, B : in std_logic; --inputs
     Y : out std_logic); --ouput
end and2;

--takes in two outputs, ands them together and outputs the result
architecture behv of and2 is
begin
process(A, B)
begin
	Y <= A AND B after 4 ns;
end process;
end;
