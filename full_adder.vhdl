---------------------------------------------
-- Full Adder
-- by Alex Bushinsky and Ryan Peterson
-- Lab 4 part 2- CPEG 324
-- Full adder code used in Carry Ripple Adder
----------------------------------------------

library IEEE;
use ieee.std_logic_1164.all;

entity full_adder is
	port(	A:	in std_logic;
		B:	in std_logic;
		Cin:	in std_logic;
		S:	out std_logic;
		Cout:	out std_logic
	);
end full_adder;

architecture behav of full_adder is
begin
	S <= A XOR B XOR Cin;
	Cout <= (A AND B) OR (Cin AND A) OR (Cin AND B);
end behav;
