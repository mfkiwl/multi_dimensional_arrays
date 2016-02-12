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

entity multi_dimensional_array is
	generic (
			address_width : natural := 4;
			data_width : natural := 4
			);
    Port ( 
    		clk : in STD_LOGIC;
            write_en : in std_logic := '0';
            mem_array_data_in : in std_logic_vector(data_width-1 downto 0) := (others => '0');
            mem_array_address_in : in std_logic_vector(address_width-1 downto 0) := (others => '0');
            mem_array_data_out : out std_logic_vector(data_width-1 downto 0) := (others => '0')
    		);
end multi_dimensional_array;

architecture Behavioral of multi_dimensional_array is

signal mem_array_s : mem_array_t(address_width-1 downto 0, data_width-1 downto 0) := (others => (others => '0'));

begin

process
begin
    wait until rising_edge(clk);
    for i in data_width-1 downto 0 loop
        mem_array_data_out(i) <= mem_array_s(to_integer(unsigned(mem_array_address_in)),i);
    end loop;
    if write_en = '1' then
        for i in data_width-1 downto 0 loop
            mem_array_s(to_integer(unsigned(mem_array_address_in)),i) <= mem_array_data_in(i);
        end loop;
    end if;
end process;

end Behavioral;
