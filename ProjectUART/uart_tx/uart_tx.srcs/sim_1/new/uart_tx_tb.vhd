library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity uart_tx_tb is
end uart_tx_tb;

architecture Behavioral of uart_tx_tb is

    constant CLK_PERIOD : time := 10 ns;

    signal clk   : std_logic := '0';
    signal reset : std_logic := '0';
    signal data  : std_logic_vector(7 downto 0) := (others => '0');
    signal tx    : std_logic;

begin

    dut : entity work.uart_tx
        port map (
            clk => clk,
            reset => reset,
            data => data,
            tx => tx
        );

    clk_proc : process
    begin
        while now < 10000 ns loop -- simulacia bezi 10 000 ns
            clk <= not clk;
            wait for CLK_PERIOD / 2;
        end loop;
        wait;
    end process;

    stimulus_proc : process
    begin
        reset <= '1';
        data <= (others => '0');
        wait for 100 ns;
        reset <= '0';
        
        loop
            data <= x"44"; -- 'D'
            wait for 100 ns;
            data <= x"45"; -- 'E'
            wait for 100 ns;
            data <= x"31"; -- '1'
            wait for 100 ns;
        end loop;
        
        wait;
    end process;

end Behavioral;
