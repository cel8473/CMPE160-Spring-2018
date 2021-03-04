--Company : RIT
--Author : Chris Larson
--Created : 11 April 2018
--Project Name : Lab 11
--File Name : and4
--Entity : and4
--Architecture : df(and4)
--Tool : VHDL '93
--Description : A four input, one output and gate enity and df architecture
library ieee;
use ieee.std_logic_1164.all;

entity and4 is
port(A, B, C, D: in std_logic; --inputs
     Y : out std_logic); --oututs
end and4;

architecture df of and4 is
begin
	Y <= A AND B AND C AND D after 7 ns; --assigns the output to the inputs anded together after a delay
end;