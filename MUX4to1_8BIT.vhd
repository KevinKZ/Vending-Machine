library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX4to1_8BIT is
    Port ( D0 : in  STD_LOGIC_VECTOR (7 downto 0);
           D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           D2 : in  STD_LOGIC_VECTOR (7 downto 0);
           D3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           M_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX4to1_8BIT;

architecture Concurrent of MUX4to1_8BIT is

begin

with Sel select
	M_OUT <= D0 when "00",
				D1 when "01",
				D2 when "10",
				D3 when others;

end Concurrent;

