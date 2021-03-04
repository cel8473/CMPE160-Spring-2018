--Company : RIT
--Author : Chris Larson
--Created : 11 April 2018
--Project Name : Lab 11
--File Name : DM74LS153
--Entity : DM74LS153
--Architecture : behv, df, struct (DM74LS153)
--Tool : VHDL '93
--Description : A single input/output not gate
library ieee;
use ieee.std_logic_1164.all;
--declares the entity not1
entity not1 is
port(A : in std_logic; --inputs
     Y : out std_logic); --outputs
end not1;

--declares the dataflow model of not1
architecture df of not1 is
begin
	Y <= NOT A after 4 ns; --NOTs the input and assigns it to the output
end;
