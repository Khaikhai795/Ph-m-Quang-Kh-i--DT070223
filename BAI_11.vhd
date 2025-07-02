library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity BAI_11 is
    Port (
        clk : in STD_LOGIC;
        y   : out STD_LOGIC_VECTOR (2 downto 0)
    );
end BAI_11;

architecture Behavioral of BAI_11 is
component JK_FF
       Port ( J: in std_logic;
          K: in std_logic;
          clk: in std_logic;
          Q: buffer std_logic;
          Q_inv : buffer std_logic
    );
    end component;
    signal Q : STD_LOGIC_VECTOR (2 downto 0) := "000";
    signal Qinv   : STD_LOGIC_VECTOR (2 downto 0);
    signal J0, K0, J1, K1, J2, K2 : STD_LOGIC;
begin
    y<=Q;
        J0 <= (not Q(2) and not Q(1) and not Q(0)) or
          (not Q(2) and not Q(1) and Q(0)) or
          (not Q(2) and Q(1) and Q(0)) or
          (Q(2) and Q(1) and Q(0));
    K0 <= not J0; 

    -- FF Q1
    J1 <= (not Q(2) and not Q(1) and Q(0)) or
          (Q(2) and not Q(1) and Q(0));
    K1 <= J1;

    -- FF Q2
    J2 <= (not Q(2) and Q(1) and not Q(0)) or
          (Q(2) and Q(1));
    K2 <= J2;

    ff0: JK_FF port map(clk => clk, J => J0, K => K0, Q => Q(0), Q_inv => Qinv(0));
    ff1: JK_FF port map(clk => clk, J => J1, K => K1, Q => Q(1), Q_inv => Qinv(1));
    ff2: JK_FF port map(clk => clk, J => J2, K => K2, Q => Q(2), Q_inv => Qinv(2));
    

end Behavioral;
