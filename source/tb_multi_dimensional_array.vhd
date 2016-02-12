----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.02.2016 18:36:39
-- Design Name: 
-- Module Name: multi_dimensional_array - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

use work.types.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--package types is
--	type mem_array_t is
--		array (natural range <>, natural range <>)  of std_logic;
--end package types;

entity tb_multi_dimensional_array is
    generic (
            address_width : natural := 4;
            data_width : natural := 4
            );
end tb_multi_dimensional_array;

architecture Behavioral of tb_multi_dimensional_array is

component multi_dimensional_array is
    generic (
            address_width : natural := 4;
            data_width : natural := 4
            );
    Port ( 
            clk : in std_logic;
            mem_array_data_in : in std_logic_vector(data_width-1 downto 0) := (others => '0');
            mem_array_address_in : in integer range 0 to (address_width**2)-1 := 0;
            mem_array_data_out : out std_logic_vector(data_width-1 downto 0) := (others => '0')
            );
end component;

signal clk : std_logic := '0';
constant TIME_PERIOD_CLK : time := 1 ns;
signal stop_clks : boolean := FALSE;
signal test_pass : boolean := FALSE;

signal mem_array_data_in : std_logic_vector(data_width-1 downto 0) := (others => '0');
signal mem_array_address_in : integer range 0 to (address_width**2)-1 := 0;
signal mem_array_data_out : std_logic_vector(data_width-1 downto 0) := (others => '0');

begin

clk_gen_proc : process
begin
    while not stop_clks loop
        wait for TIME_PERIOD_CLK/2;
        clk <= not clk;
    end loop;
    wait;
end process;

dut : multi_dimensional_array
    generic map(
            address_width => address_width, -- : natural := 4;
            data_width => data_width -- : natural := 4
            )
    Port map( 
            clk => clk,                                   -- : in std_logic;
            mem_array_data_in => mem_array_data_in,       -- : in std_logic_vector(data_width-1 downto 0) := (others => '0');
            mem_array_address_in => mem_array_address_in, -- : in integer range 0 to (address_width**2)-1 := 0;
            mem_array_data_out => mem_array_data_out      -- : out std_logic_vector(data_width-1 downto 0) := (others => '0')
            );

process
begin
--    for i in mem_array_address_in'RANGE loop
    for i in 0 to (address_width**2)-1 loop
        wait until rising_edge(clk);
        mem_array_data_in <= std_logic_vector(to_unsigned(i,mem_array_data_in'LENGTH));
        mem_array_address_in <= i;
        wait until rising_edge(clk);
        if (mem_array_data_out = mem_array_data_in) then test_pass <= TRUE; else test_pass <= FALSE; end if;
    end loop;
    stop_clks <= TRUE;
    wait;
end process;

end Behavioral;
