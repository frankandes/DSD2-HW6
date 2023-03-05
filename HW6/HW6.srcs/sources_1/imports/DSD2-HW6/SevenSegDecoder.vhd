
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity seven_segment_decoder is
port(
    bin : in std_logic_vector(3 downto 0);
    leds : out std_logic_vector(6 downto 0)
);
end seven_segment_decoder;

architecture Behavioral of seven_segment_decoder is
begin
    leds <= "1111110" when bin = "0000" else
           "0110000" when bin = "0001" else
           "1101101" when bin = "0010" else
           "1111001" when bin = "0011" else
           "0110011" when bin = "0100" else
           "1011011" when bin = "0101" else
           "1011111" when bin = "0110" else
           "1110000" when bin = "0111" else
           "1111111" when bin = "1000" else
           "1111011" when bin = "1001" else
           "1110111" when bin = "1010" else
           "0011111" when bin = "1011" else
           "1001110" when bin = "1100" else
           "0111101" when bin = "1101" else
           "1001111" when bin = "1110" else
           "1000111" when bin = "1111" else
           "1111111";
end Behavioral;