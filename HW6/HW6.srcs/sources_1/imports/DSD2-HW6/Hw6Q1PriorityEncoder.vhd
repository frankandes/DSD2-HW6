library ieee;
use ieee.std_logic_1164.all;

entity Hw6Q1PriorityEncoder is
    port (
        w : in std_logic_vector (3 downto 0);
        y : out std_logic_vector (1 downto 0)
    );
end entity Hw6Q1PriorityEncoder;

architecture obehavior of Hw6Q1PriorityEncoder is
begin
    if_proc : process(w) is begin
        if w = "0001" then
            y <= "00";
        elsif w = "0010" then
            y <= "01";
        elsif w = "0100" then
            y <= "10";
        else
            y <= "11";
        end if;
    end process;
end obehavior;
