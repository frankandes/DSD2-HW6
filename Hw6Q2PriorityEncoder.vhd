library ieee;
use ieee.std_logic_1164.all;

entity Hw6Q2PriorityEncoder is
    port (
        w : in std_logic_vector(7 downto 0);
        y : out std_logic_vector(2 downto 0)
    );
end Hw6Q2PriorityEncoder;

architecture Behavioral of Hw6Q2PriorityEncoder is
begin
    case_proc : process(w) is begin
        case w is
            when "00000001" => y <= "000";
            when "00000010" => y <= "001";
            when "00000100" => y <= "010";
            when "00001000" => y <= "011";
            when "00010000" => y <= "100";
            when "00100000" => y <= "101";
            when "01000000" => y <= "110";
            when others => y <= "111";
        end case;
    end process case_proc;
end Behavioral;