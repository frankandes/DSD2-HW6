library ieee;
use ieee.std_logic_1164.ALL;
use ieee.numeric_std.all;

entity Hw6Q5Mux is
    port (
        shift_amt: in std_logic_vector(1 downto 0);
        y: out std_logic_vector(7 downto 0)
    );
end Hw6Q5Mux;

architecture oh_behavior of Hw6Q5Mux is
    -- create an array of vectors to hold each of the shifters
    type shifty_array is array (7 downto 0) of std_logic_vector(15 downto 0);
    signal y_array: shifty_array := (x"89AB", x"789A", x"6789", x"5678", x"4567", x"3456", x"2345", x"1234");
begin
    y <= y_array(to_integer(unsigned(shift_amt)));
end oh_behavior;