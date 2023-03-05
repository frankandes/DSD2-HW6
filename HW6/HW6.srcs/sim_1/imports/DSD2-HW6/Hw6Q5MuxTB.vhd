library ieee;
use ieee.std_logic_1164.all;

entity Hw6Q5MuxTB is
end Hw6Q5MuxTB;

architecture tb of Hw6Q5MuxTB is
    signal shift_amt : std_logic_vector(2 downto 0) := (others => '0');
    signal y : std_logic_vector(15 downto 0);

    -- this record is constrained
    -- the index ranges are given
    type test_rec is record
        shift_amt : std_logic_vector(2 downto 0);
        y : std_logic_vector(15 downto 0);
    end record test_rec;
    type test_rec_array is array(7 downto 0) of test_rec;
    constant test : test_rec_array := (
        ("000", X"1234"),
        ("001", X"2345"),
        ("010", X"3456"),
        ("011", X"4567"),
        ("100", X"5678"),
        ("101", X"6789"),
        ("110", X"789A"),
        ("111", X"89AB")
    );
begin

    dut : entity work.Hw6Q5Mux
        port map (shift_amt => shift_amt, y => y);
    
    stimuli : process
    begin
        for i in test'range loop
            shift_amt <= test(i).shift_amt;
            wait for 10 ns;
            assert (test(i).y = y) report "error in result. y is " &
                to_hstring(y) & " and should be = " &
                to_hstring(test(i).y) & " when the shift amount is = " &
                to_hstring(test(i).shift_amt);
            wait for 10 ns;
        end loop;
        wait;
    end process;
    
end tb;
