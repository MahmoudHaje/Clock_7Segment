library ieee;
use ieee.std_logic_1164.all;

entity clk_div is
    generic (divisor: integer);
    port (
        clock  : in std_logic;
        rst    : in std_logic;
        strobe : out std_logic
    );
end clk_div;

architecture behave of clk_div is
    signal cnt: integer range 0 to divisor := 0;  -- Counter for tracking clock cycles
begin
    process (clock, rst)
    begin
        if rst = '0' then
            strobe <= '0';  -- Reset strobe signal
            cnt <= 0;       -- Reset counter
        elsif rising_edge(clock) then
            if cnt = divisor - 1 then
                strobe <= '1';  -- Activate strobe signal
                cnt <= 0;       -- Reset counter
            else
                cnt <= cnt + 1;  -- Increment counter
                strobe <= '0';  -- Deactivate strobe signal
            end if;
        end if;
    end process;
end behave;





