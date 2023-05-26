
library ieee;
use ieee.std_logic_1164.all;

entity SEC_METER is
generic (div: integer:=50000000;count_limit: integer:=20);
	port(
		clk				: in std_logic;
		reset			: in std_logic;
		sec_ones_7seg	: out std_logic_vector(6 downto 0);
		sec_tens_7seg	: out std_logic_vector(6 downto 0);
		min_ones_7seg	: out std_logic_vector(6 downto 0);
		min_tens_7seg	: out std_logic_vector(6 downto 0);
		hour_led		: out std_logic
		);
end SEC_METER;
architecture behave of SEC_METER is

component clk_div
generic (divisor: integer);
port(
		clock	:in std_logic;
		rst		:in std_logic;
		strobe	: out std_logic
	);
end component;

component COUNTER_2_DIGITS
generic (count_size: integer);
port(
		enable	: in std_logic;
		clock	: in std_logic;
		rst		: in std_logic;
		ones	: out integer range 0 to 9;
		tens	: out integer range 0 to 9;
		carry	: out std_logic
	);
end component;

component BcdTo_7SEG
PORT ( 		
		BCD_in  : IN   integer range 0 to 9;
		D_out    : OUT std_logic_vector (6 DOWNTO 0));
end component;

signal Strobe_1sec	: std_logic:='0';
signal Strobe_1min	: std_logic:='0';
signal sec_ones		:integer range 0 to 9;
signal sec_tens		:integer range 0 to 9;
signal min_ones		:integer range 0 to 9;
signal min_tens		:integer range 0 to 9;
begin

u1: clk_div
generic map (divisor=>div)
port map (
			clock=>clk,
			rst=>reset,
			strobe=>strobe_1sec
				);
				
u2:COUNTER_2_DIGITS
generic map (count_size=>count_limit)
port map (
			clock=>clk,
			rst=>reset,
			enable=>strobe_1sec,
			ones=>sec_ones,
			tens=>sec_tens,
			carry=>strobe_1min
			);
			
u3:COUNTER_2_DIGITS
generic map (count_size=>count_limit)
port map (
			clock=>clk,
			rst=>reset,
			enable=>strobe_1min,
			ones=>min_ones,
			tens=>min_tens,
			carry=>hour_led
			);
			
u4:BcdTo_7SEG
port map (
			bcd_in=>sec_ones,
			d_out=>sec_ones_7seg
			);
			
u5:BcdTo_7SEG
port map (
			bcd_in=>sec_tens,
			d_out=>sec_tens_7seg
			);
			
u6:BcdTo_7SEG
port map (
			bcd_in=>min_ones,
			d_out=>min_ones_7seg
			);				
			
u7:BcdTo_7SEG
port map (
			bcd_in=>min_tens,
			d_out=>min_tens_7seg
			);
			
end behave;				
				
				
