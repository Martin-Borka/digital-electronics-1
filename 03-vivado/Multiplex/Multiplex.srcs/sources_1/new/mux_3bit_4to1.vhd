----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/21/2023 12:15:36 PM
-- Design Name: 
-- Module Name: mux_3bit_4to1 - Behavioral
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

entity mux_3bit_4to1 is
 Port ( 
        sel        : in  std_logic_vector((2-1) downto 0);
        a          : in  std_logic_vector((3-1) downto 0);
        b          : in  std_logic_vector((3-1) downto 0);
        c          : in  std_logic_vector((3-1) downto 0);
        d          : in  std_logic_vector((3-1) downto 0);
        y          : out std_logic_vector((3-1) downto 0)
);
end mux_3bit_4to1;

architecture Behavioral of mux_3bit_4to1 is

begin

y <=    a when (sel = "00" ) else
        b when (sel = "01" ) else
        c when (sel = "10" ) else
        d when (sel = "11" );


end Behavioral;
