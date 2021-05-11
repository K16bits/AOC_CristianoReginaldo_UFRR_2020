library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;

entity unidadeDControle is port(
    clockControle: in std_logic;
    entrada4bits: in std_logic_vector(3 downto 0);
    opULA:     out std_logic_vector(3 downto 0);
    origULA: out std_logic;
    memLer: out std_logic;
    memEsc: out std_logic;
    mem_para_reg: out std_logic;
    regEsc: out std_logic;
    dvc: out std_logic;
    jump:   out std_logic
);
end entity;

architecture behavior of unidadeDControle is
begin
    process(clockControle)
    begin 
        if(clockControle = '1') then -------- ADD
                if entrada4bits = "0000" then 
                    opULA        <= "0000";
                    origULA      <= '0';
                    memLer       <= '0';
                    memEsc       <= '0';
                    mem_para_reg <= '0';
                    regEsc       <= '1';
                    dvc          <= '0';
                    jump         <= '0';
                end if;

                if entrada4bits = "0001" then ---------SUB
                    opULA        <= "0001";
                    origULA      <= '0';
                    memLer       <= '0';
                    memEsc       <= '0';
                    mem_para_reg <= '0';
                    regEsc       <= '1';
                    dvc          <= '0';
                    jump         <= '0';
                end if;

                if entrada4bits = "0010" then --------- SW - STORE WORD
                    opULA        <= "0100";
                    origULA      <= '0';
                    memLer       <= '0';
                    memEsc       <= '1';
                    mem_para_reg <= '0';
                    regEsc       <= '0';
                    dvc          <= '0';
                    jump         <= '0';
                end if;
        end if;
        end process;
end behavior;