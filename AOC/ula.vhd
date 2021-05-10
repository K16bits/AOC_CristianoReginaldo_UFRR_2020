library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity ula is port (
    clockULA : in std_logic;
    entradaA : in std_logic_vector(7 downto 0);
    entradaB : in std_logic_vector(7 downto 0);
    opULA : in std_logic_vector(3 downto 0);
    zero : out std_logic;
    resultado : out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of ula is 
begin
    process(clockULA)
    begin
        case opULA is
            when "0000" => resultado <= entradaA + entradaB;
            when "0001" => resultado <= entradaA - entradaB;
            when others => resultado <= "00000000";
        end case;
    end process;
end behavior;