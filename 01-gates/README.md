# Lab 1: INSERT_YOUR_FIRSTNAME INSERT_YOUR_LASTNAME

### De Morgan's laws

1. Equations of all three versions of logic function f(c,b,a):

   
![CodeCogsEqn (1)](https://user-images.githubusercontent.com/65703172/217299737-bb1e3832-5f49-4131-90f3-97b083991864.svg)


2. Listing of VHDL architecture from design file (`design.vhd`) for all three functions. Always use syntax highlighting, meaningful comments, and follow VHDL guidelines:

```vhdl
architecture dataflow of gates is
begin
    f_orig_o <= (not(b_i) and a_i) or (c_i and not(b_i or not(a_i)));
    f_nand_o <= not(not(not(b_i) and a_i) and not( c_i and not b_i and a_i));--b_i nand a_i; -- MODIFY THIS FUNCTION
    f_nor_o  <= not((b_i) or not(a_i)) or not (not(c_i) or ((b_i) or not(a_i))) ;  -- MODIFY THIS FUNCTION
end architecture dataflow;
```

3. Complete table with logic functions' values:

   | **c** | **b** |**a** | **f_ORIG** | **f_(N)AND** | **f_(N)OR** |
   | :-: | :-: | :-: | :-: | :-: | :-: |
   | 0 | 0 | 0 | 0 | 0 | 0 |
   | 0 | 0 | 1 | 1 | 1 | 1 |
   | 0 | 1 | 0 | 0 | 0 | 0 |
   | 0 | 1 | 1 | 0 | 0 | 0 |
   | 1 | 0 | 0 | 0 | 0 | 0 |
   | 1 | 0 | 1 | 1 | 1 | 1 |
   | 1 | 1 | 0 | 0 | 0 | 0 |
   | 1 | 1 | 1 | 0 | 0 | 0 |


### Distributive laws

1. Screenshot with simulated time waveforms. Always display all inputs and outputs (display the inputs at the top of the image, the outputs below them) at the appropriate time scale!

![image](https://user-images.githubusercontent.com/65703172/217294731-6bf6730f-7b48-46f6-aad4-0bde68934b9c.png)


2. Link to your public EDA Playground example:

   [https://www.edaplayground.com/...](https://www.edaplayground.com/x/JPgi)
