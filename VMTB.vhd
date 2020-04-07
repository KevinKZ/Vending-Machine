--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:55:03 03/29/2020
-- Design Name:   
-- Module Name:   C:/Users/Kevin/Desktop/Lab6Take3/Lab6Take3/VMTB.vhd
-- Project Name:  Lab6Take3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: VENDING_MACHINE
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY VMTB IS
END VMTB;
 
ARCHITECTURE behavior OF VMTB IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT VENDING_MACHINE
    PORT(
         CLK : IN  std_logic;
         RST : IN  std_logic;
         MONEY : IN  std_logic_vector(1 downto 0);
         ITEM : IN  std_logic_vector(1 downto 0);
         MONEY_IN : IN  std_logic;
         ITEM_SELECTED : IN  std_logic;
         CHANGE : OUT  std_logic_vector(7 downto 0);
         ITEM1 : OUT  std_logic;
         ITEM2 : OUT  std_logic;
         ITEM3 : OUT  std_logic;
         ITEM4 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal CLK : std_logic := '0';
   signal RST : std_logic := '0';
   signal MONEY : std_logic_vector(1 downto 0) := (others => '0');
   signal ITEM : std_logic_vector(1 downto 0) := (others => '0');
   signal MONEY_IN : std_logic := '0';
   signal ITEM_SELECTED : std_logic := '0';

 	--Outputs
   signal CHANGE : std_logic_vector(7 downto 0);
   signal ITEM1 : std_logic;
   signal ITEM2 : std_logic;
   signal ITEM3 : std_logic;
   signal ITEM4 : std_logic;

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: VENDING_MACHINE PORT MAP (
          CLK => CLK,
          RST => RST,
          MONEY => MONEY,
          ITEM => ITEM,
          MONEY_IN => MONEY_IN,
          ITEM_SELECTED => ITEM_SELECTED,
          CHANGE => CHANGE,
          ITEM1 => ITEM1,
          ITEM2 => ITEM2,
          ITEM3 => ITEM3,
          ITEM4 => ITEM4
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		

	RST <= '1';
	wait for CLK_period;
	
	RST <= '0';
	MONEY <= "01"; --QUARTER
	wait for CLK_period * 3;
	
	MONEY_IN <= '1';
	
	ITEM <= "00"; --.45
	wait for CLK_period;
	
	MONEY_IN <= '1';
	ITEM_SELECTED <= '1';
	wait for CLK_period * 5;
	
	MONEY <= "10"; --DOLLAR
	wait for CLK_period;
	
	MONEY_IN <= '1';
      wait;
   end process;

END;
