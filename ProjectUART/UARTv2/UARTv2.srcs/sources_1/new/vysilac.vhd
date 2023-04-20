
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity vysilac is
    Port ( prepinac : in STD_LOGIC;
           clk      : in STD_LOGIC;
           rst      : in STD_LOGIC;
           vystup   : out STD_LOGIC;
           led      : out STD_LOGIC_VECTOR(7 downto 0);
           data     : in  STD_LOGIC_VECTOR(7 downto 0);           
           SW       : in STD_LOGIC_VECTOR(2 downto 0);
           vstup    : in STD_LOGIC;
           vysledek : out STD_LOGIC_VECTOR(7 downto 0)
           
           );
end vysilac;

architecture behavioral of vysilac is

    
    signal znak   : STD_LOGIC_VECTOR(7 downto 0);
    -- Internal clock enable
    signal sig_en_2ms : std_logic;
    -- Internal 2-bit counter for multiplexing 4 digits
    signal sig_cnt_4bit : std_logic_vector(3 downto 0);
    -- Internal 4-bit value
    signal sig_hex : std_logic;
        -- vnitrni propojeni nastaveni rychlosti
    --signal clock_set : natural;
       -- povoleni clock_enable_rx pro rx vzdy zaple, tx vzdy nutno zapnout
    signal sig_cerx_en : std_logic;
    -- Interní reset
    signal sig_rst_cnt : std_logic;
    signal sig_rx_cnt : std_logic := '0';
   -- signal vysledek : std_logic_vector(7 downto 0);

begin
 -------------------------------------------------------------------------------------------------
clk_1 : entity work.clk_v
    port map (
      clk => clk,-- WRITE YOUR CODE HERE
      rst => rst,-- WRITE YOUR CODE HERE
      ce  => sig_en_2ms,
     -- max => clock_set
       max => 10417
    );


bin_cnt0 : entity work.cnt_v
    generic map (
      g_CNT_WIDTH => 4-- WRITE YOUR CODE HERE
    )
    port map (
      clk => clk,-- WRITE YOUR CODE HERE
      rst => rst,
      en => sig_en_2ms,
      cnt_up => '0',
      cnt => sig_cnt_4bit
    );

vysilac : process (clk) is
  begin
   if(rising_edge(clk)) then
         led <= SW;
        
            if (prepinac = '1') then
            report "sig_cerx_en nastaven na 1";
            znak    <= data;

            case sig_cnt_4bit is
                when "1111" =>  --f
                    vystup <= '1';
                
                when "1110" => -- e
                    vystup <= '0';

                when "1101" => -- d
                    vystup <= znak(0);
          
                when "1100" => -- c
                    vystup <= znak(1);
          
                when "1011" => -- b
                    vystup <= znak(2);
          
                when "1010" => -- a
                    vystup <= znak(3);

                when "1001" => -- 9
                    vystup <= znak(4);
                
                when "1000" => -- 8
                    vystup <= znak(5);
                
                when "0111" =>  -- 7
                    vystup <= znak(6);
                
                when "0110" => -- 6
                    vystup <= znak(7);
                    
                when "0101" => -- 5
                    vystup <= '1';
                
                when "0000" => -- 0
                    vystup <= '1';
                
                when others =>
                    vystup <= '1';

            end case;
        end if;
    end if;
 end process vysilac;

end architecture behavioral;