library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity CMP_8BIT is
    Port ( CMP_IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           CMP_IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
           CMP_GREATER : out  STD_LOGIC);
end CMP_8BIT;

architecture Behavioral of CMP_8BIT is

begin

process (CMP_IN_A, CMP_IN_B)

variable imm : std_logic;

begin

if (unsigned(CMP_IN_B) > unsigned(CMP_IN_A)) then
	imm := '1';
else
	imm := '0';
end if;

CMP_GREATER <= imm;

end process;
end Behavioral;

