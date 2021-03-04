--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : D_FF
--Entity : D_FF
--Architecture : behv of D_FF 
--Tool : VHDL '93
--Description : A D flip-flop with an active low clear, active high enable, and rising edge clock
library ieee;
use ieee.std_logic_1164.all;

--declares the entity
entity D_FF is 
	port(D, clk, enable, clear : in std_logic; --inputs
	     Q , Qnot : out std_logic); --outputs
end D_FF;

--Clears when clear is 0
--Sets the output to the input after 6 ns if enable is 1 and it is the rising edge
architecture behv of D_FF is 
begin
	process(D, clk, enable, clear)
	begin
	if(clear = '0') then
	    Q <= '0';
	    Qnot <= '1';
	elsif(enable = '1') and (rising_edge(clk)) then
		Q <= D after 6 ns;
		Qnot <= NOT D after 6 ns;
	end if;
	end process;
end behv;