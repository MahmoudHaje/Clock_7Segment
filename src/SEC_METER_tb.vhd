
library ieee;
use ieee.std_logic_1164.all;

entity SEC_METER_tb is end;
architecture simple of SEC_METER_tb is
------- Componrnts and Signals Declaration -----
Component SEC_METER is
generic (div: integer;count_limit: integer);
	port(
		clk				: in std_logic;
		reset			: in std_logic;
		sec_ones_7seg	: out std_logic_vector(6 downto 0);
		sec_tens_7seg	: out std_logic_vector(6 downto 0);
		min_ones_7seg	: out std_logic_vector(6 downto 0);
		min_tens_7seg	: out std_logic_vector(6 downto 0);
		hour_led		: out std_logic);
end component;

constant clk_period	: time:=100 ns;
constant divv	: integer:=5;
constant count_limitx	: integer:=20;


signal S_rst		: std_logic:='0';
signal S_clk		: std_logic:='0';

signal S_sec_ones_7seg	: std_logic_vector(6 downto 0);
signal S_sec_tens_7seg	: std_logic_vector(6 downto 0);
signal S_min_ones_7seg	: std_logic_vector(6 downto 0);
signal S_min_tens_7seg	: std_logic_vector(6 downto 0);

--signal S_strobe: std_logic:='1';

begin
------------ DUT instantiation -----------------
DUT: SEC_METER
generic map (div=>divv, count_limit=>count_limitx)
	port map (
					reset		=> S_rst,
					clk			=> S_clk,
					sec_ones_7seg=>S_sec_ones_7seg,
					sec_tens_7seg=>S_sec_tens_7seg,
					min_ones_7seg=>S_min_ones_7seg,
					min_tens_7seg=>S_min_tens_7seg
				);

S_rst	<='0','1' after 100 ns, '0' after 16000 ns, '1' after 20000 ns, '0' after 25000 ns, '1' after 26000 ns;
S_clk <= not S_clk after clk_period / 2; 

end simple;