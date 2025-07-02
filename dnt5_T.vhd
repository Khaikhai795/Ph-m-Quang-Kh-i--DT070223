----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/02/2025 08:29:21 AM
-- Design Name: 
-- Module Name: dnt6_T - Behavioral
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

entity dnt5 is
 Port ( clk : in std_logic;
       y : out std_logic;
       Q,Q_inv : buffer std_logic_vector( 2 downto 0));
end dnt5;

architecture Behavioral of dnt5 is
component T_FF is 
Port ( T: in std_logic;          
          clk: in std_logic;
          Q: buffer std_logic;
          Q_inv : buffer std_logic
    );
    end component;
    signal T0,T1,T2 : std_logic;
    signal Q0 : std_logic := '1';
    signal Q1 : std_logic := '0';
    signal Q2 : std_logic := '0';
    signal Q0_inv, Q1_inv, Q2_inv : std_logic;
  
begin

   Q <= Q2 & Q1 & Q0;
   Q_inv <= Q2_inv & Q1_inv & Q0_inv;
 
   T0 <= Q2 or Q1 or Q0;
   T1 <= Q2 or ( Q1 and (not Q0)) ;
   T2 <= (not Q1)and (not Q0 );

   TF0: T_FF port map (T => T0, clk => clk, Q => Q0, Q_inv => Q0_inv);
   TF1: T_FF port map (T => T1,  clk => clk, Q => Q1, Q_inv => Q1_inv);
   TF2: T_FF port map (T => T2,  clk => clk, Q => Q2, Q_inv => Q2_inv);
   y <= (not Q2) and (not Q1 ) and (not Q0 );
end Behavioral;
