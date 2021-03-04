--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : full_adder
--Entity : full_adder
--Architecture : behv of full_adder
--Tool : VHDL '93
--Description : A 2-bit full adder 
library ieee;
use ieee.std_logic_1164.all;

--declares the entity
entity full_adder is 
	port(A , B, Cin : in std_logic; --inputs
	     Sum, Cout : out std_logic); --outputs
	end full_adder;

--XORS the 3 inputs for the Sum
--ANDs each of the inputs together and ORs the ANDs together for the Cout
architecture behv of full_adder is
begin	
 Sum <= A XOR B XOR CIN after 8 ns;
 Cout <= (A AND B) OR (B AND CIN) OR (A AND CIN) after 8 ns;
end;