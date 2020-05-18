----------------------------------------
-- CRA- carry ripple adder
-- by Alex Bushinsky and Ryan Peterson
-- Lab4 part2- CPEG324
-- Used in ALU
----------------------------------------

library IEEE;
use ieee.std_logic_1164.all;

entity CRA is
	port(	A:	in std_logic_vector (7 downto 0); --first input
		B:	in std_logic_vector (7 downto 0); --second input
		Cin:	in std_logic; --Carry in
		S:	out std_logic_vector (7 downto 0); --SUM
		Cout:	out std_logic
	);
end CRA;

architecture behav of CRA is
	component full_adder is
		port(	a:	in std_logic;
			b:	in std_logic;
			cin:	in std_logic;
			s:	out std_logic;
			cout:	out std_logic
		);
	end component;
	--Carry signals
	signal c1,c2,c3,c4,c5,c6,c7: 	std_logic;
	begin	
	-- FULL ADDERS
	FA1: full_adder port map( A(0), B(0), Cin, S(0), c1);
	FA2: full_adder port map( A(1), B(1), c1, S(1), c2);
	FA3: full_adder port map( A(2), B(2), c2, S(2), c3);
	FA4: full_adder port map( A(3), B(3), c3, S(3), c4);
	FA5: full_adder port map( A(4), B(4), c4, S(4), c5);
	FA6: full_adder port map( A(5), B(5), c5, S(5), c6);
	FA7: full_adder port map( A(6), B(6), c6, S(6), c7);
	FA8: full_adder port map( A(7), B(7), c7, S(7), Cout);
end behav;
