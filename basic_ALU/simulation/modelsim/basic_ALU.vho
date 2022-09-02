-- Copyright (C) 2021  Intel Corporation. All rights reserved.
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
-- VERSION "Version 21.1.0 Build 842 10/21/2021 SJ Lite Edition"

-- DATE "09/02/2022 15:11:19"

-- 
-- Device: Altera 5CGXFC7C7F23C8 Package FBGA484
-- 

-- 
-- This VHDL file should be used for ModelSim (VHDL) only
-- 

LIBRARY ALTERA_LNSIM;
LIBRARY CYCLONEV;
LIBRARY IEEE;
USE ALTERA_LNSIM.ALTERA_LNSIM_COMPONENTS.ALL;
USE CYCLONEV.CYCLONEV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	basic_ALU IS
    PORT (
	A : IN std_logic;
	B : IN std_logic;
	c_in : IN std_logic;
	opcode : IN std_logic_vector(2 DOWNTO 0);
	Y : OUT std_logic;
	Status_out : OUT std_logic
	);
END basic_ALU;

-- Design Ports Information
-- Y	=>  Location: PIN_L22,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- Status_out	=>  Location: PIN_L18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[1]	=>  Location: PIN_M21,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[0]	=>  Location: PIN_M20,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- opcode[2]	=>  Location: PIN_L17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- A	=>  Location: PIN_M18,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- B	=>  Location: PIN_K17,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- c_in	=>  Location: PIN_M22,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF basic_ALU IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_A : std_logic;
SIGNAL ww_B : std_logic;
SIGNAL ww_c_in : std_logic;
SIGNAL ww_opcode : std_logic_vector(2 DOWNTO 0);
SIGNAL ww_Y : std_logic;
SIGNAL ww_Status_out : std_logic;
SIGNAL \~QUARTUS_CREATED_GND~I_combout\ : std_logic;
SIGNAL \B~input_o\ : std_logic;
SIGNAL \opcode[0]~input_o\ : std_logic;
SIGNAL \c_in~input_o\ : std_logic;
SIGNAL \A~input_o\ : std_logic;
SIGNAL \opcode[1]~input_o\ : std_logic;
SIGNAL \opcode[2]~input_o\ : std_logic;
SIGNAL \Y$latch~combout\ : std_logic;
SIGNAL \Status_out~0_combout\ : std_logic;
SIGNAL \Status_out~1_combout\ : std_logic;
SIGNAL \Status_out$latch~combout\ : std_logic;
SIGNAL \ALT_INV_c_in~input_o\ : std_logic;
SIGNAL \ALT_INV_B~input_o\ : std_logic;
SIGNAL \ALT_INV_A~input_o\ : std_logic;
SIGNAL \ALT_INV_opcode[2]~input_o\ : std_logic;
SIGNAL \ALT_INV_opcode[0]~input_o\ : std_logic;
SIGNAL \ALT_INV_opcode[1]~input_o\ : std_logic;
SIGNAL \ALT_INV_Status_out$latch~combout\ : std_logic;
SIGNAL \ALT_INV_Status_out~1_combout\ : std_logic;
SIGNAL \ALT_INV_Status_out~0_combout\ : std_logic;

BEGIN

ww_A <= A;
ww_B <= B;
ww_c_in <= c_in;
ww_opcode <= opcode;
Y <= ww_Y;
Status_out <= ww_Status_out;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_c_in~input_o\ <= NOT \c_in~input_o\;
\ALT_INV_B~input_o\ <= NOT \B~input_o\;
\ALT_INV_A~input_o\ <= NOT \A~input_o\;
\ALT_INV_opcode[2]~input_o\ <= NOT \opcode[2]~input_o\;
\ALT_INV_opcode[0]~input_o\ <= NOT \opcode[0]~input_o\;
\ALT_INV_opcode[1]~input_o\ <= NOT \opcode[1]~input_o\;
\ALT_INV_Status_out$latch~combout\ <= NOT \Status_out$latch~combout\;
\ALT_INV_Status_out~1_combout\ <= NOT \Status_out~1_combout\;
\ALT_INV_Status_out~0_combout\ <= NOT \Status_out~0_combout\;

-- Location: IOOBUF_X89_Y36_N56
\Y~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Y$latch~combout\,
	devoe => ww_devoe,
	o => ww_Y);

-- Location: IOOBUF_X89_Y38_N22
\Status_out~output\ : cyclonev_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false",
	shift_series_termination_control => "false")
-- pragma translate_on
PORT MAP (
	i => \Status_out$latch~combout\,
	devoe => ww_devoe,
	o => ww_Status_out);

-- Location: IOIBUF_X89_Y37_N4
\B~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_B,
	o => \B~input_o\);

-- Location: IOIBUF_X89_Y37_N38
\opcode[0]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(0),
	o => \opcode[0]~input_o\);

-- Location: IOIBUF_X89_Y36_N38
\c_in~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_c_in,
	o => \c_in~input_o\);

-- Location: IOIBUF_X89_Y36_N21
\A~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_A,
	o => \A~input_o\);

-- Location: IOIBUF_X89_Y37_N55
\opcode[1]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(1),
	o => \opcode[1]~input_o\);

-- Location: IOIBUF_X89_Y37_N21
\opcode[2]~input\ : cyclonev_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_opcode(2),
	o => \opcode[2]~input_o\);

-- Location: LABCELL_X88_Y37_N6
\Y$latch\ : cyclonev_lcell_comb
-- Equation(s):
-- \Y$latch~combout\ = ( \opcode[1]~input_o\ & ( \opcode[2]~input_o\ & ( (!\A~input_o\ & (\B~input_o\)) # (\A~input_o\ & ((!\opcode[0]~input_o\ & (!\B~input_o\)) # (\opcode[0]~input_o\ & ((\c_in~input_o\))))) ) ) ) # ( !\opcode[1]~input_o\ & ( 
-- \opcode[2]~input_o\ & ( (!\opcode[0]~input_o\ & (!\B~input_o\ $ (!\c_in~input_o\ $ (\A~input_o\)))) ) ) ) # ( \opcode[1]~input_o\ & ( !\opcode[2]~input_o\ & ( (!\B~input_o\ & ((\A~input_o\))) # (\B~input_o\ & ((!\opcode[0]~input_o\) # (!\A~input_o\))) ) ) 
-- ) # ( !\opcode[1]~input_o\ & ( !\opcode[2]~input_o\ & ( (\B~input_o\ & (\opcode[0]~input_o\ & \A~input_o\)) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000010001010101011110111001001000100001000101010110001011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B~input_o\,
	datab => \ALT_INV_opcode[0]~input_o\,
	datac => \ALT_INV_c_in~input_o\,
	datad => \ALT_INV_A~input_o\,
	datae => \ALT_INV_opcode[1]~input_o\,
	dataf => \ALT_INV_opcode[2]~input_o\,
	combout => \Y$latch~combout\);

-- Location: LABCELL_X88_Y37_N42
\Status_out~0\ : cyclonev_lcell_comb
-- Equation(s):
-- \Status_out~0_combout\ = ( \opcode[1]~input_o\ & ( \opcode[0]~input_o\ & ( (!\A~input_o\ & (\B~input_o\)) # (\A~input_o\ & ((!\opcode[2]~input_o\))) ) ) ) # ( !\opcode[1]~input_o\ & ( \opcode[0]~input_o\ & ( (!\A~input_o\ & (\B~input_o\ & 
-- !\opcode[2]~input_o\)) # (\A~input_o\ & ((\opcode[2]~input_o\))) ) ) ) # ( \opcode[1]~input_o\ & ( !\opcode[0]~input_o\ & ( (\B~input_o\ & !\A~input_o\) ) ) ) # ( !\opcode[1]~input_o\ & ( !\opcode[0]~input_o\ & ( (!\A~input_o\ & (\B~input_o\ & 
-- ((!\opcode[2]~input_o\) # (\c_in~input_o\)))) # (\A~input_o\ & (\opcode[2]~input_o\ & ((\c_in~input_o\) # (\B~input_o\)))) ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0100010000010111010001000100010001000100001100110111011101000100",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_B~input_o\,
	datab => \ALT_INV_A~input_o\,
	datac => \ALT_INV_c_in~input_o\,
	datad => \ALT_INV_opcode[2]~input_o\,
	datae => \ALT_INV_opcode[1]~input_o\,
	dataf => \ALT_INV_opcode[0]~input_o\,
	combout => \Status_out~0_combout\);

-- Location: LABCELL_X88_Y37_N51
\Status_out~1\ : cyclonev_lcell_comb
-- Equation(s):
-- \Status_out~1_combout\ = ( \opcode[1]~input_o\ & ( \opcode[0]~input_o\ & ( !\opcode[2]~input_o\ ) ) ) # ( !\opcode[1]~input_o\ & ( \opcode[0]~input_o\ & ( \opcode[2]~input_o\ ) ) ) # ( \opcode[1]~input_o\ & ( !\opcode[0]~input_o\ & ( \opcode[2]~input_o\ ) 
-- ) ) # ( !\opcode[1]~input_o\ & ( !\opcode[0]~input_o\ & ( \opcode[2]~input_o\ ) ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0101010101010101010101010101010101010101010101011010101010101010",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	dataa => \ALT_INV_opcode[2]~input_o\,
	datae => \ALT_INV_opcode[1]~input_o\,
	dataf => \ALT_INV_opcode[0]~input_o\,
	combout => \Status_out~1_combout\);

-- Location: LABCELL_X88_Y37_N54
\Status_out$latch\ : cyclonev_lcell_comb
-- Equation(s):
-- \Status_out$latch~combout\ = ( \Status_out$latch~combout\ & ( \Status_out~1_combout\ & ( \Status_out~0_combout\ ) ) ) # ( !\Status_out$latch~combout\ & ( \Status_out~1_combout\ & ( \Status_out~0_combout\ ) ) ) # ( \Status_out$latch~combout\ & ( 
-- !\Status_out~1_combout\ ) )

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000111111111111111100110011001100110011001100110011",
	shared_arith => "off")
-- pragma translate_on
PORT MAP (
	datab => \ALT_INV_Status_out~0_combout\,
	datae => \ALT_INV_Status_out$latch~combout\,
	dataf => \ALT_INV_Status_out~1_combout\,
	combout => \Status_out$latch~combout\);

-- Location: MLABCELL_X72_Y78_N3
\~QUARTUS_CREATED_GND~I\ : cyclonev_lcell_comb
-- Equation(s):

-- pragma translate_off
GENERIC MAP (
	extended_lut => "off",
	lut_mask => "0000000000000000000000000000000000000000000000000000000000000000",
	shared_arith => "off")
-- pragma translate_on
;
END structure;


