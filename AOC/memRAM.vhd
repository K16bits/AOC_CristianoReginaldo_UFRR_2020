library IEEE;
use IEEE.std_logic_1164.all;
USE ieee.numeric_std.ALL;

entity memRAM is port(
    clock: in std_logic;
    endereco : in std_logic_vector(7 downto 0);
    escritaDado : in std_logic_vector(7 downto 0);
    memLer : in std_logic;
    memEsc : in std_logic;
    saidaLeituraDado : out std_logic_vector(7 downto 0)
);
end entity;

architecture behavior of memRAM is
    type memoriaRAM is array (0 downto 7) of std_logic_vector(7 downto 0);
    signal ram : memoriaRAM := (others => "00000000");
begin
    process(clock)
    begin
        if rising_edge(clock) then
            if(memLer = '1') then
                saidaLeituraDado <= ram(to_integer(unsigned(endereco)));
                end if;
                
            if(memEsc = '1') then
                ram(to_integer(unsigned(endereco))) <= escritaDado;
                end if;
        end if;
    end process;
end behavior;