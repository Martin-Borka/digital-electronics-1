library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx is
    Port ( clk   : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data  : in  STD_LOGIC_VECTOR (7 downto 0);
           tx    : out STD_LOGIC);
end uart_tx;

architecture Behavioral of uart_tx is

    constant BIT_RATE : integer := 9600; -- 9.6 kbps (nastavenie baud rate)
    constant BAUD_CLK : integer := 100_000_000; -- 100 MHz

    signal count : integer range 0 to BAUD_CLK / BIT_RATE;
    signal tx_reg : std_logic;
    signal sig_en : std_logic;
    signal rst :    std_logic;
    

begin

  clk_en0 : entity work.clock_enable
    generic map (
      -- FOR SIMULATION, KEEP THIS VALUE TO 1
      -- FOR IMPLEMENTATION, CALCULATE VALUE: 250 ms / (1/100 MHz)
      -- 1   @ 10 ns
      -- ??? @ 250 ms
      g_MAX => 1
    )
    port map (
      clk => clk,
      rst => rst,
      ce  => sig_en
    );

    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            tx_reg <= '1'; -- start bit
        elsif rising_edge(clk) then
            if count = 0 then
                tx_reg <= '0'; -- data bit 0
                count <= count + 1;
            elsif count < 8 then
                tx_reg <= data(count - 1);
                count <= count + 1;
            elsif count = 8 then
                tx_reg <= '1'; -- stop bit
                count <= 0;
            end if;
        end if;
    end process;

    tx <= tx_reg;

end Behavioral;
