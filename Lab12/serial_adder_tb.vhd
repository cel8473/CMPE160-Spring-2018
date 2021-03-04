--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : serial_adder_tb
--Entity : serial_adder_tb
--Architecture : behv of serial_adder_tb
--Tool : VHDL '93
--Description : Tests the serial adder to ensure that the serial adder works correctly
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--creats the entity serial_adder_tb
entity serial_adder_tb is
--creates a record that is an array of the inputs and outputs
type rec is record
  in_a, in_b : std_logic_vector(3 downto 0); 
  sum : std_logic_vector(3 downto 0);
  carry : std_logic;  
end record;
--the array     
type RA is array(natural range <>) of rec;
--sets the array to some test numbers
constant anothername : RA :=(
      (X"0", X"4", X"4", '0'),
      (X"C", X"E", X"A", '1'),
      (X"8", X"A", X"2", '1'),
      (X"F", X"F", X"E", '1'),
      (X"F", X"1", X"0", '1'),
      (X"A", X"5", X"2", '0'),
      (X"8", X"7", X"F", '0'));
end serial_adder_tb;

--behavioral model of the serial_adder_tb
architecture behv of serial_adder_tb is
  --the serial adder
  component serial_adder is
    port (in_a, in_b : in std_logic_vector(3 downto 0); --4 bit input vector
          cntrl : in std_logic_vector(1 downto 0); --2 bit input vector
          clk, clear : in  std_logic; --input
          sum : out std_logic_vector(3 downto 0); --4 bit output vector
          carry : out std_logic); --output
  end component;
--creates a constant that is used for the clock
constant clk_period : time := 100 ns;
--signal declaration
signal sA, sB, sSum : std_logic_vector(3 downto 0);
signal sCon : std_logic_vector(1 downto 0);
signal sClk, sClear, sCarry : std_logic := '0';
constant clkn : Time := 100 ns; 
begin
--the test bench instance for the serial adder
UUT1 : serial_adder port map (in_a => sA, in_b => sB,cntrl => sCon,clk => sClk,clear => sClear, sum => sSum, carry => sCarry);

--the clock process 
clk_process: process
begin
  sclk <= '0';
  wait for clkn/2;
  sclk <= '1';
  wait for clkn/2;
end process;
--the process that loops though all of the test cases in the array in a predictable order that
--allows for the analysis of the results to confirm the correctness of the serial adder    
process
variable var: rec;
begin
  --for loop to loop through the cases
  for i in anothername'range loop
var := anothername(i);
sClear <= '0';
wait for 60 ns;
sClear <= '1';
wait for 50 ns;
sCon <= "11";
sA <= var.in_a;
sB <= var.in_b;
wait until rising_edge(sClk);
sCon <= "01";
wait until rising_edge(sClk);	
wait until rising_edge(sClk);
wait until rising_edge(sClk);
wait until rising_edge(sClk);
sCon <= "00";
wait until rising_edge(sClk);
--errors if the outputs are wrong
assert(sSum = var.sum)
  report "sum is wrong: iteration = " &integer'image(i)
		severity error;
assert(sCarry = var.carry)
	 report "sum is wrong: iteration = " &integer'image(i)
		severity error;
end loop;
end process;
end;  