library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VENDING_MACHINE is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           MONEY : in  STD_LOGIC_VECTOR (1 downto 0);
           ITEM : in  STD_LOGIC_VECTOR (1 downto 0);
			  MONEY_IN : STD_LOGIC;
			  ITEM_SELECTED : STD_LOGIC;
           CHANGE : out  STD_LOGIC_VECTOR (7 downto 0);
           ITEM1 : out  STD_LOGIC;
           ITEM2 : out  STD_LOGIC;
           ITEM3 : out  STD_LOGIC;
           ITEM4 : out  STD_LOGIC);
end VENDING_MACHINE;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity VENDING_MACHINE is
    Port ( CLK : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           MONEY : in  STD_LOGIC_VECTOR (1 downto 0);
           ITEM : in  STD_LOGIC_VECTOR (1 downto 0);
			  MONEY_IN : STD_LOGIC;
			  ITEM_SELECTED : STD_LOGIC;
           CHANGE : out  STD_LOGIC_VECTOR (7 downto 0);
           ITEM1 : out  STD_LOGIC;
           ITEM2 : out  STD_LOGIC;
           ITEM3 : out  STD_LOGIC;
           ITEM4 : out  STD_LOGIC);
end VENDING_MACHINE;

architecture Behavioral of VENDING_MACHINE is

component Datapath is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           MONEY : in  STD_LOGIC_VECTOR (1 downto 0);
           ITEM : in  STD_LOGIC_VECTOR (1 downto 0);
           SUB : in  STD_LOGIC;
           LOAD_INPUT : in  STD_LOGIC;
           LOAD_ITEM : in  STD_LOGIC;
           LOAD_CHANGE : in  STD_LOGIC;
           DCD_EN : in  STD_LOGIC;
           LOAD_TOTAL : in  STD_LOGIC;
           GREATER_THAN : out  STD_LOGIC;
           CHANGE : out  STD_LOGIC_VECTOR (7 downto 0);
           ITEM1_EJECTED : out  STD_LOGIC;
           ITEM2_EJECTED : out  STD_LOGIC;
           ITEM3_EJECTED : out  STD_LOGIC;
           ITEM4_EJECTED : out  STD_LOGIC);
end component;

component ASMController is
    Port ( CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
			  ITEM_SELECTED : in  STD_LOGIC;
           MONEY_IN : in  STD_LOGIC;
           GREATER_THAN : in  STD_LOGIC;
           CLR : out  STD_LOGIC;
           SUB : out  STD_LOGIC;
           LOAD_INPUT : out  STD_LOGIC;
           LOAD_ITEM : out  STD_LOGIC;
           LOAD_CHANGE : out  STD_LOGIC;
           LOAD_TOTAL : out  STD_LOGIC;
           DCD_EN : out  STD_LOGIC);
end component;

signal LD_INPUT, LD_ITEM, LD_CHANGE, LD_TOTAL, ITEM_EJECT, SUBTRACT, CLEAR : STD_LOGIC; --Controller to Datapath
signal Z0 : STD_LOGIC; --Datapath to CU

begin

ASM: ASMController port map (CLK => CLK, RST => RST, ITEM_SELECTED => ITEM_SELECTED, MONEY_IN => MONEY_IN,
	GREATER_THAN => Z0, CLR => CLEAR, SUB => SUBTRACT, LOAD_INPUT => LD_INPUT, LOAD_ITEM => LD_ITEM,
	LOAD_CHANGE => LD_CHANGE, LOAD_TOTAL => LD_TOTAL, DCD_EN => ITEM_EJECT);
	
DATA: Datapath port map (CLK => CLK, CLR => CLEAR, MONEY => MONEY, ITEM => ITEM, SUB => SUBTRACT, LOAD_INPUT => LD_INPUT,
	LOAD_ITEM => LD_ITEM, LOAD_CHANGE => LD_CHANGE, DCD_EN => ITEM_EJECT, LOAD_TOTAL => LD_TOTAL, GREATER_THAN => Z0,
	CHANGE => CHANGE, ITEM1_EJECTED => ITEM1, ITEM2_EJECTED => ITEM2, ITEM3_EJECTED => ITEM3, ITEM4_EJECTED => ITEM4);

end Behavioral;

architecture Behavioral of VENDING_MACHINE is

component Datapath is
    Port ( CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           MONEY : in  STD_LOGIC_VECTOR (1 downto 0);
           ITEM : in  STD_LOGIC_VECTOR (1 downto 0);
           SUB : in  STD_LOGIC;
           LOAD_INPUT : in  STD_LOGIC;
           LOAD_ITEM : in  STD_LOGIC;
           LOAD_CHANGE : in  STD_LOGIC;
           DCD_EN : in  STD_LOGIC;
           LOAD_TOTAL : in  STD_LOGIC;
           GREATER_THAN : out  STD_LOGIC;
           CHANGE : out  STD_LOGIC_VECTOR (7 downto 0);
           ITEM1_EJECTED : out  STD_LOGIC;
           ITEM2_EJECTED : out  STD_LOGIC;
           ITEM3_EJECTED : out  STD_LOGIC;
           ITEM4_EJECTED : out  STD_LOGIC);
end component;

component ASMController is
    Port ( CLK : in STD_LOGIC;
			  RST : in STD_LOGIC;
			  ITEM_SELECTED : in  STD_LOGIC;
           MONEY_IN : in  STD_LOGIC;
           GREATER_THAN : in  STD_LOGIC;
           CLR : out  STD_LOGIC;
           SUB : out  STD_LOGIC;
           LOAD_INPUT : out  STD_LOGIC;
           LOAD_ITEM : out  STD_LOGIC;
           LOAD_CHANGE : out  STD_LOGIC;
           LOAD_TOTAL : out  STD_LOGIC;
           DCD_EN : out  STD_LOGIC);
end component;

signal LD_INPUT, LD_ITEM, LD_CHANGE, LD_TOTAL, ITEM_EJECT, SUBTRACT, CLEAR : STD_LOGIC; --Controller to Datapath
signal Z0 : STD_LOGIC; --Datapath to CU

begin

ASM: ASMController port map (CLK => CLK, RST => RST, ITEM_SELECTED => ITEM_SELECTED, MONEY_IN => MONEY_IN,
	GREATER_THAN => Z0, CLR => CLEAR, SUB => SUBTRACT, LOAD_INPUT => LD_INPUT, LOAD_ITEM => LD_ITEM,
	LOAD_CHANGE => LD_CHANGE, LOAD_TOTAL => LD_TOTAL, DCD_EN => ITEM_EJECT);
	
DATA: Datapath port map (CLK => CLK, CLR => CLEAR, MONEY => MONEY, ITEM => ITEM, SUB => SUBTRACT, LOAD_INPUT => LD_INPUT,
	LOAD_ITEM => LD_ITEM, LOAD_CHANGE => LD_CHANGE, DCD_EN => ITEM_EJECT, LOAD_TOTAL => LD_TOTAL, GREATER_THAN => Z0,
	CHANGE => CHANGE, ITEM1_EJECTED => ITEM1, ITEM2_EJECTED => ITEM2, ITEM3_EJECTED => ITEM3, ITEM4_EJECTED => ITEM4);

end Behavioral;

