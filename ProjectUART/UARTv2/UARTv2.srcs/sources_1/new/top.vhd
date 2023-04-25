

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           BTNC : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           JA : out STD_LOGIC
           );
end top;

architecture Behavioral of top is

  signal sig_datap : std_logic_vector (7 downto 0);

begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_4digits 
  --------------------------------------------------------
 
 vysilac : entity work.vysilac
    port map(
    

        clk => CLK100MHZ,
        rst => BTNC,
        data => SW(7 downto 0),
        vysledek(7 downto 0) => LED(7 downto 0),
        prepinac => SW(15),
        vystup => JA ,
        SW(7 downto 0) => SW(7 downto 0)
        
        );
        
  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Disconnect the top four digits of the 7-segment display
  --AN(7 downto 4) <= b"1111";

end architecture behavioral;
