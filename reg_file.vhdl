-------------------------------------------------
-- Register File
-- by Alex Bushinsky and Ryan Peterson
-- Lab 4 part 1- CPEG324
-- Behavioral VHDL model for 8-bit register
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reg_file is
	port(	rs1:	in std_logic_vector(1 downto 0); --
		rs2:	in std_logic_vector(1 downto 0); --
		ws:	in std_logic_vector(1 downto 0); --
		wd:	in std_logic_vector(7 downto 0); --
		clk:	in std_logic; --
		we:	in std_logic; --writing enable
		rd1:	out std_logic_vector(7 downto 0);
		rd2:	out std_logic_vector(7 downto 0)
	);
end reg_file;

architecture behav of reg_file is
begin

end behav;
