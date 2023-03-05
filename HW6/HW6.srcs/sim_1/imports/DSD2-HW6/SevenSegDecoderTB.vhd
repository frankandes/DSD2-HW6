library ieee;
use ieee.std_logic_1164.all;

entity Hw6Q4SevenSegSolnTB is
end Hw6Q4SevenSegSolnTB;

architecture tb of Hw6Q4SevenSegSolnTB is
    signal bin : std_logic_vector (3 downto 0) := (others => '0');
    signal leds : std_logic_vector (1 to 7);

    -- using unconstrained vectors in record
    -- sized determined in constant
    -- VHDL 2008 required
    type test_rec is record
        bin : std_logic_vector;
        leds : std_logic_vector;
    end record test_rec;
    type test_rec_array is array (integer range <>) of test_rec;
    constant test : test_rec_array := (
        ("0000", 7UX"7E"),
        ("0001", 7UX"30"),
        ("0010", 7UX"6D"),
        ("0011", 7UX"79"),
        ("0100", 7UX"33"),
        ("0101", 7UX"5B"),
        ("0110", 7UX"5F"),
        ("0111", 7UX"70"),
        ("1000", 7UX"7F"),
        ("1001", 7UX"7B"),
        ("1010", 7UX"77"),
        ("1011", 7UX"1F"),
        ("1100", 7UX"4E"),
        ("1101", 7UX"3D"),
        ("1110", 7UX"4F"),
        ("1111", 7UX"47")
    );
begin

    dut : entity work.seven_segment_decoder
    port map (bin => bin, leds => leds);

    stimuli : process
    begin
        for i in test'range loop
            bin <= test(i).bin;
            wait for 10 ns;
            assert leds = test(i).leds report "bin = " & to_hstring(bin) & " leds = " & to_hstring(leds) severity note;
        end loop;
        wait;
    end process;

end tb;
