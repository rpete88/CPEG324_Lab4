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
		OP:	in std_logic_vector(1 downto 0); --operation- 00:add; 01:sub; 10:nothing; 11:set on equal
		O:	out std_logic_vector(31 downto 0); --output
		EQ:	out std_logic --set on equal output
	);
end ALU;

architecture behav of ALU is
begin
	process(A, B, OP)
	begin
		case OP is
			when "00" =>
				O <= A + B;
			when "01" =>
				O <= A - B;
			when "10" =>
				-- do nothing
			when "11" =>
				if (A = B) then
					EQ = '1';
				else
					EQ = '0';
				end if;
			when others =>
				-- do nothing
		end case;
	end process;
end behav;
