library IEEE;
use IEEE.std_logic_1164.all;

entity multiplexer is port(
    entrada_0 : in std_logic;
    entrada_1 : in std_logic;
    sel : in std_logic;
    saida : out std_logic
);
end multiplexer;

architecture Behavior of multiplexer is 
begin
    process(sel,entrada_0,entrada_1)
    begin
        case sel is 
            when '0' => saida <= entrada_0;
            when '1' => saida <= entrada_1;
        end case;
    end process;
end Behavior;