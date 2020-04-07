library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity INVone is
    Port ( INV_IN : in  STD_LOGIC;
           INV_OUT : out  STD_LOGIC);
end INVone;

architecture Concurrent of INVone is

begin

INV_OUT <= not INV_IN;

end Concurrent;

