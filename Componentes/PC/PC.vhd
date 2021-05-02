library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity PC is port (
    clock: in std_logic;
    entrada: in std_logic_vector(7 downto 0);
    saida: out std_logic_vector(7 downto 0)
);
end PC;

architecture Behavior of PC is 
begin
    process(clock,entrada)
    begin
        if rising_edge(clock) then
            saida <= entrada;
        end if;
    end process;
end Behavior;