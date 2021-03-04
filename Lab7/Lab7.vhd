-- Copyright (C) 1991-2012 Altera Corporation
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
-- VERSION		"Version 12.1 Build 177 11/07/2012 SJ Web Edition"
-- CREATED		"Mon Feb 26 16:30:27 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Lab7 IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		EN :  IN  STD_LOGIC;
		Q :  OUT  STD_LOGIC;
		Qn :  OUT  STD_LOGIC
	);
END Lab7;

ARCHITECTURE bdf_type OF Lab7 IS 

SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;


BEGIN 
Q <= SYNTHESIZED_WIRE_6;
Qn <= SYNTHESIZED_WIRE_3;



SYNTHESIZED_WIRE_1 <= NOT(D);



SYNTHESIZED_WIRE_4 <= NOT(SYNTHESIZED_WIRE_7 AND SYNTHESIZED_WIRE_1);


SYNTHESIZED_WIRE_5 <= NOT(SYNTHESIZED_WIRE_7 AND D);


SYNTHESIZED_WIRE_6 <= NOT(SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4);


SYNTHESIZED_WIRE_3 <= NOT(SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_6);


SYNTHESIZED_WIRE_7 <= NOT(EN);



END bdf_type;