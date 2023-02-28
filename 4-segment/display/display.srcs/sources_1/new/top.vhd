----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2023 12:13:48 PM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( SW : in STD_LOGIC_VECTOR (3 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0);
           CA : out STD_LOGIC;
           CB : out STD_LOGIC;
           CC : out STD_LOGIC;
           CD : out STD_LOGIC;
           CE : out STD_LOGIC;
           CF : out STD_LOGIC;
           CG : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           BTNC : in STD_LOGIC);
end top;

architecture Behavioral of top is

begin

  --------------------------------------------------------------------
  -- Instance (copy) of hex_7seg entity
  --------------------------------------------------------------------

  hex2seg : entity work.hex_7seg
    port map (
      blank  => BTNC,
      hex    => SW,
      seg(6) => CA,
      seg(5) => CB,

      -- WRITE YOUR CODE HERE
      seg(4) => CC,
      seg(3) => CD,
      seg(2) => CE,
      seg(1) => CF,
      seg(0) => CG
    );

  -- Connect one common anode to 3.3V
  AN <= b"1110_0111";

  -- Display input value on LEDs
  LED(3 downto 0) <= SW;

--------------------------------------------------------------------


-- Experiments on your own: LED(7:4) indicators

-- Turn LED(4) on if input value is equal to 0, ie "0000"
-- LED(4) <= `0` when WRITE YOUR CODE HERE
    if (SW = '0000') then
        LED(4) <= "1";
   
-- Turn LED(5) on if input value is greater than "1001", ie 10, 11, 12, ...
-- LED(5) <= WRITE YOUR CODE HERE
    
   if (SW > '1000') then
       LED(5) <= "1"; 

-- Turn LED(6) on if input value is odd, ie 1, 3, 5, ...
-- LED(6) <= WRITE YOUR CODE HERE
    
LED(6) <= SW(0);

-- Turn LED(7) on if input value is a power of two, ie 1, 2, 4, or 8
-- LED(7) <= WRITE YOUR CODE HERE

if (SW = '0001' OR SW = '0010' or SW = '0100' or SW = '1000') then
    LED(7) <= "1";


end architecture behavioral;


--end Behavioral;
