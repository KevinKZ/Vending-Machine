library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity REG_8BIT is
    Port ( P_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           P_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end REG_8BIT;

architecture Behavioral of REG_8BIT is

begin

process (CLK, CLR)

variable imm : std_logic_vector (7 downto 0);

begin

if (CLR = '1') then
	imm := "00000000";
else
	if (rising_edge(CLK)) then
		if (EN = '1') then
			imm := P_IN;
		end if;
	end if;
end if;

P_OUT <= imm;

end process;
end Behavioral;

