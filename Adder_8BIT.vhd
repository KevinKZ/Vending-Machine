library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Adder_8BIT is
    Port ( ADD_IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           ADD_IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
           C_IN : in  STD_LOGIC;
           ADD_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end Adder_8BIT;

architecture Concurrent of Adder_8BIT is

begin

ADD_OUT <= std_logic_vector(unsigned(ADD_IN_A) + unsigned(ADD_IN_B) + unsigned'('0' & C_IN));

end Concurrent;

