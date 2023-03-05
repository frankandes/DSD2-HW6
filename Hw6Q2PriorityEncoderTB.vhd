library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity Hw6Q2PriorityEncoderTB is
end Hw6Q2PriorityEncoderTB;

architecture Behavioral of Hw6Q2PriorityEncoderTB is
    signal w : std_logic_vector(7 downto 0);
    signal y : std_logic_vector(2 downto 0);

begin
    dut : entity work.Hw6Q2PriorityEncoder
    port map (
        w => w, y => y
    );

    stimuli : process
        -- use the unsigned type when doing math, requires numericstd library
            variable test_vector: unsigned(7 downto 0) := "00000001";
            variable test_result: unsigned(2 downto 0) := "000";
        begin
            for i in 0 to 7 loop
                -- variables can be assigned to signals
                -- unsigned is simply converted to std_logic_vector
                w <= std_logic_vector(test_vector);
                wait for 10 ns;
                test_vector := shift_left(test_vector, 1);
                
                assert y = std_logic_vector(test_result)
                report "error, expected y = " & to_hstring(test_result) &
                "actual value is = " & to_hstring(y);
                test_result := test_result + 1;
                wait for 10 ns;
            end loop;
            wait;
        end process;
    end tb;
