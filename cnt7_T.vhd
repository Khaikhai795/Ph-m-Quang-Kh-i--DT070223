----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07/01/2025 10:34:01 PM
-- Design Name: 
-- Module Name: cnt7_T - Behavioral
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

entity cnt7_T is
Port ( clk : in std_logic;
       y : out std_logic;
       Q,Q_inv : buffer std_logic_vector( 2 downto 0));
end cnt7_T;

architecture Behavioral of cnt7_T is
component T_FF is 
Port ( T: in std_logic;          
          clk: in std_logic;
          Q: buffer std_logic;
          Q_inv : buffer std_logic
    );
    end component;
    signal T0,T1,T2 : std_logic;
--    signal Q0, Q1, Q2 : std_logic;
signal Q0 : std_logic := '0';
signal Q1 : std_logic := '0';
signal Q2 : std_logic := '0';
    signal Q0_inv, Q1_inv, Q2_inv : std_logic;
   begin
  
   Q <= Q2 & Q1 & Q0;
   Q_inv <= Q2_inv & Q1_inv & Q0_inv;

   T0 <= (not Q2 ) or ( not Q1);

   T1 <= Q0 or (Q1 and Q2);

   T2 <=( Q1 and Q0 ) or( Q2 and Q1) ;

   TF0: T_FF port map (T => T0, clk => clk, Q => Q0, Q_inv => Q0_inv);
   TF1: T_FF port map (T => T1,  clk => clk, Q => Q1, Q_inv => Q1_inv);
   TF2: T_FF port map (T => T2,  clk => clk, Q => Q2, Q_inv => Q2_inv);

   y <= (Q2 and Q1 ) and (not Q0);


end Behavioral;
