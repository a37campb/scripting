library ieee;
use ieee.std_logic_1164.all;

entity sum is
       port ( i_a, i_b, i_cin : in std_logic;
              o_sum :       out std_logic
       );
end sum;

architecture main of sum is

  -- insert your code here 
begin
       sum : process( i_a,i_b,i_cin )
       begin
              o_sum <= i_a xor i_b xor i_cin;
       end process ; -- sum
end architecture;
