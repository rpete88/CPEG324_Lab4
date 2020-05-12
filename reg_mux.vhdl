-----------------------------------
-- 4x2 MUX - 8-bit
-- by Alex Bushinsky and Ryan Peterson
-- Lab 3 part 1- CPEG324
-- MUX used at register file output
-----------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reg_MUX is
	port(	sel0, sel1:	in std_logic_vector(1 downto 0);
		In0, In1, In2, In3:	in std_logic_vector(7 downto 0);
		Z0, Z1:			out std_logic_vector(7 downto 0)
	);
end reg_MUX;

architecture behav of reg_MUX is
begin
	Z0 <=	In0 when sel0= "00" else
	  	In1 when sel0= "01" else
		In2 when sel0= "10" else
		In3 when sel0= "11" else
		"ZZZZZZZZ";
	Z1 <=	In0 when sel1= "00" else
	  	In1 when sel1= "01" else
		In2 when sel1= "10" else
		In3 when sel1= "11" else
		"ZZZZZZZZ";
end behav;
