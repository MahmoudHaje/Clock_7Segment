library ieee;
use ieee.std_logic_1164.all;

entity COUNTER_2_DIGITS is
    generic (count_size: integer);
    port (
        enable : in  std_logic;
        clock  : in  std_logic;
        rst    : in  std_logic;
        ones   : out integer range 0 to 9;
        tens   : out integer range 0 to 9;
        carry  : out std_logic := '0'
    );
end entity;

architecture behave of COUNTER_2_DIGITS is
    signal cnt: integer range 0 to count_size;

begin

    process (clock, rst)
    begin
        if rst = '0' then
            carry <= '0';       -- Reset carry signal
            cnt <= 1;           -- Reset counter
            ones <= 0;          -- Reset ones digit
            tens <= 0;          -- Reset tens digit
        elsif rising_edge(clock) then
            carry <= '0';       -- Clear carry signal

            if enable = '1' then
                if cnt = count_size - 1 then
                    cnt <= 0;       -- Reset counter
                    ones <= cnt rem 10;     -- Calculate ones digit
                    tens <= cnt / 10;       -- Calculate tens digit
                else
                    cnt <= cnt + 1;         -- Increment counter
                    ones <= cnt rem 10;     -- Calculate ones digit
                    tens <= cnt / 10;       -- Calculate tens digit
                end if;
                if cnt = 0 then
                    carry <= '1';   -- Set carry signal
                end if;
            end if;
        end if;
    end process;

end behave;
