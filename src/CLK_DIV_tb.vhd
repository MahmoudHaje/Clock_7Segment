library ieee;
use ieee.std_logic_1164.all;
entity clk_div_TB is
end;
architecture simple of clk_div_TB is
  -- Components and Signals Declaration
  Component clk_div is
    generic (divisor: integer);
    port (
      clock, rst: in std_logic;
      strobe: out std_logic
    );
  end component;
  constant div: integer := 3; -- Desired divisor value
  constant clk_period: time := 100 ns;
  signal S_rst: std_logic := '0';
  signal S_clk: std_logic := '0';
  signal S_strobe: std_logic := '0';
begin
  -- DUT instantiation
  DUT: clk_div
    generic map (divisor => div)
    port map (
      rst => S_rst,
      clock => S_clk,
      strobe => S_strobe
    );
  -- Signal's Waves Creation
  S_rst <= '0', '1' after 100 ns, '0' after 2000 ns, '1' after 2500 ns;  --  reset signal 
  S_clk <= not S_clk after clk_period / 2; -- Generate a clock signal with half the specified period
end simple;




