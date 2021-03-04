--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : not1 
--Entity : not1
--Architecture : behv of not1
--Tool : VHDL '93
--Description : Nots the input
library ieee;
use ieee.std_logic_1164.all;

--Declares the entity
entity not1 is
port(A : in std_logic;
     Y : out std_logic);
end not1;

--Nots the input after 2ns, thats a looooooooooooooooooooong time
architecture behv of not1 is
begin 
process(A)
begin
	Y <= NOT A after 2 ns;
end process;
end;