--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : SM_SA
--Entity : SM_SA
--Architecture : struct of SM_SA
--Tool : VHDL '93
--Description : Ties the S_M and S_A together
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity SM_SA is
  port (Sin_a, Sin_b : in std_logic_vector(3 downto 0); --4 bit input vector
        Sclk, Sclear : in std_logic; --inputs
        Sstart : in std_logic; --inputs
        Ssum : out std_logic_vector(3 downto 0); --4 bit output vector
        Scarry, ready : out std_logic); --output
  end SM_SA;
         
architecture struct of SM_SA is
  component serial_adder is
  port(in_a, in_b : in std_logic_vector(3 downto 0); --4 bit input vector
       cntrl : in std_logic_vector(1 downto 0); --2 bit input vector
       clk, clear : in std_logic; --inputs
       sum : out std_logic_vector(3 downto 0); --4 bit output vector
       carry : out std_logic); --output
  end component;
  
  component S_M is
  port(start, clk, clear : in std_logic; --inputs
       control_output : out std_logic_vector(3 downto 0)); --outputs that are 4-bit vectors
  end component;
  
  signal scontrol_output : std_logic_vector(3 downto 0);
  begin
  ready <= scontrol_output(3);
  serial_adder_instance1 : serial_adder port map (in_a => Sin_a, in_b => Sin_b, cntrl => Scontrol_output(1 downto 0), clk => Sclk, sum => Ssum, carry => Scarry, clear => sclear);
  S_M_instance1 : S_M port map (start => Sstart, clk => sclk, clear => sclear, control_output => scontrol_output);
end;