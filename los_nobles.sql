-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 02, 2021 at 11:48 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `los_nobles`
--

-- --------------------------------------------------------

--
-- Table structure for table `abasto`
--

CREATE TABLE `abasto` (
  `idAbasto` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Personal_idPersonal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `abasto`
--

INSERT INTO `abasto` (`idAbasto`, `Fecha`, `Personal_idPersonal`) VALUES
(30, '2021-06-01', 20);

-- --------------------------------------------------------

--
-- Table structure for table `merma`
--

CREATE TABLE `merma` (
  `idmerma` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Productos_idProductos` int(11) NOT NULL,
  `Productos_Abasto_idAbasto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `personal`
--

CREATE TABLE `personal` (
  `idPersonal` int(11) NOT NULL,
  `Rango` int(5) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido Paterno` varchar(45) NOT NULL,
  `Apellido Materno` varchar(45) NOT NULL,
  `Contraseña` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `personal`
--

INSERT INTO `personal` (`idPersonal`, `Rango`, `Nombre`, `Apellido Paterno`, `Apellido Materno`, `Contraseña`) VALUES
(20, 3, 'Oscar', 'Aguilar', 'Cámara', 'holaSOYyo');

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `idProductos` int(11) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `descripcion` varchar(45) DEFAULT NULL,
  `fIngreso` date NOT NULL,
  `fCaducidad` date NOT NULL,
  `fSalida` date DEFAULT NULL,
  `cantidad` float NOT NULL,
  `perecedero` tinyint(1) NOT NULL,
  `Abasto_idAbasto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`idProductos`, `nombre`, `descripcion`, `fIngreso`, `fCaducidad`, `fSalida`, `cantidad`, `perecedero`, `Abasto_idAbasto`) VALUES
(88, 'Azúcar', 'morena', '2021-06-06', '2021-06-07', NULL, 100, 5, 30);

-- --------------------------------------------------------

--
-- Table structure for table `productos_merma`
--

CREATE TABLE `productos_merma` (
  `idProductos` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `FIngreso` date NOT NULL,
  `FCaducidad` date DEFAULT NULL,
  `Cantidad` float DEFAULT NULL,
  `Merma_idmerma` int(11) NOT NULL,
  `Merma_Productos_idProductos` int(11) NOT NULL,
  `Merma_Productos_Abasto_idAbasto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `productos_venta`
--

CREATE TABLE `productos_venta` (
  `idProductos` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(45) DEFAULT NULL,
  `FIngreso` date NOT NULL,
  `FSalida` date NOT NULL,
  `Cantidad` float DEFAULT NULL,
  `Venta_idVenta` int(11) NOT NULL,
  `Venta_Productos_idProductos` int(11) NOT NULL,
  `Venta_Productos_Abasto_idAbasto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(11) NOT NULL,
  `Fecha` date NOT NULL,
  `Productos_idProductos` int(11) NOT NULL,
  `Productos_Abasto_idAbasto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `abasto`
--
ALTER TABLE `abasto`
  ADD PRIMARY KEY (`idAbasto`),
  ADD KEY `fk_Abasto_Personal_idx` (`Personal_idPersonal`);

--
-- Indexes for table `merma`
--
ALTER TABLE `merma`
  ADD PRIMARY KEY (`idmerma`,`Productos_idProductos`,`Productos_Abasto_idAbasto`),
  ADD KEY `fk_Merma_Productos1_idx` (`Productos_idProductos`,`Productos_Abasto_idAbasto`);

--
-- Indexes for table `personal`
--
ALTER TABLE `personal`
  ADD PRIMARY KEY (`idPersonal`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`idProductos`,`Abasto_idAbasto`),
  ADD KEY `fk_Productos_Abasto1_idx` (`Abasto_idAbasto`);

--
-- Indexes for table `productos_merma`
--
ALTER TABLE `productos_merma`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `fk_Productos_merma_Merma1_idx` (`Merma_idmerma`,`Merma_Productos_idProductos`,`Merma_Productos_Abasto_idAbasto`);

--
-- Indexes for table `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD PRIMARY KEY (`idProductos`),
  ADD KEY `fk_Productos_venta_Venta1_idx` (`Venta_idVenta`,`Venta_Productos_idProductos`,`Venta_Productos_Abasto_idAbasto`);

--
-- Indexes for table `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`,`Productos_idProductos`,`Productos_Abasto_idAbasto`),
  ADD KEY `fk_Venta_Productos1_idx` (`Productos_idProductos`,`Productos_Abasto_idAbasto`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `abasto`
--
ALTER TABLE `abasto`
  MODIFY `idAbasto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `merma`
--
ALTER TABLE `merma`
  MODIFY `idmerma` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `personal`
--
ALTER TABLE `personal`
  MODIFY `idPersonal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `productos_merma`
--
ALTER TABLE `productos_merma`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos_venta`
--
ALTER TABLE `productos_venta`
  MODIFY `idProductos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `abasto`
--
ALTER TABLE `abasto`
  ADD CONSTRAINT `fk_Abasto_Personal` FOREIGN KEY (`Personal_idPersonal`) REFERENCES `personal` (`idPersonal`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `merma`
--
ALTER TABLE `merma`
  ADD CONSTRAINT `fk_Merma_Productos1` FOREIGN KEY (`Productos_idProductos`,`Productos_Abasto_idAbasto`) REFERENCES `productos` (`idProductos`, `Abasto_idAbasto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_Productos_Abasto1` FOREIGN KEY (`Abasto_idAbasto`) REFERENCES `abasto` (`idAbasto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productos_merma`
--
ALTER TABLE `productos_merma`
  ADD CONSTRAINT `fk_Productos_merma_Merma1` FOREIGN KEY (`Merma_idmerma`,`Merma_Productos_idProductos`,`Merma_Productos_Abasto_idAbasto`) REFERENCES `merma` (`idmerma`, `Productos_idProductos`, `Productos_Abasto_idAbasto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `productos_venta`
--
ALTER TABLE `productos_venta`
  ADD CONSTRAINT `fk_Productos_venta_Venta1` FOREIGN KEY (`Venta_idVenta`,`Venta_Productos_idProductos`,`Venta_Productos_Abasto_idAbasto`) REFERENCES `venta` (`idVenta`, `Productos_idProductos`, `Productos_Abasto_idAbasto`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `fk_Venta_Productos1` FOREIGN KEY (`Productos_idProductos`,`Productos_Abasto_idAbasto`) REFERENCES `productos` (`idProductos`, `Abasto_idAbasto`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
