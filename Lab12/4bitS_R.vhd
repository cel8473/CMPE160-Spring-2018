--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : 4bitS_R
--Entity : DM?74LS194A
--Architecture : behv of DM74LS194A
--Tool : VHDL '93
--Description : A 4-bit shift register with an active-low clear 
library ieee;
use ieee.std_logic_1164.all;

--creates the entity DM74LS194A(shift register)
entity DM74LS194A is 
	port(a,b,c,d, clk, clear, s0, s1, sL, sR : in std_logic; --inputs
	     qa, qb, qc, qd : out std_logic); -- outputs
end DM74LS194A;

--behavioral model of the shift register
architecture behv of DM74LS194A is
--signal declaration
signal sreg : std_logic_vector(3 downto 0);
begin
(qa, qb, qc, qd) <= sreg after 22 ns;
--Makes a variable that looks at whether the register is loading, shifting or holding
--Sets the output to what the variable is telling it to do
process(clear, clk)
variable vmode : std_logic_vector(1 downto 0);
begin
	vmode:= s1 & s0;
	if clear = '0' then
		sreg <= (others=>'0');
	elsif(rising_edge(clk)) then
		case vmode is
			when "00" => sreg <= sreg;
			when "01" => sreg <= sR & sreg(3 downto 1);
			when "10" => sreg <= sreg(2 downto 0) & sL;
			when others => sreg <= a & b & c & d;
		end case;
	end if;
end process;
end architecture;