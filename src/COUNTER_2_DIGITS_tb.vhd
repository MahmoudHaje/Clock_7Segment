library ieee;
use ieee.std_logic_1164.all;

entity COUNTER_2_DIGITS_tb is
end;

architecture simple of COUNTER_2_DIGITS_tb is

  -- Components and Signals Declaration
  Component COUNTER_2_DIGITS is
    generic (count_size: integer);
    port (
      enable : in std_logic;
      clock  : in std_logic;
      rst    : in std_logic;
      ones   : out integer range 0 to 9;
      tens   : out integer range 0 to 9;
      carry  : out std_logic
    );
  end component;

  constant clk_period : time := 100 ns;
  constant cnt_size   : integer := 20; -- Desired count size
  signal S_rst        : std_logic := '0';
  signal S_clk        : std_logic := '0';
  signal S_enable     : std_logic := '0';
  signal S_carry      : std_logic := '1';

  signal S_ones       : integer range 0 to 9;
  signal S_tens       : integer range 0 to 9;

begin

  -- DUT instantiation
  DUT: COUNTER_2_DIGITS
    generic map (count_size => cnt_size)
    port map (
      rst    => S_rst,
      clock  => S_clk,
      enable => S_enable,
      ones   => S_ones,
      tens   => S_tens,
      carry  => S_carry
    );

  -- Signal's Waves Creation
  S_rst    <= '0', '1' after 100 ns, '0' after 3000 ns, '1' after 5000 ns; -- Toggle the reset signal at specific time intervals
  S_enable <= '0', '1' after 130 ns, '0' after 200 ns, '1' after 600 ns; -- Toggle the enable signal at specific time intervals
  S_clk    <= not S_clk after clk_period / 2; -- Generate a clock signal with half the specified period

end simple;
