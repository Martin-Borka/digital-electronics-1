# Lab 6: Martin Borka

### Bidirectional counter

1. Listing of VHDL code of the completed process `p_cnt_up_down`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_cnt_up_down:
    -- Clocked process with synchronous reset which implements
    -- n-bit up/down counter.
    --------------------------------------------------------
    p_cnt_up_down : process(clk)
    begin
        if rising_edge(clk) then
        
            if (reset = '1') then                   -- Synchronous reset
                s_cnt_local <= (others => '0');     -- Clear all bits

            elsif (en_i = '1') then -- Test if counter is enabled

                 if (cnt_up_i = '1') then           --up
                    s_cnt_local <= s_cnt_local + 1;
                    
                elsif (cnt_up_i = '0') then         --down
                    s_cnt_local <= s_cnt_local - 1;

                    s_cnt_local <= s_cnt_local + 1;
            end if;
        end if;
    end process p_cnt_up_down;
```

2. Screenshot with simulated time waveforms. Test: (a) reset, (b) counter direction, (c) enable. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

   ![image](https://user-images.githubusercontent.com/65703172/226442365-6aee7a7f-87c7-4cb6-bdf3-ab457208400c.png)

### Two counters

1. Image of the top layer structure including both counters, ie a 4-bit bidirectional counter from *Part 4* and a 10-bit counter with a 10 ms time base from *Experiments on your own*. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components and internal signals!

   ![image](https://user-images.githubusercontent.com/65703172/226349306-d6e6782c-27d1-4619-99eb-8f7145fa4821.png)

