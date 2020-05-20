library ieee;
use ieee.std_logic_1164.all;

entity reg_tb is
end reg_tb;

architecture behav of reg_tb is
component reg
port (	D: in std_logic_vector(7 downto 0);
CLK, EN, RESET: in std_logic;
Q: out std_logic_vector(7 downto 0)
);
end component;
signal d, q : std_logic_vector(7 downto 0);
signal clock, enable, reset : std_logic;
begin
--  Component instantiation.
reg_0: reg port map (D => d, CLK => clock, EN => enable, RESET => reset, Q => q);

--  This process does the real job.
process
type pattern_type is record
--these below are what is in our for loop
d: std_logic_vector (7 downto 0);
clock, enable, reset: std_logic;
q: std_logic_vector (7 downto 0);
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array :=
(("00000000", '0', '0', '1', "00000000"),
("00000000", '1', '1', '0', "00000000"),
("00000000", '1', '1', '0', "00000000"),
("00000000", '0', '0', '0', "00000000"),
("10000101", '1', '1', '0', "10000101"),
("10000101", '0', '1', '0', "10000101"),
("10000100", '1', '0', '0', "10000101")
);
begin
--  Check each pattern.
for n in patterns'range loop
--  Set the inputs.
d <= patterns(n).d;
clock <= patterns(n).clock;
enable <= patterns(n).enable;
reset <= patterns(n).reset;
wait for 1 ns;
assert q = patterns(n).q
report "bad output value" severity error;
end loop;
assert false report "end of test" severity note;
wait;
end process;
end behav;
