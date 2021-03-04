--Company : RIT
--Author : Chris Larson
--Created : 24 April 2018
--Project Name : Lab 12
--File Name : serial_adder
--Entity : serial_adder
--Architecture : struct of serial_adder
--Tool : VHDL '93
--Description : A 2 vector input serial adder that uses 2 Shift Registers,
--a NOT gate, an AND gate, a D flip-flop and a full adder
library ieee;
use ieee.std_logic_1164.all;

--creates the entity serial adder
entity serial_adder is
  port(in_a, in_b : in std_logic_vector(3 downto 0); --4 bit input vector
       cntrl : in std_logic_vector(1 downto 0); --2 bit input vector
       clk, clear : in std_logic; --inputs
       sum : out std_logic_vector(3 downto 0); --4 bit output vector
       carry : out std_logic); --output
end serial_adder;

--creates the struct model of the serial adder
architecture struct of serial_adder is
  --The 4-bit shift register
  component DM74LS194A is 
	port(a,b,c,d, clk, clear, s0, s1, sL, sR : in std_logic;
	     qa, qb, qc, qd : out std_logic);
      end component;
--The not gate
component not1 is
  port(A : in std_logic;
       Y : out std_logic);
      end component;
--The 2 input AND gate
component and2 is
  port(A , B : in std_logic;
       Y : out std_logic);
     end component;
 --The D flip-flop      
component D_FF is
  port(D, clk, enable, clear : in std_logic;
	     Q , Qnot : out std_logic);
      end component;
 --The full adder     
component full_adder is 
	port(A , B, Cin : in std_logic;
	     Sum, Cout : out std_logic);
	end component;
	--signal declaration
	signal s1, qA1, qA2, qA3, qA4, qB1, qB2, qB3, qB4, s2, s3, Y1, sCarry, QD, QDNot, sumFA , clear_dp: std_logic := '0';
	
begin
  --Creating two shift registers instances
  DM74LS194A_instance1 : DM74LS194A port map (A => in_a(3),B => in_a(2), C => in_a(1),D => in_a(0),clk => clk,clear => clear, s0 => cntrl(0),s1 => cntrl(1),sL => '0',sR => sumFA,
  qa => qA1, qb => qA2, qc => qA3,qd => qA4);
  
  DM74LS194A_instance2 : DM74LS194A port map (A => in_b(3),B => in_b(2), C => in_b(1),D => in_b(0),clk => clk,clear => clear, s0 => cntrl(0),s1 => cntrl(1),sL => '0',sR => '0',
  qa => qB1, qb => qB2, qc => qB3,qd => qB4);
  --Creating a NOT gate and AND gate instance
  not1_instance1 : not1 port map (A => cntrl(1), Y => s3);  
  and2_instance2 : and2 port map (A => cntrl(0),B => s3, Y => Y1);
  --Setting the sum to 4-bit output of the first shift register
  Sum <= qA1 & qA2 & qA3 & qA4;  
  --Creating the D flip-flop and full adder instances
  D_FF_instance1 : D_FF port map (D => sCarry,clk => clk,clear => clear,enable => Y1,Q => QD, Qnot => QDNot);
  full_adder_instance1 : full_adder port map (A => qA4,B => qB4,Cin => QD,Sum => sumFA,cout => sCarry);
  --Setting the carryout to the output of the D flip-flop  
  carry <= QD; 
end;