library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity BAI_9_D is
    Port ( 
        clk : in STD_LOGIC;
        Q : out STD_LOGIC_VECTOR (2 downto 0)
    );
end BAI_9_D;

architecture Behavioral of BAI_9_D is
    component D_FF is
        Port ( D : in STD_LOGIC;
               clk : in STD_LOGIC;
               Q : out STD_LOGIC);
    end component;
    
    signal D : STD_LOGIC_VECTOR(2 downto 0);
    signal Q_int : STD_LOGIC_VECTOR(2 downto 0) := "001"; 
begin
    
    FF0: D_FF port map(D => D(0), clk => clk, Q => Q_int(0));
    FF1: D_FF port map(D => D(1), clk => clk, Q => Q_int(1));
    FF2: D_FF port map(D => D(2), clk => clk, Q => Q_int(2));
    
    
    process(Q_int)
    begin
        
    D(0) <= (not Q_int(2) and not Q_int(1) and Q_int(0)) or
            (Q_int(2) and Q_int(1) and not Q_int(0)) or
            (Q_int(2) and not Q_int(1) and not Q_int(0));

    D(1) <= (not Q_int(2) and not Q_int(1) and Q_int(0)) or
            (not Q_int(2) and Q_int(1) and Q_int(0)) or
            (Q_int(2) and not Q_int(1) and not Q_int(0));
    
    D(2) <= (not Q_int(2) and Q_int(1) and Q_int(0)) or
            (Q_int(2) and not Q_int(1) and Q_int(0)) or
            (Q_int(2) and Q_int(1) and not Q_int(0));
    
    Q <= Q_int;
    end process;
end Behavioral;