library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity tt_um_loop_mackman18 is
    port (
        ui_in   : in  std_logic_vector(7 downto 0);
        uo_out  : out std_logic_vector(7 downto 0);
        uio_in  : in  std_logic_vector(7 downto 0);
        uio_out : out std_logic_vector(7 downto 0);
        uio_oe  : out std_logic_vector(7 downto 0);
        ena     : in  std_logic;
        clk     : in  std_logic;
        rst_n   : in  std_logic
    );
    
end tt_um_loop_mackman18;


architecture Behavioral of tt_um_loop_mackman18 is 
    signal counter : unsigned(7 downto 0) := (others => '0');
    signal number : unsigned(7 downto 0) := (others => '0');
begin

    --output = "11111100";
    --uo_out <= output;
    --uo_out <= std_logic_vector(unsigned(ui_in) + unsigned(uio_in));
    --uo_out <= not (ui_in and uio_in);

    uio_out <= "00000000";
    uio_oe <= "00000000";
    --uo_out <= std_logic_vector(counter);
    uo_out <= std_logic_vector(number);


    process(clk)
    begin
        if rising_edge(clk) then
            if counter = 9 and ui_in(0) = '0' then
                counter <= (others => '0');
            elsif counter = 0 and ui_in(0) = '1' then
                counter <= "00001001";
            elsif ui_in(0) = '0' then
                counter <= counter + 1;
            elsif ui_in(0) = '1' then
                counter <= counter - 1;
            end if;

            if counter = 0 then
                number <= "11111100";
            elsif counter = 1 then
                number <= "01100000";
            elsif counter = 2 then
                number <= "11011010";
            elsif counter = 3 then
                number <= "11110010";
            elsif counter = 4 then
                number <= "01100110";
            elsif counter = 5 then
                number <= "10110110";
            elsif counter = 6 then
                number <= "10111110";
            elsif counter = 7 then
                number <= "11100000";
            elsif counter = 8 then
                number <= "11111110";
            elsif counter = 9 then
                number <= "11100110";
            end if;
        end if;
    end process;


end Behavioral;

