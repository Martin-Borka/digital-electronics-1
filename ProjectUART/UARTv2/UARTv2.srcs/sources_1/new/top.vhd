

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity top is
    Port ( CLK100MHZ : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (15 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           -- NEJAKY : out STD_LOGIC; --simulace
           --nevim : out STD_LOGIC_VECTOR (7 downto 0);
           JA : in STD_LOGIC_VECTOR (0 downto 0);
           JB : out STD_LOGIC_VECTOR (0 downto 0)
           );
end top;

architecture Behavioral of top is
  signal sig_datap : std_logic_vector (7 downto 0);
-- No internal signals are needed today:)

begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_4digits 
  --------------------------------------------------------
 
 vysilac : entity work.vysilac
    port map(
    
        --napsat že SW= LED
        prepinac => SW(15),
        clk => CLK100MHZ,
        rst => BTNC,
        -- vystup => NEJAKY, -- simulace
        data0 => SW(0),
        data1 => SW(1),
        data2 => SW(2),
        data3 => SW(3),
        data4 => SW(4),
        data5 => SW(5),
        data6 => SW(6),
        data7 => SW(7),
        
        SW(2) => SW(13),
        SW(1) => SW(12),
        SW(0) => SW(11),
        vstup => JA(0),
        vystup => JB(0), -- implementace
        vysledek => sig_datap
        );
        
  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Disconnect the top four digits of the 7-segment display
  --AN(7 downto 4) <= b"1111";

end architecture behavioral;
