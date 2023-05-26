library ieee;
use ieee.std_logic_1164.all;
entity BcdTo_7SEG_tb is end;
architecture simple of BcdTo_7SEG_tb is
------- Componrnts and Signals Declaration -----
Component BcdTo_7SEG is
PORT ( BCD_in  : IN   integer range 0 to 9;
	      D_out    : OUT std_logic_vector (6 DOWNTO 0));
end component;
constant clk_period: time:=100 ns;
signal S_BCD_in: integer range 0 to 9;
signal S_D_out: std_logic_vector (6 DOWNTO 0);

begin
------------ DUT instantiation -----------------
DUT: BcdTo_7SEG
	port map (
					BCD_in		=> S_BCD_in,
					D_out	=> S_D_out);
------- Signal's Waves Creation ----------------
S_BCD_in <= 0, 1 after 1 us, 2 after 2 us, 3 after 3 us, 4 after 4 us, 5 after 5 us, 6 after 6 us, 7 after 7 us, 8 after 8 us, 9 after 9 us;

end simple;

