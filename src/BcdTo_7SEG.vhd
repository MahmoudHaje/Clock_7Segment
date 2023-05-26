
library ieee;
use ieee.std_logic_1164.all;

entity BcdTo_7SEG is
    -- Input: a single BCD digit in the range 0 to 9.
    Port (
        bcd_in : in INTEGER RANGE 0 to 9;
        -- Output: a 7-bit vector representing the digit in 7-segment display format.
        d_out : out STD_LOGIC_VECTOR (6 downto 0)
    );
end entity;

architecture behave of BcdTo_7SEG is
begin
    d_out <= "1000000" when bcd_in = 0 else
             "1111001" when bcd_in = 1 else
             "0100100" when bcd_in = 2 else
             "0110000" when bcd_in = 3 else
             "0011001" when bcd_in = 4 else
             "0010010" when bcd_in = 5 else
             "0000010" when bcd_in = 6 else
             "1111000" when bcd_in = 7 else
             "0000000" when bcd_in = 8 else
             "0010000" when bcd_in = 9 else
             "1111111"; -- If the input is invalid, display a blank character.
end architecture;




