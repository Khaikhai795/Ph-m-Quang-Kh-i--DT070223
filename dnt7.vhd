----------------------------------------------------------------------------------



library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity dnt7 is
   Port ( clk : in std_logic;
          y : out std_logic;
          Q,Q_inv : buffer std_logic_vector( 2 downto 0));
          
end dnt7;


architecture Behavioral of dnt7 is
  component JK_FF is 
      Port ( J: in std_logic;
          K: in std_logic;
          clk: in std_logic;
          Q: buffer std_logic ;
          Q_inv : buffer std_logic
    );
    end component;
    signal J0,J1,J2,K0,K1,K2 : std_logic;
    signal Q0, Q1, Q2 : std_logic;
    signal Q0_inv, Q1_inv, Q2_inv : std_logic;
   begin
  
   Q <= Q2 & Q1 & Q0;
   Q_inv <= Q2_inv & Q1_inv & Q0_inv;

   J0 <= Q2 or Q1; 
   K0 <= '1';

   J1 <= not Q0;
   K1 <= not  Q0;

   J2 <= (not Q1 ) and (not Q0 );
   K2 <= (not Q1 ) and (not Q0 );

   JK0: JK_FF port map (J => J0, K => K0, clk => clk, Q => Q0, Q_inv => Q0_inv);
   JK1: JK_FF port map (J => J1, K => K1, clk => clk, Q => Q1, Q_inv => Q1_inv);
   JK2: JK_FF port map (J => J2, K => K2, clk => clk, Q => Q2, Q_inv => Q2_inv);

   y <= Q2;

end Behavioral;
