----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 05:08:03 PM
-- Design Name: 
-- Module Name: NAND - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity NAND_BT is
  Port (A: in std_logic;
        B: in std_logic;
        C: in std_logic;
        F: out std_logic );
end NAND_BT;

architecture Behavioral of NAND_BT is
signal not_A : std_logic;
signal temp1, temp2, temp3 : std_logic;
begin
    not_A <= A nand A;
    temp1 <= not_A nand B;
    temp2 <= not_A nand C;
    temp3 <= B nand C;
    F <= (temp1 nand temp2) nand temp3;
end Behavioral;
