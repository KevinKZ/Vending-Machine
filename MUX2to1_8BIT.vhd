library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity MUX2to1_8BIT is
    Port ( D0 : in  STD_LOGIC_VECTOR (7 downto 0);
           D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           S0 : in  STD_LOGIC;
           M_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end MUX2to1_8BIT;

architecture Concurrent of MUX2to1_8BIT is

begin

with S0 select
	M_OUT <= D0 when '0',
				D1 when others;
				
end Concurrent;

