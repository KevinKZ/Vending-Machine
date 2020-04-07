library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ASMController is
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
end ASMController;

architecture Structural of ASMController is

component JKFF is
    Port ( J : in  STD_LOGIC;
           K : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
			  RST : in STD_LOGIC;
           Q : out  STD_LOGIC;
           QN : out  STD_LOGIC);
end component;

component ANDthree is
    Port ( AND_IN_A : in  STD_LOGIC;
           AND_IN_B : in  STD_LOGIC;
           AND_IN_C : in  STD_LOGIC;
           AND_OUT : out  STD_LOGIC);
end component;

component ORtwo is
    Port ( OR_IN_A : in  STD_LOGIC;
           OR_IN_B : in  STD_LOGIC;
           OR_OUT : out  STD_LOGIC);
end component;

component ANDtwo is
    Port ( AND_IN_A : in  STD_LOGIC;
           AND_IN_B : in  STD_LOGIC;
           AND_OUT : out  STD_LOGIC);
end component;

component INVone is
    Port ( INV_IN : in  STD_LOGIC;
           INV_OUT : out  STD_LOGIC);
end component;


signal tmp1, tmp2, tmp3, tmp4, tmp5 : std_logic; --intermediate gates
signal J1, K1, J2, K2, J3, K3 : std_logic; --FF input
signal Q1, Q1N, Q2, Q2N, Q3, Q3N : std_logic; --FF output

begin

--FF1
AND1: ANDtwo port map (AND_IN_A => Q2, AND_IN_B => Q3N, AND_OUT => J1);
OR1: ORtwo port map (OR_IN_A => Q1, OR_IN_B => Q2, OR_OUT => tmp1);
AND2: ANDtwo port map (AND_IN_A => tmp1, AND_IN_B => GREATER_THAN, AND_OUT => tmp2);
OR2: ORtwo port map (OR_IN_A => Q3N, OR_IN_B => tmp2, OR_OUT => K1);
JKFF1: JKFF port map (J => J1, K => K1, CLK => CLK, RST => RST, Q => Q1, QN => Q1N);

--FF2
AND3: ANDthree port map (AND_IN_A => Q3, AND_IN_B => Q1N, AND_IN_C => ITEM_SELECTED, AND_OUT => J2);
INV1: INVone port map (INV_IN => GREATER_THAN, INV_OUT => tmp3);
AND4: ANDtwo port map (AND_IN_A => Q1, AND_IN_B => tmp3, AND_OUT => K2);
JKFF2: JKFF port map (J => J2, K => K2, CLK => CLK, RST => RST, Q => Q2, QN => Q2N);

--FF3
OR3: ORtwo port map (OR_IN_A => Q1N, OR_IN_B => Q2, OR_OUT => J3);
AND5: ANDtwo port map (AND_IN_A => Q2N, AND_IN_B => Q1, AND_OUT => tmp4);
AND6: ANDthree port map (AND_IN_A => Q1N, AND_IN_B => Q2, AND_IN_C => MONEY_IN, AND_OUT => tmp5);
OR4: ORtwo port map (OR_IN_A => tmp4, OR_IN_B => tmp5, OR_OUT => K3);
JKFF3: JKFF port map (J => J3, K => K3, CLK => CLK, RST => RST, Q => Q3, QN => Q3N);

--OUTPUT
AND7: ANDthree port map (AND_IN_A => Q1N, AND_IN_B => Q2N, AND_IN_C => Q3N, AND_OUT => CLR); --CLR
AND8: ANDthree port map (AND_IN_A => Q1, AND_IN_B => Q2N, AND_IN_C => Q3, AND_OUT => SUB); --SUB
AND9: ANDthree port map (AND_IN_A => Q1N, AND_IN_B => Q2, AND_IN_C => Q3, AND_OUT => LOAD_INPUT); --LOAD_INPUT
ANDA: ANDthree port map (AND_IN_A => Q1N, AND_IN_B => Q2N, AND_IN_C => Q3, AND_OUT => LOAD_ITEM); --LOAD_ITEM
ANDB: ANDthree port map (AND_IN_A => Q1, AND_IN_B => Q2N, AND_IN_C => Q3, AND_OUT => LOAD_CHANGE); --LOAD_CHANGE
ANDC: ANDthree port map (AND_IN_A => Q1, AND_IN_B => Q2N, AND_IN_C => Q3N, AND_OUT => DCD_EN); --DCD_EN
ANDD: ANDthree port map (AND_IN_A => Q1N, AND_IN_B => Q2, AND_IN_C => Q3N, AND_OUT => LOAD_TOTAL); --LOAD_TOTAL

end Structural;

