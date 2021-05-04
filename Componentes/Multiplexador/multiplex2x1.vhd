library IEEE;
use IEEE.std_logic_1164.all;

entity multiplex2x1 is 
port(
    A,B : in std_logic_vector(1 downto 0);
    Sel: in std_logic;
    S : out std_logic_vector(1 downto 0)
);
end entity;

architecture behavior of multiplex2x1 is
    begin
        process (Sel,A,B)
        begin
            case Sel is
                when '0' => S <= A;
                when '1' => S <= B;
            end case;
        end process;
    end behavior;