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
-- CREATED		"Wed Feb 28 17:54:17 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Ex7 IS 
	PORT
	(
		D :  IN  STD_LOGIC;
		CLK :  IN  STD_LOGIC;
		Qn :  OUT  STD_LOGIC;
		Q :  OUT  STD_LOGIC
	);
END Ex7;

ARCHITECTURE bdf_type OF Ex7 IS 

SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_18 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_19 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;


BEGIN 
Qn <= SYNTHESIZED_WIRE_15;
Q <= SYNTHESIZED_WIRE_2;



SYNTHESIZED_WIRE_9 <= NOT(D);



SYNTHESIZED_WIRE_19 <= NOT(SYNTHESIZED_WIRE_17);



SYNTHESIZED_WIRE_15 <= NOT(SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2);


SYNTHESIZED_WIRE_17 <= NOT(CLK);



SYNTHESIZED_WIRE_14 <= NOT(SYNTHESIZED_WIRE_18);



SYNTHESIZED_WIRE_6 <= NOT(SYNTHESIZED_WIRE_17 AND D);


SYNTHESIZED_WIRE_18 <= NOT(SYNTHESIZED_WIRE_5 AND SYNTHESIZED_WIRE_6);


SYNTHESIZED_WIRE_5 <= NOT(SYNTHESIZED_WIRE_7 AND SYNTHESIZED_WIRE_18);


SYNTHESIZED_WIRE_7 <= NOT(SYNTHESIZED_WIRE_9 AND SYNTHESIZED_WIRE_17);


SYNTHESIZED_WIRE_16 <= NOT(SYNTHESIZED_WIRE_19 AND SYNTHESIZED_WIRE_18);


SYNTHESIZED_WIRE_1 <= NOT(SYNTHESIZED_WIRE_19 AND SYNTHESIZED_WIRE_14);


SYNTHESIZED_WIRE_2 <= NOT(SYNTHESIZED_WIRE_15 AND SYNTHESIZED_WIRE_16);


END bdf_type;