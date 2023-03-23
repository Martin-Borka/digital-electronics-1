

# Lab 7: Marti Borka

### Display driver

1. Listing of VHDL code of the completed process `p_mux`. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
    --------------------------------------------------------
    -- p_mux:
    -- A sequential process that implements a multiplexer for
    -- selecting data for a single digit, a decimal point 
    -- signal, and switches the common anodes of each display.
    --------------------------------------------------------
    p_mux : process(clk)
    begin
        if rising_edge(clk) then
            if (reset = '1') then
                s_hex <= data0_i;
                dp_o  <= dp_i(0);
                dig_o <= "1110";
            else
                case sig_cnt_2bit is

          when "11" =>
            sig_hex <= data3;
            dp      <= dp_vect(3);
            dig     <= "0111";

          when "10" =>
            -- DEFINE ALL OUTPUTS FOR "10" HERE
            sig_hex <= data2;
            dp      <= dp_vect(2);
            dig     <= "1011";

          when "01" =>
            -- DEFINE ALL OUTPUTS FOR "01" HERE
             sig_hex <= data1;
            dp      <= dp_vect(1);
            dig     <= "1101";
          when others =>
            -- DEFINE ALL OUTPUTS FOR "00" HERE
            sig_hex <= data0;
            dp      <= dp_vect(0);
            dig     <= "1110";
        end case;
            end if;
        end if;
    end process p_mux;
```

2. Screenshot with simulated time waveforms. Test reset as well. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

  ![image](https://user-images.githubusercontent.com/65703172/226669003-11bfb624-d21d-4ea2-8aca-a4953e23f0de.png)


### Eight-digit driver

1. Image of the 8-digit driver's block schematic. The image can be drawn on a computer or by hand. Always name all inputs, outputs, components, and internal signals!

   ![image](https://user-images.githubusercontent.com/65703172/227161273-8524ceb6-3cc9-41a8-91ca-3e34f5c84173.png)
   
   
   
   
## Pre-Lab preparation

A common way to control multiple displays is to gradually switch between them. We control (connect to supply voltage) only one of the displays at a time, as can be seen [here](https://engineeringtutorial.com/seven-segment-display-working-principle/).

Due to the physiological properties of human vision, it is necessary that the time required to display the whole value is a maximum of 16&nbsp;ms. If we display four digits, then the duration of one of them is 4&nbsp;ms. If we display eight digits, the time is reduced to 2&nbsp;ms, etc.

1. See [schematic](https://github.com/tomas-fryza/Digital-electronics-1/blob/master/docs/nexys-a7-sch.pdf) or [reference manual](https://reference.digilentinc.com/reference/programmable-logic/nexys-a7/reference-manual) of the Nexys A7 board, find out the connection of 7-segment displays, and complete the signal timing to display four-digit value `3.142`.

  ![https://lastminuteengineers.com/seven-segment-arduino-tutorial/](../04-segment/images/7-Segment-Display-Number-Formation-Segment-Contol.png)

  ![Timing of seven-segment display](images/wavedrom_7-segment.png)

  > The figure above was created in [WaveDrom](https://wavedrom.com/) digital timing diagram online tool. The figure source code is as follows:
  >
  
![image](https://user-images.githubusercontent.com/65703172/226577424-8fce597f-90e4-4c34-bd99-de1d02788bbe.png)
