------------------------------------
-- Instrcution Reader
-- by Alex Bushinsky and Ryan Peterson
-- Lab4 part 2- CPEG324
-- Logic component that translates instructions from our 
-- ISA into the correct OP values for ALU
--------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity instructionReader is
	port(	I:	in std_logic_vector(7 downto 0); --instruction sent
		op:	out std_logic_vector(1 downto 0) --opcode sent to ALU 00:add; 01:sub; 10:nothing; 11:set on equal
	);
end instructionReader;

architecture behav of instructionReader is
begin
	process(I)
	begin
		case (I (7 downto 6)) is
			when "00" => --opcode for add
				op <= "00";
			when "01" => --opcode for sub
				op <= "01";
			when "11" => --opcode for beq and dis
				if( I(0) = '1') then --funct set to 1 for beq
					op <= "11";
				else --funct set to 0 for dis
					op <= "10";
				end if;
			when others =>
				op <= "10";
		end case;
	end process;
end behav;
