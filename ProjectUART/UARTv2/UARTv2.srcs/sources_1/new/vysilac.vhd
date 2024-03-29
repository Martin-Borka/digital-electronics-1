
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity vysilac is
    Port ( prepinac : in STD_LOGIC;
           clk      : in STD_LOGIC;
           rst      : in STD_LOGIC;
           vystup   : out STD_LOGIC;
           data     : in  STD_LOGIC_VECTOR(7 downto 0);           
           SW       : in STD_LOGIC_VECTOR(7 downto 0);
           vysledek : out STD_LOGIC_VECTOR(7 downto 0)
           
           );
end vysilac;

architecture behavioral of vysilac is

    
    signal znak   : STD_LOGIC_VECTOR(7 downto 0);
    signal sig_en_2ms : std_logic;
    
    signal sig_cnt_4bit : std_logic_vector(3 downto 0);
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
        
            if (prepinac = '1') then
            znak    <= data;

            case sig_cnt_4bit is
                when "1111" => 
                    vystup <= '1';
                
                when "1110" => 
                    vystup <= '0';

                when "1101" => 
                    vystup <= znak(0);
          
                when "1100" => 
                    vystup <= znak(1);
          
                when "1011" => 
                    vystup <= znak(2);
          
                when "1010" =>
                    vystup <= znak(3);

                when "1001" =>
                    vystup <= znak(4);
                
                when "1000" => 
                    vystup <= znak(5);
                
                when "0111" => 
                    vystup <= znak(6);
                
                when "0110" =>
                    vystup <= znak(7);
                    
                when "0101" => 
                    vystup <= '1';
                
                when others =>
                    vystup <= '1';

            end case;
        end if;
    end if;
 end process vysilac;

end architecture behavioral;