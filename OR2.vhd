library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ORtwo is
    Port ( OR_IN_A : in  STD_LOGIC;
           OR_IN_B : in  STD_LOGIC;
           OR_OUT : out  STD_LOGIC);
end ORtwo;

architecture Concurrent of ORtwo is

begin

OR_OUT <= OR_IN_A or OR_IN_B;

end Concurrent;

