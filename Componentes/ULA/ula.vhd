library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;

entity ula is port (
    entradaA : in std_logic_vector(7 downto 0);
    entradaB : in std_logic_vector(7 downto 0);
    opULA : in std_logic_vector(1 downto 0);
    zero : out std_logic;
    resultado : out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of ula is 
begin
    process(entradaA,entradaB,opULA)
    begin
        case opULA is
            when "00" => resultado <= entradaA + entradaB;
            when "01" => resultado <= entradaA - entradaB;
            when others => resultado <= "00000000";
        end case;
    end process;
end behavior;