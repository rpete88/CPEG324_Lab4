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
	component CRA is -- carry ripple adder
		port ( 	a:	in std_logic_vector (31 downto 0);
			b:	in std_logic_vector (31 downto 0);
			ci:	in std_logic;
			s:	out std_logic_vector (31 downto 0);
			co:	out std_logic
		     );
	end component;

	signal notB:	std_logic_vector(31 downto 0);
	signal sum:	std_logic_vector(31 downto 0);
	signal diff:	std_logic_vector(31 downto 0);
	signal s_carry:	std_logic;
	signal d_carry:	std_logic;
begin
	notB <= not B;

	adder: CRA port map(A, B, '0', sum, s_carry);
	subtractor: CRA port map(A, notB, '1', diff, d_carry);

	O <=	sum	when OP = "00" else
	     	diff	when OP = "01" else
		"ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";
	EQ <=	'1' when A=B else
	      	'0';
end behav;
