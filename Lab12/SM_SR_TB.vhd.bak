--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : SM_SR_TB
--Entity : SM_SR_TB
--Architecture : behv of SM_SR_TB
--Tool : VHDL '93
--Description : Tests the serial adder to ensure that the serial adder works correctly with a state machine
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SM_SR_TB is
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
end SM_SR_TB;

--behavioral model of the serial_adder_tb
architecture behv of SM_SR_TB is
  --the serial adder state machine
  component SM_SA is
  port (Sin_a, Sin_b : in std_logic_vector(3 downto 0); --4 bit input vector
        Sclk, Sclear : in std_logic; --inputs
        Sstart : in std_logic; --inputs
        Ssum : out std_logic_vector(3 downto 0); --4 bit output vector
        Scarry, ready : out std_logic); --output
  end component;
  
--creates a constant that is used for the clock
constant clk_period : time := 100 ns;
--signal declaration
signal sA, sB, ssSum : std_logic_vector(3 downto 0);
signal ssClk, ssClear, ssCarry, start , sready: std_logic := '0';
constant clkn : Time := 100 ns; 
begin
--the test bench instance for the serial adder
UUT1 : SM_SA port map (sin_a => sA, sin_b => sB, sclk => ssClk,sclear => ssClear, ssum => ssSum, scarry => ssCarry, sstart =>  start, ready => sready);

--the clock process 
clk_process: process
begin
  ssclk <= '0';
  wait for clkn/2;
  ssclk <= '1';
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
ssClear <= '0';
wait for 60 ns;
ssClear <= '1';
start <= '1';
wait for 50 ns;
sA <= var.in_a;
sB <= var.in_b;
wait until sready = '1';
--errors if the outputs are wrong
start <= '0';
assert(ssSum = var.sum)
  report "sum is wrong: iteration = " &integer'image(i)
		severity error;
assert(ssCarry = var.carry)
	 report "sum is wrong: iteration = " &integer'image(i)
		severity error;
end loop;
end process;
end;  