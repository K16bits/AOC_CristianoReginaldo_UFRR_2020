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

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 20.1.1 Build 720 11/11/2020 SJ Lite Edition"

-- DATE "05/11/2021 00:04:43"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	main IS
    PORT (
	clk : IN std_logic;
	teste : IN std_logic_vector(7 DOWNTO 0);
	opcodeteste : BUFFER std_logic_vector(3 DOWNTO 0)
	);
END main;

ARCHITECTURE structure OF main IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_teste : std_logic_vector(7 DOWNTO 0);
SIGNAL ww_opcodeteste : std_logic_vector(3 DOWNTO 0);
SIGNAL \teste[1]~input_o\ : std_logic;
SIGNAL \teste[2]~input_o\ : std_logic;
SIGNAL \teste[3]~input_o\ : std_logic;
SIGNAL \teste[4]~input_o\ : std_logic;
SIGNAL \teste[5]~input_o\ : std_logic;
SIGNAL \teste[6]~input_o\ : std_logic;
SIGNAL \teste[7]~input_o\ : std_logic;
SIGNAL \opcodeteste[0]~output_o\ : std_logic;
SIGNAL \opcodeteste[1]~output_o\ : std_logic;
SIGNAL \opcodeteste[2]~output_o\ : std_logic;
SIGNAL \opcodeteste[3]~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \teste[0]~input_o\ : std_logic;
SIGNAL \unidadedecontrole|opULA\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \Pc_para_MemoriaInstru|saida\ : std_logic_vector(7 DOWNTO 0);

BEGIN

ww_clk <= clk;
ww_teste <= teste;
opcodeteste <= ww_opcodeteste;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\opcodeteste[0]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \unidadedecontrole|opULA\(0),
	devoe => ww_devoe,
	o => \opcodeteste[0]~output_o\);

\opcodeteste[1]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \opcodeteste[1]~output_o\);

\opcodeteste[2]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \opcodeteste[2]~output_o\);

\opcodeteste[3]~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => GND,
	devoe => ww_devoe,
	o => \opcodeteste[3]~output_o\);

\clk~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

\teste[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(0),
	o => \teste[0]~input_o\);

\Pc_para_MemoriaInstru|saida[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \teste[0]~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \Pc_para_MemoriaInstru|saida\(0));

\unidadedecontrole|opULA[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~input_o\,
	d => \Pc_para_MemoriaInstru|saida\(0),
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \unidadedecontrole|opULA\(0));

\teste[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(1),
	o => \teste[1]~input_o\);

\teste[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(2),
	o => \teste[2]~input_o\);

\teste[3]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(3),
	o => \teste[3]~input_o\);

\teste[4]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(4),
	o => \teste[4]~input_o\);

\teste[5]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(5),
	o => \teste[5]~input_o\);

\teste[6]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(6),
	o => \teste[6]~input_o\);

\teste[7]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_teste(7),
	o => \teste[7]~input_o\);

ww_opcodeteste(0) <= \opcodeteste[0]~output_o\;

ww_opcodeteste(1) <= \opcodeteste[1]~output_o\;

ww_opcodeteste(2) <= \opcodeteste[2]~output_o\;

ww_opcodeteste(3) <= \opcodeteste[3]~output_o\;
END structure;


