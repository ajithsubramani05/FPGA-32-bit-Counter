library IEEE;
use IEEE.std_logic_1164.all;

entity counter_tb is
end counter_tb;

architecture arch of counter_tb is

    constant CLOCK_PERIOD : time := 16 ns;

    signal clk   : std_logic := '0';
    signal rst   : std_logic := '0';
    signal count : std_logic_vector(31 downto 0);

begin

    counter_inst: entity work.counter
        port map (
            clk   => clk,
            rst   => rst,
            count => count
        );

    clk_process : process
    begin
        while true loop
            clk <= '0';
            wait for CLOCK_PERIOD / 2;
            clk <= '1';
            wait for CLOCK_PERIOD / 2;
        end loop;
    end process clk_process;

    rst_process : process
    begin
        rst <= '1';
        wait for CLOCK_PERIOD * 2;
        rst <= '0';
        wait;
    end process rst_process;

end arch;
