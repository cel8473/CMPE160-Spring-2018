-- Copyright (C) 2017  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details.

-- PROGRAM		"Quartus Prime"
-- VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
-- CREATED		"Tue Feb 20 18:36:27 2018"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Lab6 IS 
	PORT
	(
		X :  IN  STD_LOGIC;
		Y :  IN  STD_LOGIC;
		Cin :  IN  STD_LOGIC;
		Cout :  OUT  STD_LOGIC;
		Sum :  OUT  STD_LOGIC
	);
END Lab6;

ARCHITECTURE bdf_type OF Lab6 IS 

SIGNAL	SYNTHESIZED_WIRE_0 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;


BEGIN 



SYNTHESIZED_WIRE_0 <= X XOR Y;


Sum <= SYNTHESIZED_WIRE_0 XOR Cin;


SYNTHESIZED_WIRE_3 <= SYNTHESIZED_WIRE_1 AND SYNTHESIZED_WIRE_2;


Cout <= SYNTHESIZED_WIRE_3 AND SYNTHESIZED_WIRE_4;


SYNTHESIZED_WIRE_1 <= Y OR X;


SYNTHESIZED_WIRE_2 <= Cin OR X;


SYNTHESIZED_WIRE_4 <= Cin OR Y;


END bdf_type;