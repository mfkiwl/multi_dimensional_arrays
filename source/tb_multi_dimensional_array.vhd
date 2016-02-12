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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

--package types is
--	type mem_array_t is
--		array (natural range <>, natural range <>)  of std_logic;
--end package types;

entity tb_multi_dimensional_array is
end tb_multi_dimensional_array;

architecture Behavioral of tb_multi_dimensional_array is

component tb_multi_dimensional_array is
    generic (
            address_width : natural := 2;
            data_width : natural := 4
            );
    Port ( 
            clk : in STD_LOGIC;
            mem_array_in : in mem_array_t(0 to address_width-1, data_width-1 downto 0) := (others => (others => '0'));
            mem_array_out : out mem_array_t(0 to address_width-1, data_width-1 downto 0) := (others => (others => '0'))
            );
end component;

signal clk : std_logic := '0';

begin

clk_gen_proc : process
begin
    while not stop_clks loop
        wait for TIME_PERIOD_CLK/2;
        clk <= not clk;
    end loop;
    wait;
end process;

process
begin
    wait until rising_edge(clk);
    mem_array_out <= mem_array_in;
end process;

end Behavioral;
