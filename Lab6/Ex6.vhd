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
-- CREATED		"Wed Feb 21 17:43:53 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Ex6 IS 
	PORT
	(
		Cin :  IN  STD_LOGIC;
		B :  IN  STD_LOGIC;
		A :  IN  STD_LOGIC;
		Cout :  OUT  STD_LOGIC;
		Sum :  OUT  STD_LOGIC
	);
END Ex6;

ARCHITECTURE bdf_type OF Ex6 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= A XOR B;


Sum <= SYNTHESIZED_WIRE_0 XOR Cin;


Cout <= SYNTHESIZED_WIRE_1 OR SYNTHESIZED_WIRE_2;


SYNTHESIZED_WIRE_4 <= A AND B;


SYNTHESIZED_WIRE_3 <= A AND Cin;


SYNTHESIZED_WIRE_1 <= B AND Cin;


SYNTHESIZED_WIRE_2 <= SYNTHESIZED_WIRE_3 OR SYNTHESIZED_WIRE_4;


END bdf_type;