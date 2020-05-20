library ieee;
use ieee.std_logic_1164.all;

entity reg_file_tb is
end reg_file_tb;

architecture behav of reg_file_tb is
component reg_file
port (		rs1: in std_logic_vector(1 downto 0); --select for register file output 1
            rs2: in std_logic_vector(1 downto 0); --select for register file output 2
            ws:	in std_logic_vector(1 downto 0); --writing select
            wd:	in std_logic_vector(7 downto 0); --writing data
            CLK: in std_logic; --clock
            we:	in std_logic; --writing enable
            rd1: out std_logic_vector(7 downto 0); --output 1 of register file
            rd2: out std_logic_vector(7 downto 0) -- output 2 of register file
);
end component;
signal wd, rd1, rd2 : std_logic_vector(7 downto 0);
signal CLK, we : std_logic;
signal ws, rs1, rs2 : std_logic_vector(1 downto 0);
begin
--  Component instantiation.
reg_file_0: reg_file port map (rs1 => rs1, rs2 => rs2, ws => ws, wd => wd, CLK => CLK, we => we, rd1 => rd1, rd2 => rd2);

process
type pattern_type is record
--  The inputs of the reg_file.
rs1, rs2, ws: std_logic_vector(1 downto 0);
wd: std_logic_vector (7 downto 0);
CLK, we: std_logic;
--  The expected outputs of the shift_reg.
rd1, rd2: std_logic_vector (7 downto 0);
end record;
--  The patterns to apply.
type pattern_array is array (natural range <>) of pattern_type;
constant patterns : pattern_array :=
---rs1---rs2---ws-------wd------CLK---we------rd1--------rd2---
(("00", "00", "00", "00000000", '0', '0', "00000000", "00000000"),
("00", "00", "00", "00000000", '0', '0', "00000000", "00000000")

);
begin
for n in patterns'range loop
--  Set the inputs.
rs1 <= patterns(n).rs1;
rs2 <= patterns(n).rs2;
ws <= patterns(n).ws;
wd <= patterns(n).wd;
CLK <= patterns(n).CLK;
we <= patterns(n).we;
wait for 1 ns;
assert rd1 = patterns(n).rd1;
assert rd2 = patterns(n).rd2;
report "bad output value" severity error;
end loop;
assert false report "end of test" severity note;
wait;
end process;
end behav;
