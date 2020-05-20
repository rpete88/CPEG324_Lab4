------------------------------------------------
-- 8-bit Register
-- by Alex Bushinsky and Ryan Peterson
-- Lab 4 part 1- CPEG324
-- Behavioral Model for an 8-bit Shift Register
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reg is
port(		D:	in std_logic_vector(7 downto 0); --input of flip-flop
		CLK:	in std_logic; --rising edge triggered
        EN:	in std_logic;
        RESET: in std_logic;
		Q:	out std_logic_vector(7 downto 0) --output of flop-flop
);
end reg;

architecture behav of reg is
begin
	process(CLK)
    begin
        if (RESET = '1') then
            Q <= "00000000";
        else
		    if( CLK'event and CLK = '1' ) then
			    if( EN = '1' ) then
				    Q <= D;
                end if;
            end if;
		end if;
	end process;
end behav;
