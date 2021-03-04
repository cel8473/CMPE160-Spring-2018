--Company : RIT
--Author : Chris Larson
--Created : 11 April 2018
--Project Name : Lab 11
--File Name : DM74LS153
--Entity : DM74LS153
--Architecture : behv, df, struct (DM74LS153) 
--Tool : VHDL '93
--Description : A dual 4_1mux circuit, DM74LS153 that creates the circuit 
--		and creates the architecture for the circuit in model type
--		behavioral, data flow, and structural
library ieee;
use ieee.std_logic_1164.all;

--creates the entity DM74LS153
entity DM74LS153 is
	port(
	G1, G2, A, B : in std_logic; --inputs
	C1, C2 : in std_logic_vector(3 downto 0); --inputs that are 4-bit vectors
	Y1, Y2 : out std_logic); --outputs
end DM74LS153;

--dataflow model of the circuit
architecture df of DM74LS153 is
--signal declaration
signal sControl1, sControl2 : std_logic_vector(2 downto 0);
begin
	sControl1 <= G1 & B & A; --with select statements that sets the two outputs depending on the input 3-bit number
--				   that depends on G B and A as the bits.
	with sControl1 select -- first mux
		Y1 <= C1(0) when "000",
		C1(1) when "001",
		C1(2) when "010",
		C1(3) when "011",
		'0' when others;
	sControl2 <= G2 & B & A;
	with sControl2 select -- second mux
		Y2 <= C2(0) when "000",
		C2(1) when "001",
		C2(2) when "010",
		C2(3) when "011",
		'0' when others;
end architecture df;

--behavioral model of the circuit
architecture behv of DM74LS153 is
--signal declaration
signal sControl1 , sControl2 : std_logic_vector(2 downto 0);
begin
  sControl1 <= G1 & B & A; -- sets the controls to G B and A
  sControl2 <= G2 & B & A;
process(G1, A, B, C1, C2, sControl1)
begin
--case statements that looks at the controls and assigns the outputs according to the 3-bit number 
--that the control is, after a delay of 22 ns
	case sControl1 is -- first mux
		when "000" => Y1 <= C1(0) after 22 ns;	
		when "001" => Y1 <= C1(1) after 22 ns;	
		when "010" => Y1 <= C1(2) after 22 ns;	
		when "011" => Y1 <= C1(3) after 22 ns;	
		when others => Y1 <= '0' after 22 ns;
	end case;
end process;
process(G2, A, B, C1, C2, sControl2)
begin
	case sControl2 is -- second mux
		when "000" => Y2 <= C2(0) after 22 ns;	
		when "001" => Y2 <= C2(1) after 22 ns;	
		when "010" => Y2 <= C2(2) after 22 ns;	
		when "011" => Y2 <= C2(3) after 22 ns;	
		when others => Y2 <= '0' after 22 ns;
	end case;
end process;
end;

--structural model of the circuit
architecture struct of DM74LS153 is
--declares the components of the DM74LS153
component mux is 
	port (G, A, B : in std_logic; --inputs
        C : in std_logic_vector(3 downto 0); -- 4-bit vector inputs
	      Y : out std_logic); -- output
end component;

begin
--createst the two instances of muxs used in the circuit
	mux_instance1 : mux port map (G => G1, A => A, B => B, C => C1, Y => Y1);
	mux_instance2 : mux port map (G => G2, A => A, B => B, C => C2, Y => Y2);
end;