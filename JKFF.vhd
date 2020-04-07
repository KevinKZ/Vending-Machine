library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity JKFF is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
end JKFF;

architecture Behavioral of JKFF is
begin

process (CLK, RST)

variable imm : std_logic;

begin

if (RST = '1') then
	imm := '0';
else
	if (rising_edge(CLK)) then
		if (J = '0' and K = '0') then --no change
			imm := imm;
		elsif (J = '0' and K = '1') then --reset
			imm := '0';
		elsif (J = '1' and K = '0') then --set
			imm := '1';
		elsif (J = '1' and K = '1') then --toggle
			imm := not imm;
		else
			null;
		end if;
	end if;
end if;

Q <= imm;
QN <= not imm;

end process;
end Behavioral;

