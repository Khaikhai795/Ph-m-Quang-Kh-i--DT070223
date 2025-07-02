library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BAI8_T is
    Port ( 
        clk : in STD_LOGIC;
        y : out STD_LOGIC_VECTOR (2 downto 0)
    );
end BAI8_T;

architecture Behavioral of BAI8_T is
    signal Q : STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal T : STD_LOGIC_VECTOR(2 downto 0);
    signal Q_inv : STD_LOGIC_VECTOR(2 downto 0);
    component T_FF is 
Port ( T: in std_logic;          
          clk: in std_logic;
          Q: buffer std_logic;
          Q_inv : buffer std_logic
    );
    end component;
begin
    FF0: T_FF port map(T => T(0), clk => clk, Q => Q(0), Q_inv => Q_inv(0));
    FF1: T_FF port map(T => T(1), clk => clk, Q => Q(1), Q_inv => Q_inv(1));
    FF2: T_FF port map(T => T(2), clk => clk, Q => Q(2), Q_inv => Q_inv(2));
    -- T0 = Q2' + Q1.Q0
    T(0) <= (not Q(2)) or (Q(1) and Q(0));
    
    -- T1 = Q2'.Q0
    T(1) <= (not Q(2)) and Q(0);
    
    -- T2 = Q1.Q0
    T(2) <= Q(1) and Q(0);
    
    -- ??u ra
    y<= Q;
end Behavioral;