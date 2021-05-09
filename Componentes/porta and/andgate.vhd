library IEEE;
use IEEE.std_logic_1164.all;

entity andgate is 
port(
    A_in : in std_logic;
    B_in : in std_logic;
    S : out std_logic
);
end entity;

architecture behavior of andgate is
    begin
        S <= A_in and B_in;
    end behavior;