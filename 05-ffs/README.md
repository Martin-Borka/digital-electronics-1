# Lab 5: Martin Borka

### D & T Flip-flops

1. Screenshot with simulated time waveforms. Try to simulate both D- and T-type flip-flops in a single testbench with a maximum duration of 200 ns, including reset. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![image](https://user-images.githubusercontent.com/65703172/224847769-747eee70-b58b-418f-8e67-583e0c6fce50.png)



### JK Flip-flop

1. Listing of VHDL architecture for JK-type flip-flop. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture behavioral of jk_ff_rst is
    
    signal s_q : std_logic;
begin
    
    p_jk_ff_rst : process (clk)
    begin
        if rising_edge(clk) then
            if (rst = '1') then
                s_q <= '0';
                
            elsif (j ='0' and k='0') then
                s_q <= s_q;
                
            elsif (j ='1' and k='0') then
            	s_q <= '1';
               
            elsif (j ='0' and k='1') then
            	s_q <= '0';
            else
                s_q <= not s_q;
            end if;
        end if;
    end process p_jk_ff_rst;

    q     <= s_q;
    q_bar <= not s_q;
end architecture behavioral;
```

### Shift register

1. Image of the shift register `top` level schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![image](https://user-images.githubusercontent.com/65703172/224851908-73eff224-3302-42f6-8fb2-43cd5621f53f.png)
