-- Copyright (C) 2020  Intel Corporation. All rights reserved.
-- Your use of Intel Corporation's design tools, logic functions 
-- and other software and tools, and any partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Intel Program License 
-- Subscription Agreement, the Intel Quartus Prime License Agreement,
-- the Intel FPGA IP License Agreement, or other applicable license
-- agreement, including, without limitation, that your use is for
-- the sole purpose of programming logic devices manufactured by
-- Intel and sold by Intel or its authorized distributors.  Please
-- refer to the applicable agreement for further details, at
-- https://fpgasoftware.intel.com/eula.

-- *****************************************************************************
-- This file contains a Vhdl test bench with test vectors .The test vectors     
-- are exported from a vector file in the Quartus Waveform Editor and apply to  
-- the top level entity of the current Quartus project .The user can use this   
-- testbench to simulate his design using a third-party simulation tool .       
-- *****************************************************************************
-- Generated on "05/11/2021 00:04:42"
                                                             
-- Vhdl Test Bench(with test vectors) for design  :          main
-- 
-- Simulation tool : 3rd Party
-- 

LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY main_vhd_vec_tst IS
END main_vhd_vec_tst;
ARCHITECTURE main_arch OF main_vhd_vec_tst IS
-- constants                                                 
-- signals                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL opcodeteste : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL teste : STD_LOGIC_VECTOR(7 DOWNTO 0);
COMPONENT main
	PORT (
	clk : IN STD_LOGIC;
	opcodeteste : BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
	teste : IN STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;
BEGIN
	i1 : main
	PORT MAP (
-- list connections between master ports and signals
	clk => clk,
	opcodeteste => opcodeteste,
	teste => teste
	);

-- clk
t_prcs_clk: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		clk <= '0';
		WAIT FOR 150000 ps;
		clk <= '1';
		WAIT FOR 150000 ps;
	END LOOP;
	clk <= '0';
WAIT;
END PROCESS t_prcs_clk;
-- teste[7]
t_prcs_teste_7: PROCESS
BEGIN
	teste(7) <= '0';
WAIT;
END PROCESS t_prcs_teste_7;
-- teste[6]
t_prcs_teste_6: PROCESS
BEGIN
	teste(6) <= '0';
WAIT;
END PROCESS t_prcs_teste_6;
-- teste[5]
t_prcs_teste_5: PROCESS
BEGIN
	teste(5) <= '0';
WAIT;
END PROCESS t_prcs_teste_5;
-- teste[4]
t_prcs_teste_4: PROCESS
BEGIN
	teste(4) <= '0';
WAIT;
END PROCESS t_prcs_teste_4;
-- teste[3]
t_prcs_teste_3: PROCESS
BEGIN
	teste(3) <= '0';
WAIT;
END PROCESS t_prcs_teste_3;
-- teste[2]
t_prcs_teste_2: PROCESS
BEGIN
	teste(2) <= '0';
	WAIT FOR 600000 ps;
	teste(2) <= '1';
WAIT;
END PROCESS t_prcs_teste_2;
-- teste[1]
t_prcs_teste_1: PROCESS
BEGIN
	teste(1) <= '0';
	WAIT FOR 300000 ps;
	teste(1) <= '1';
	WAIT FOR 300000 ps;
	teste(1) <= '0';
	WAIT FOR 300000 ps;
	teste(1) <= '1';
WAIT;
END PROCESS t_prcs_teste_1;
-- teste[0]
t_prcs_teste_0: PROCESS
BEGIN
	FOR i IN 1 TO 3
	LOOP
		teste(0) <= '0';
		WAIT FOR 150000 ps;
		teste(0) <= '1';
		WAIT FOR 150000 ps;
	END LOOP;
	teste(0) <= '0';
WAIT;
END PROCESS t_prcs_teste_0;
END main_arch;
