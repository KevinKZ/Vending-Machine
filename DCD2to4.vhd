library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity DCD2to4 is
    Port ( DCD_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           DCD_O1 : out  STD_LOGIC;
           DCD_O2 : out  STD_LOGIC;
           DCD_O3 : out  STD_LOGIC;
           DCD_O4 : out  STD_LOGIC;
           EN : in  STD_LOGIC);
end DCD2to4;

architecture Behavioral of DCD2to4 is

begin

DCD_O1 <= EN and (not(DCD_IN(1))) and (not(DCD_IN(0)));
DCD_O2 <= EN and (not(DCD_IN(1))) and DCD_IN(0);
DCD_O3 <= EN and DCD_IN(1) and (not(DCD_IN(0)));
DCD_O4 <= EN and DCD_IN(1) and DCD_IN(0);

end Behavioral;

