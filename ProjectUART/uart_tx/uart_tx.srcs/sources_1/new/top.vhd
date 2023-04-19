

library ieee;
  use ieee.std_logic_1164.all;

----------------------------------------------------------
-- Entity declaration for top level
----------------------------------------------------------

entity top is
  port (
    CLK100MHZ : in    std_logic; --! Main clock
    SW        : in    std_logic_vector(7 downto 0); --! data values
    JA        : out   std_logic; --! vysilac 
    BTNC      : in    std_logic; --! Synchronous reset
    LED       : out   std_logic_vector(7 downto 0)
  );
end entity top;

----------------------------------------------------------
-- Architecture body for top level
----------------------------------------------------------

architecture behavioral of top is

  -- No internal signals are needed today:)

begin

  --------------------------------------------------------
  -- Instance (copy) of driver_7seg_4digits entity
  --------------------------------------------------------
  driver_seg_4 : entity work.uart_tx
    port map (
      clk      => CLK100MHZ,
      reset    => BTNC,
      tx       => JA,
      data(7 downto 0)     => SW(7 downto 0)
      
  

    );


    LED(0) <= '1' when (SW(0) = '1') else '0';
    LED(1) <= '1' when (SW(1) = '1') else '0';
    LED(2) <= '1' when (SW(2) = '1') else '0';
    LED(3) <= '1' when (SW(3) = '1') else '0';
    LED(4) <= '1' when (SW(4) = '1') else '0';
    LED(5) <= '1' when (SW(5) = '1') else '0';
    LED(6) <= '1' when (SW(6) = '1') else '0';
    LED(7) <= '1' when (SW(7) = '1') else '0';
  --------------------------------------------------------
  -- Other settings
  --------------------------------------------------------
  -- Disconnect the top four digits of the 7-segment display
  --AN(7 downto 4) <= b"1111";

end architecture behavioral;