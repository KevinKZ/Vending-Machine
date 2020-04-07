library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity INV_8BIT is
    Port ( INV_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           INV_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end INV_8BIT;

architecture Concurrent of INV_8BIT is

begin

INV_OUT <= not INV_IN;

end Concurrent;

