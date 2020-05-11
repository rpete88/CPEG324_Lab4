---------------------------------------------------
-- ALU
-- by Alex Bushinsky and Ryan Peterson
-- Lab 4 part 2- CPEG324
-- Behavioral Model for the ALU
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ALU is
	port(	A:	in std_logic_vector(31 downto 0); --first input
		B:	in std_logic_vector(31 downto 0); --second input
		op:	in std_logic_vector(1 downto 0); --operation
		o:	out std_logic_vector(31 downto 0); --output
		eq:	out std_logic
	);
end ALU;

architecture behav of ALU is
begin

end behav;
