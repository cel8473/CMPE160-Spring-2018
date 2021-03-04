-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 64-Bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Full Version"
-- CREATED		"Wed Mar 21 18:10:04 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Ex9 IS 
	PORT
	(
		CLK :  IN  STD_LOGIC;
		RST :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC;
		Z :  OUT  STD_LOGIC
	);
END Ex9;

ARCHITECTURE bdf_type OF Ex9 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;


BEGIN 
SYNTHESIZED_WIRE_13 <= '1';



PROCESS(CLK,RST,SYNTHESIZED_WIRE_13)
BEGIN
IF (RST = '0') THEN
	SYNTHESIZED_WIRE_14 <= '0';
ELSIF (SYNTHESIZED_WIRE_13 = '0') THEN
	SYNTHESIZED_WIRE_14 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	SYNTHESIZED_WIRE_14 <= SYNTHESIZED_WIRE_0;
END IF;
END PROCESS;


PROCESS(CLK,RST,SYNTHESIZED_WIRE_13)
BEGIN
IF (RST = '0') THEN
	SYNTHESIZED_WIRE_15 <= '0';
ELSIF (SYNTHESIZED_WIRE_13 = '0') THEN
	SYNTHESIZED_WIRE_15 <= '1';
ELSIF (RISING_EDGE(CLK)) THEN
	SYNTHESIZED_WIRE_15 <= SYNTHESIZED_WIRE_2;
END IF;
END PROCESS;


SYNTHESIZED_WIRE_8 <= NOT(SYNTHESIZED_WIRE_14);



SYNTHESIZED_WIRE_6 <= NOT(SYNTHESIZED_WIRE_15);



SYNTHESIZED_WIRE_11 <= B AND A;


SYNTHESIZED_WIRE_10 <= SYNTHESIZED_WIRE_14 AND SYNTHESIZED_WIRE_4 AND SYNTHESIZED_WIRE_16;


Z <= SYNTHESIZED_WIRE_14 AND SYNTHESIZED_WIRE_6;


SYNTHESIZED_WIRE_17 <= A AND SYNTHESIZED_WIRE_16 AND SYNTHESIZED_WIRE_8 AND SYNTHESIZED_WIRE_15;


SYNTHESIZED_WIRE_4 <= NOT(A);



SYNTHESIZED_WIRE_16 <= NOT(B);



SYNTHESIZED_WIRE_0 <= SYNTHESIZED_WIRE_17 OR SYNTHESIZED_WIRE_10;


SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_11 OR SYNTHESIZED_WIRE_17;



END bdf_type;