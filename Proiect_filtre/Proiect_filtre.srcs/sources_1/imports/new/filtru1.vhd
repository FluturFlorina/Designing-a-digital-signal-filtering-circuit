----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2023 07:30:09 PM
-- Design Name: 
-- Module Name: filtru1 - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity filtru1 is --Filtrul ce ajusteaza luminozitatea/contrastul imaginilor
Port 
( 
signal currPixelValue:in std_logic_vector(7 downto 0);
signal brightness:in std_logic_vector(7 downto 0);
signal sel:in std_logic;
signal newPixelValue:out std_logic_vector(7 downto 0)
);
end filtru1;

architecture Behavioral of filtru1 is

signal valoare:std_logic_vector(7 downto 0):= x"FF"; --255

begin

process(sel,currPixelValue,brightness)
begin
        if sel='0' then
            newPixelValue <=  valoare  + (not currPixelValue) + "1";
        elsif sel='1' then
            newPixelValue <= brightness + currPixelValue;
        else
            newPixelValue <= (others => '0');
    end if;
end process;

end Behavioral;
