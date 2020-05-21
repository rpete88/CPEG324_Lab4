---------------------------------------------------
-- ALU Test Bench
-- by Alex Bushinsky and Ryan Peterson
-- Lab 4 part 2- CPEG324
-- Test bench for the ALU component
--------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity ALU_tb is
end ALU_tb;

architecture behav of ALU_tb is
component ALU
port (		A:	in std_logic_vector(7 downto 0); --first input
            B:	in std_logic_vector(7 downto 0); --second input
            OP:	in std_logic_vector(1 downto 0); --operation- 00:add; 01:sub; 10:nothing; 11:set on equal
            O:	out std_logic_vector(7 downto 0); --output
            EQ:	out std_logic --set on equal output
);
end component;
signal a, b, o : std_logic_vector(7 downto 0);
signal eq: std_logic;
signal op : std_logic_vector(1 downto 0);
begin
--  Component instantiation.
ALU_0: ALU port map (A => a, B => b, OP => op, O => o, EQ => eq);

process
type pattern_type is record
--  The inputs of the ALU.
a, b: std_logic_vector (7 downto 0);
op: std_logic_vector(1 downto 0);
--  The expected outputs of the reg_file.
o: std_logic_vector (7 downto 0);
eq: std_logic;
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array :=
--00 add, 01 sub, 10 nothing, 11 set on equal
------A-----------B--------OP--------O-------EQ---
(-------------------Test ADD----------------------
("00000000", "00000000", "00", "00000000", '1'),
("00000000", "00000001", "00", "00000001", '0'),
("00000001", "00000001", "00", "00000010", '1'),
("00000001", "00000011", "00", "00000100", '0'),
("10100001", "01000011", "00", "11100100", '0'),
-------------------Test SUB-----------------------
("00001000", "00001000", "01", "00000000", '1'),
("00010000", "00001000", "01", "00001000", '0'),
("01010000", "00001000", "01", "01001000", '0'),
("01010000", "11111000", "01", "01011000", '0'),
-------------------Test Nothing-------------------
("01010000", "11111000", "10", "ZZZZZZZZ", '0'),
-------------------Test Set on Equal--------------
("01010000", "11111000", "11", "ZZZZZZZZ", '0'),
("00010010", "00010010", "11", "ZZZZZZZZ", '1')
);
begin
for n in patterns'range loop
--  Set the inputs.
a <= patterns(n).a;
b <= patterns(n).b;
op <= patterns(n).op;
wait for 1 ns;
assert o = patterns(n).o
report "bad output value" severity error;
assert eq = patterns(n).eq
report "bad output value" severity error;
end loop;
assert false report "end of test" severity note;
wait;
end process;
end behav;
