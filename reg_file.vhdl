-------------------------------------------------
-- Register File
-- by Alex Bushinsky and Ryan Peterson
-- Lab 4 part 1- CPEG324
-- Behavioral VHDL model for 8-bit register
------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity reg_file is
	port(	rs1:	in std_logic_vector(1 downto 0); --select for register file output 1
		rs2:	in std_logic_vector(1 downto 0); --select for register file output 2
	    	ws:	in std_logic_vector(1 downto 0); --writing select
		wd:	in std_logic_vector(7 downto 0); --writing data
		CLK:	in std_logic; --clock
		we:	in std_logic; --writing enable
		rst:	in std_logic; --reset
		rd1:	out std_logic_vector(7 downto 0); --output 1 of register file
		rd2:	out std_logic_vector(7 downto 0) -- output 2 of register file
	);
end reg_file;

architecture arch of reg_file is
	-- we must have 4 reg (flip flops)
	component reg is
		port(
			d:	in std_logic_vector(7 downto 0);
			clk:	in std_logic;
            		en:	in std_logic;
			q:	out std_logic_vector(7 downto 0)
		);
	end component;
	-- we send the outputs of the flip-flops through a 4 to 2 MUX
	component reg_MUX is
		port(
			sel0, sel1:		in std_logic_vector(1 downto 0);
			In0,In1,In2,In3:	in std_logic_vector(7 downto 0);
			Z0, Z1:			out std_logic_vector(7 downto 0)
		);
	end component;

	signal input_00:	std_logic_vector(7 downto 0):= "00000000";
	signal input_01:	std_logic_vector(7 downto 0):= "00000000";
	signal input_10:	std_logic_vector(7 downto 0):= "00000000";
	signal input_11:	std_logic_vector(7 downto 0):= "00000000";
	signal en_00: 		std_logic:= '0';
	signal en_01: 		std_logic:= '0';
	signal en_10: 		std_logic:= '0';
	signal en_11: 		std_logic:= '0';
	signal output_00:	std_logic_vector(7 downto 0):= "00000000";
	signal output_01:	std_logic_vector(7 downto 0):= "00000000";
	signal output_10:	std_logic_vector(7 downto 0):= "00000000";
    	signal output_11:	std_logic_vector(7 downto 0):= "00000000";

begin
	process(CLK)
	begin
		if( CLK'event and CLK = '1') then
			if( rst = '1' ) then
				input_00 <= "00000000";
				input_01 <= "00000000";
				input_10 <= "00000000";
				input_11 <= "00000000";
				en_00 <= '1';
				en_01 <= '1';
				en_10 <= '1';
	       	         	en_11 <= '1';

			else
				case ws is
					when "00"=>
						input_00 <= wd;
						input_01 <= output_01;
						input_10 <= output_10;
						input_11 <= output_11;
						en_00 <= we;
						en_01 <= '0';
						en_10 <= '0';
	       	         			en_11 <= '0';
					when "01"=>
						input_00 <= output_00;
						input_01 <= wd;
						input_10 <= output_10;
						input_11 <= output_11;
						en_00 <= '0';
						en_01 <= we;
						en_10 <= '0';
                				en_11 <= '0';
					when "10"=>
						input_00 <= output_00;
						input_01 <= output_01;
						input_10 <= wd;
						input_11 <= output_11;
						en_00 <= '0';
						en_01 <= '0';
						en_10 <= we;
               			 		en_11 <= '0';
					when "11"=>
						input_00 <= output_00;
						input_01 <= output_01;
						input_10 <= output_10;
						input_11 <= wd;
						en_00 <= '0';
						en_01 <= '0';
						en_10 <= '0';
            					en_11 <= we;
					when others=>
						--nothing
						input_00 <= output_00;
						input_01 <= output_01;
						input_10 <= output_10;
						input_11 <= output_11;
						en_00 <= '0';
						en_01 <= '0';
						en_10 <= '0';
               					en_11 <= '0';
				end case;
			end if;
		else
			input_00 <= output_00;
			input_01 <= output_01;
			input_10 <= output_10;
			input_11 <= output_11;
			en_00 <= '0';
			en_01 <= '0';
			en_10 <= '0';
			en_11 <= '0';
		end if;
	end process;
	reg_00:	reg port map(input_00, CLK, en_00, output_00);
	reg_01:	reg port map(input_01, CLK, en_01, output_01);
	reg_10:	reg port map(input_10, CLK, en_10, output_10);
	reg_11:	reg port map(input_11, CLK, en_11, output_11);

	MUX: reg_MUX port map(rs1, rs2, output_00, output_01, output_10, output_11, rd1, rd2);

end arch;
