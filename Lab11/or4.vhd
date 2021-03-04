--Company : RIT
--Author : Chris Larson
--Created : 11 April 2018
--Project Name : Lab 11
--File Name : DM74LS153
--Entity : DM74LS153
--Architecture : behv, df, struct (DM74LS153) 
--Tool : VHDL '93
--Description : A 4 input, 1 output OR gate
library ieee;
use ieee.std_logic_1164.all;
--declares the entity or4
entity or4 is
port(A, B, C, D: in std_logic; --inputs
     Y : out std_logic); --outputs
end or4;

--declares the dataflow model of or4
architecture df of or4 is
begin
	Y <= A OR B OR C OR D after 7 ns; --ORs the inputs together and assigns that to the output after 7 ns
end;
