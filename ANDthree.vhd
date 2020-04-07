library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ANDthree is
    Port ( AND_IN_A : in  STD_LOGIC;
           AND_IN_B : in  STD_LOGIC;
           AND_IN_C : in  STD_LOGIC;
           AND_OUT : out  STD_LOGIC);
end ANDthree;

architecture Concurrent of ANDthree is

begin

AND_OUT <= AND_IN_A and AND_IN_B and AND_IN_C;

end Concurrent;

