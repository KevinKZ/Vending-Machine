library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ANDtwo is
    Port ( AND_IN_A : in  STD_LOGIC;
           AND_IN_B : in  STD_LOGIC;
           AND_OUT : out  STD_LOGIC);
end ANDtwo;

architecture Behavioral of ANDtwo is

begin

AND_OUT <= AND_IN_A and AND_IN_B;

end Behavioral;

