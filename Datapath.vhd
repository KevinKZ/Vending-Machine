library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Datapath is
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
end Datapath;

architecture Structural of Datapath is

component REG_2BIT is
    Port ( P_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           P_OUT : out  STD_LOGIC_VECTOR (1 downto 0));
end component;

component REG_8BIT is
    Port ( P_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           CLR : in  STD_LOGIC;
           EN : in  STD_LOGIC;
           P_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX2to1_8BIT is
    Port ( D0 : in  STD_LOGIC_VECTOR (7 downto 0);
           D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           S0 : in  STD_LOGIC;
           M_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component MUX4to1_8BIT is
    Port ( D0 : in  STD_LOGIC_VECTOR (7 downto 0);
           D1 : in  STD_LOGIC_VECTOR (7 downto 0);
           D2 : in  STD_LOGIC_VECTOR (7 downto 0);
           D3 : in  STD_LOGIC_VECTOR (7 downto 0);
           Sel : in  STD_LOGIC_VECTOR (1 downto 0);
           M_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component INV_8BIT is
    Port ( INV_IN : in  STD_LOGIC_VECTOR (7 downto 0);
           INV_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component Adder_8BIT is
    Port ( ADD_IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           ADD_IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
           C_IN : in  STD_LOGIC;
           ADD_OUT : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component CMP_8BIT is
    Port ( CMP_IN_A : in  STD_LOGIC_VECTOR (7 downto 0);
           CMP_IN_B : in  STD_LOGIC_VECTOR (7 downto 0);
           CMP_GREATER : out  STD_LOGIC);
end component;

component DCD2to4 is
    Port ( DCD_IN : in  STD_LOGIC_VECTOR (1 downto 0);
           DCD_O1 : out  STD_LOGIC;
           DCD_O2 : out  STD_LOGIC;
           DCD_O3 : out  STD_LOGIC;
           DCD_O4 : out  STD_LOGIC;
           EN : in  STD_LOGIC);
end component;


signal IP : STD_LOGIC_VECTOR (1 DOWNTO 0); --INPUT SELECT
signal IT : STD_LOGIC_VECTOR (1 DOWNTO 0); --ITEM ITEM SELECT
signal MONEY_INPUT : STD_LOGIC_VECTOR (7 DOWNTO 0); --INPUT REGISTER
signal COST_INPUT : STD_LOGIC_VECTOR (7 DOWNTO 0); --ITEM REGISTER
signal COST_INV : STD_LOGIC_VECTOR (7 DOWNTO 0); --1C OF COST
signal MONEY_OR_COST : STD_LOGIC_VECTOR (7 DOWNTO 0); --OUTPUT OF 2X1 MUX
signal ADDER_TOTAL : STD_LOGIC_VECTOR (7 DOWNTO 0); --ADDER OUTPUT
signal TOTAL_OUT : STD_LOGIC_VECTOR (7 DOWNTO 0); --TOTAL REGISTER


begin

INPUT_REG: REG_2BIT port map (P_IN => MONEY, CLK => CLK, CLR => CLR, EN => LOAD_INPUT, P_OUT =>IP);
ITEM_REG: REG_2BIT port map (P_IN => ITEM, CLK => CLK, CLR => CLR, EN => LOAD_ITEM, P_OUT => IT);

MUX_INPUT: MUX4to1_8BIT port map (D0 => "00001010", D1 => "00011001", D2 => "01100100",
	D3 => "00000000", Sel => IP, M_OUT => MONEY_INPUT);
MUX_ITEM: MUX4to1_8BIT port map (D0 => "00101101", D1 => "01001011", D2 => "01010000",
	D3 => "01100100", Sel => IT, M_OUT => COST_INPUT);
	
INV1C: INV_8BIT port map (INV_IN => COST_INPUT, INV_OUT => COST_INV);
MUX_MONEY_OR_COST: MUX2to1_8BIT port map (D0 => MONEY_INPUT, D1 => COST_INV, S0 => SUB, M_OUT => MONEY_OR_COST);

ALU: Adder_8BIT port map (ADD_IN_A => TOTAL_OUT, ADD_IN_B => MONEY_OR_COST, C_IN => SUB, ADD_OUT => ADDER_TOTAL);

TOTAL_REG: REG_8BIT port map (P_IN => ADDER_TOTAL, CLK => CLK, CLR => CLR, EN => LOAD_TOTAL, P_OUT => TOTAL_OUT);

COMPARE: CMP_8BIT port map (CMP_IN_A => TOTAL_OUT, CMP_IN_B => COST_INPUT, CMP_GREATER => GREATER_THAN);

SHOW_CHANGE: REG_8BIT port map (P_IN => ADDER_TOTAL, CLK => CLK, CLR => CLR, EN => LOAD_CHANGE, P_OUT => CHANGE);

DISPENSE: DCD2to4 port map (DCD_IN => IT, DCD_O1 => ITEM1_EJECTED, DCD_O2 => ITEM2_EJECTED,
	DCD_O3 => ITEM3_EJECTED, DCD_O4 => ITEM4_EJECTED, EN => DCD_EN);

end Structural;

