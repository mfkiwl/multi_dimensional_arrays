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

use work.multi_array_types_pkg.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity multi_dimensional_array_top is
	generic (
			address_width : natural := 2;
			data_width : natural := 2
			);
    Port ( 
            clk : in std_logic;
            mem_array_data_in : in std_logic_vector(data_width-1 downto 0) := (others => '0');
            mem_array_address_in : in integer range 0 to (address_width**2)-1 := 0;
            mem_array_data_out : out std_logic_vector(data_width-1 downto 0) := (others => '0')
    		);
end multi_dimensional_array_top;

architecture Behavioral of multi_dimensional_array_top is

component multi_dimensional_array is
    generic (
            address_width : natural := 2;
            data_width : natural := 2
            );
    Port ( 
            clk : in std_logic;
            mem_array_data_in : in std_logic_vector(data_width-1 downto 0) := (others => '0');
            mem_array_address_in : in integer range 0 to (address_width**2)-1 := 0;
            mem_array_data_out : out std_logic_vector(data_width-1 downto 0) := (others => '0')
            );
end component;

    signal mem_array_data_in_s : std_logic_vector(data_width-1 downto 0) := (others => '0');


begin

--reg_proc : process
--begin
--    wait until rising_edge(clk);
--    mem_array_data_in_s <= mem_array_data_in;
--end process;

multi_dimensional_array_inst : multi_dimensional_array
    generic map(
            address_width => address_width, -- : natural := 4;
            data_width => data_width -- : natural := 4
            )
    Port map( 
            clk => clk, -- : in std_logic;
--            mem_array_data_in => mem_array_data_in_s,       -- : in std_logic_vector(data_width-1 downto 0) := (others => '0');
            mem_array_data_in => mem_array_data_in,       -- : in std_logic_vector(data_width-1 downto 0) := (others => '0');
            mem_array_address_in => mem_array_address_in, -- : in integer range 0 to (address_width**2)-1 := 0;
            mem_array_data_out => mem_array_data_out      -- : out std_logic_vector(data_width-1 downto 0) := (others => '0')
--            mem_array_data_out => mem_array_data_in_s      -- : out std_logic_vector(data_width-1 downto 0) := (others => '0')
            );

--reg_proc : process
--begin
--    wait until rising_edge(clk);
--    mem_array_data_out <= mem_array_data_in_s;
--end process;


end Behavioral;
