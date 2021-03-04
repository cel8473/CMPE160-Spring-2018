--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : S_M.vhd
--Entity : DM74LS153
--Architecture : behv of S_M 
--Tool : VHDL '93
--Description : A state machine that changes between 7 different states when triggered.
library ieee;
use ieee.std_logic_1164.all;
--creates the entity S_M
entity S_M is
port(start, clk, clear : in std_logic; --inputs
     control_output : out std_logic_vector(3 downto 0)); --outputs that are 4-bit vectors
end S_M;

--behavorial model of the circuit
architecture behv of S_M is 
--creating the state type
type tstates is(IDLE, RST, LOAD, S1, S2, S3, S4, HOLD);
--signal declaration
signal sstate : tstates := idle;
begin
process(clk, clear, start)
--The if cases that determine the state that the machine is in and going to
begin
	if(clear = '0') then
		sstate <= idle;
	elsif(sstate = idle) then
		if(start = '1') then
			sstate <= rst;
		elsif(start = '0') then 
			sstate <= idle;
		end if;
	elsif(rising_edge(clk))then 
		if(sstate = rst) then
			sstate <= load;
		elsif(sstate = load) then
			sstate <= s1; 
		elsif(sstate = s1) then
			sstate <= s2;
		elsif(sstate = s2) then
			sstate <= s3;
		elsif(sstate = s3) then
			sstate <= s4;
		elsif(sstate = s4) then
			sstate <= hold; 
		elsif(sstate = hold) then
		  sstate <= idle;
		end if;
	end if;
end process;

process(sstate)
--determines the output depending on what state the machine is in
begin
	if(sstate = idle) then 
		control_output <= "1100";
	elsif(sstate = rst) then 
		control_output <= "0000";
	elsif(sstate = load) then 
		control_output <= "0111";
	elsif(sstate = s1) then 
		control_output <= "0101";
	elsif(sstate = s2) then 
		control_output <= "0101";
	elsif(sstate = s3) then 
		control_output <= "0101";
	elsif(sstate = s4) then 
		control_output <= "0101";
	elsif(sstate = hold) then 
		control_output <= "0100";
	end if;
end process;
end;