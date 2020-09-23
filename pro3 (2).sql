-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 23, 2019 at 05:36 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pro3`
--

-- --------------------------------------------------------

--
-- Table structure for table `bahanmros`
--

CREATE TABLE `bahanmros` (
  `id` int(10) UNSIGNED NOT NULL,
  `productcategory_id` int(10) UNSIGNED DEFAULT NULL,
  `partname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partnumber` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `partcategory` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bahanmros`
--

INSERT INTO `bahanmros` (`id`, `productcategory_id`, `partname`, `partnumber`, `partcategory`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(13, NULL, 'Shell Tonna S2 M 68', '1431', 'Oli Slide U/DC', 'superadmin', 'superadmin', '2019-08-14 17:58:57', '2019-08-23 12:11:34'),
(14, NULL, 'Shell OMALA S2 GX 220', '1433', 'Oli Slide U/DC', 'superadmin', NULL, '2019-08-14 17:59:35', '2019-08-14 17:59:35'),
(15, NULL, 'Dycote 4400', '1332', 'Die Lube', 'superadmin', NULL, '2019-08-14 17:59:53', '2019-08-14 17:59:53'),
(16, NULL, 'OIL SEAL TC-35-55-11 NOK', '1434', 'Oil Seal', 'superadmin', NULL, '2019-08-23 12:14:43', '2019-08-23 12:14:43');

-- --------------------------------------------------------

--
-- Table structure for table `detailpos`
--

CREATE TABLE `detailpos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nopo` int(11) UNSIGNED NOT NULL,
  `nopr` int(11) UNSIGNED NOT NULL,
  `pr_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double NOT NULL,
  `supplier` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` datetime NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` int(10) UNSIGNED NOT NULL,
  `expenses_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalamount` double NOT NULL,
  `paidamount` double NOT NULL,
  `dueamount` double NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expenses`
--

INSERT INTO `expenses` (`id`, `expenses_name`, `party_name`, `totalamount`, `paidamount`, `dueamount`, `product_name`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Rent Expenses', 'House Owner', 50000, 5000, 45000, 'home', 'admin', 'admin', '2017-07-20 09:01:44', '2017-07-20 09:01:57'),
(2, 'Bill payment', 'Subusu', 4000, 4000, 0, 'Internet', 'admin', 'admin', '2017-10-28 14:52:48', '2017-10-28 15:43:32');

-- --------------------------------------------------------

--
-- Table structure for table `expensestitles`
--

CREATE TABLE `expensestitles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `expensestitles`
--

INSERT INTO `expensestitles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Consumable Expenses', '2017-07-20 09:00:46', '2017-07-20 09:00:46'),
(2, 'Rent Expenses', '2017-07-20 09:00:58', '2017-07-20 09:00:58'),
(3, 'Bill payment', '2017-10-28 14:52:16', '2017-10-28 14:52:16');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 2),
(3, '2017_05_28_124228_create_roles_table', 3),
(4, '2017_05_28_124417_create_user_roles_table', 4),
(5, '2017_05_28_124654_create_permissions_table', 5),
(6, '2017_05_28_124806_create_role_permissions_table', 6),
(7, '2017_05_28_125406_create_modules_table', 7),
(8, '2017_05_28_125428_create_role_modules_table', 8),
(9, '2017_06_07_103849_create_productcategories_table', 9),
(10, '2017_06_07_103917_create_products_table', 10),
(11, '2017_06_09_071114_create_sales_table', 11),
(12, '2017_06_26_093722_create_expenses_table', 12),
(13, '2017_07_06_132245_create_salescarts_table', 13),
(14, '2017_07_06_141913_create_expensestitles_table', 14),
(15, '2017_07_07_125933_create_purchases_table', 15),
(17, '2017_07_17_084213_create_transactions_table', 16);

-- --------------------------------------------------------

--
-- Table structure for table `modules`
--

CREATE TABLE `modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_key` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_url` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `module_icon` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `module_rank` int(11) NOT NULL,
  `view_sidebar` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `modules`
--

INSERT INTO `modules` (`id`, `name`, `module_key`, `module_url`, `module_icon`, `module_rank`, `view_sidebar`, `created_at`, `updated_at`) VALUES
(23, 'Dashboard', 'das', 'dashboard-panel', 'fa fa-home', 1, 1, '2019-08-17 10:59:55', '2019-08-17 10:59:55'),
(24, 'User Management', 'user_management', 'user-register', 'fa fa-user', 2, 1, '2019-08-17 11:00:31', '2019-08-17 11:00:31'),
(25, 'Module Management', 'module_management', 'module-list', 'fa fa-signal', 3, 1, '2019-08-17 11:01:31', '2019-08-17 11:01:31'),
(26, 'Role Management', 'role_management', 'role-list', 'fa fa-eye', 5, 1, '2019-08-17 11:02:18', '2019-08-17 11:02:18'),
(27, 'Permission Management', 'permission_management', 'permission-list', 'fa fa-refresh', 4, 1, '2019-08-17 11:03:14', '2019-08-17 11:03:14'),
(28, 'Data Master MRO\'s Part', 'bahanmro_mgmt', 'bahanmro-list', 'fa fa-archive', 6, 1, '2019-08-17 11:12:21', '2019-08-17 11:12:21'),
(29, 'Data Master Supplier', 'supplier_management', 'supplier-list', 'fa fa-group', 7, 1, '2019-08-17 11:16:13', '2019-08-17 11:16:13'),
(30, 'Request Form Planning', 'rfp_mgmt', 'rfp-list', 'fa fa-ticket', 8, 1, '2019-08-17 11:19:26', '2019-08-17 11:19:26'),
(31, 'Purchase Requisition', 'pr_mgmt', 'pr-list', 'fa fa-shopping-cart', 9, 1, '2019-08-17 19:43:12', '2019-08-17 19:43:12'),
(32, 'Purchase Order', 'po_mgmt', 'po-list', 'fa fa-shopping-bag', 10, 1, '2019-08-19 12:21:05', '2019-08-19 12:21:05'),
(33, 'Warehouse Stock', 'warehouse_stock', 'warehouse-list', 'fa fa-cubes', 11, 1, '2019-08-22 02:04:48', '2019-08-22 02:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permission_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `permission_key`, `created_at`, `updated_at`) VALUES
(1, 'Create New User', 'user-register', '2017-06-06 21:12:20', '2017-06-06 21:12:20'),
(2, 'Module Create', 'module-create', '2017-06-07 23:18:50', '2017-06-07 23:18:50'),
(3, 'Module View', 'module-list', '2017-06-07 23:19:11', '2017-06-07 23:19:11'),
(4, 'Module Delete', 'module-delete', '2017-06-07 23:19:26', '2017-06-07 23:19:26'),
(5, 'Module Edit', 'module-edit', '2017-06-07 23:19:43', '2017-06-07 23:19:43'),
(6, 'Role View', 'role-list', '2017-06-07 23:20:39', '2017-06-07 23:20:39'),
(7, 'Role Create', 'role-create', '2017-06-07 23:20:52', '2017-06-07 23:20:52'),
(8, 'Permission Asign', 'permission-asign', '2017-06-07 23:21:16', '2017-06-07 23:32:14'),
(9, 'Permission Create', 'permission-create', '2017-06-07 23:21:48', '2017-06-07 23:21:48'),
(10, 'Permission Views', 'permission-list', '2017-06-07 23:22:07', '2017-06-07 23:22:07'),
(11, 'Permission Edit', 'permission-edit', '2017-06-07 23:22:46', '2017-06-07 23:22:46'),
(12, 'Permission Delete', 'permission-delete', '2017-06-07 23:23:18', '2017-06-07 23:23:18'),
(17, 'BahanMRO View', 'bahanmro-list', '2017-06-07 23:39:33', '2019-07-27 05:47:32'),
(18, 'Product Create', 'bahanmro-create', '2017-06-07 23:39:50', '2019-08-14 17:50:34'),
(19, 'Product Edit', 'bahanmro-edit', '2017-06-07 23:40:06', '2019-08-14 17:50:55'),
(20, 'Product Delete', 'bahanmro-delete', '2017-06-07 23:40:45', '2019-08-14 17:51:07'),
(25, 'PO view', 'po-list', '2017-07-16 23:57:39', '2019-08-19 18:16:32'),
(26, 'Make/Create PO', 'po-create', '2017-07-16 23:59:43', '2019-08-19 18:16:49'),
(30, 'Purchase view', 'purchase-list', '2017-07-17 00:24:38', '2017-07-17 00:24:38'),
(31, 'Make new Purchase', 'purchase-create', '2017-07-17 00:25:03', '2017-07-17 00:25:03'),
(32, 'purchase Update/Confirm Dueamount', 'purchase-update', '2017-07-17 00:25:41', '2017-07-17 00:25:41'),
(33, 'Expenses View', 'expenses-list', '2017-07-17 00:30:32', '2017-07-17 00:30:32'),
(34, 'Expenses Create', 'expenses-create', '2017-07-17 00:31:24', '2017-07-17 00:31:24'),
(35, 'Expenses Edit', 'expenses-edit', '2017-07-17 00:31:43', '2017-07-17 00:31:43'),
(36, 'Expenses Delete', 'expenses-delete', '2017-07-17 00:32:04', '2017-07-17 00:32:04'),
(37, 'Expenses Heading Create', 'expenses-heading', '2017-07-17 00:33:34', '2017-07-17 00:33:34'),
(45, 'User Password Change', 'password-change', '2017-07-17 00:54:08', '2017-07-17 00:54:08'),
(46, 'Transcation/Bank view', 'transaction-list', '2017-07-17 22:30:39', '2017-07-17 22:30:39'),
(47, 'Transaction remaining Deposite update', 'transaction-update', '2017-07-17 22:31:56', '2017-07-17 22:31:56'),
(48, 'Transaction Entry', 'transaction-create', '2017-07-17 22:32:23', '2017-07-17 22:32:23'),
(49, 'Supplier Create', 'supplier-create', '2019-08-14 18:00:37', '2019-08-14 18:00:37'),
(50, 'Supplier View', 'supplier-list', '2019-08-14 18:00:50', '2019-08-14 18:00:50'),
(51, 'Supplier Delete', 'supplier-delete', '2019-08-14 18:01:01', '2019-08-14 18:01:01'),
(52, 'Supplier Edit', 'supplier-edit', '2019-08-14 18:01:14', '2019-08-14 18:01:14'),
(53, 'RFP view', 'rfp-list', '2019-08-16 06:30:11', '2019-08-16 06:30:11'),
(54, 'RFP Create', 'rfp-create', '2019-08-16 06:30:24', '2019-08-16 06:30:24'),
(55, 'RFP-edit', 'rfp-edit', '2019-08-16 06:30:45', '2019-08-16 06:30:45'),
(56, 'RFP delete', 'rfp-delete', '2019-08-16 06:30:59', '2019-08-16 06:30:59'),
(57, 'RFP Update', 'rfp-update', '2019-08-17 14:57:00', '2019-08-17 14:57:00'),
(58, 'PR view', 'pr-list', '2019-08-19 05:10:49', '2019-08-19 05:10:49'),
(59, 'PR create', 'pr-create', '2019-08-19 05:11:09', '2019-08-19 05:11:09'),
(60, 'PR Edit', 'pr-edit', '2019-08-19 05:11:19', '2019-08-19 05:11:19'),
(61, 'PR Delete', 'pr-delete', '2019-08-19 05:11:30', '2019-08-19 05:11:30'),
(62, 'PR Update', 'pr-update', '2019-08-19 12:54:36', '2019-08-19 12:54:36'),
(63, 'Warehouse List', 'warehouse-list', '2019-08-22 02:49:25', '2019-08-22 02:49:25'),
(64, 'Warehouse Create', 'warehouse-create', '2019-08-22 02:49:44', '2019-08-22 02:49:44'),
(65, 'Warehouse Edit', 'warehouse-edit', '2019-08-22 02:49:56', '2019-08-22 02:49:56'),
(66, 'Warehouse Delete', 'warehouse-delete', '2019-08-22 02:50:12', '2019-08-22 02:50:12'),
(67, 'Sales View', 'sales-list', '2019-08-22 11:13:17', '2019-08-22 11:13:17'),
(68, 'Make Sales', 'sales-create', '2019-08-22 11:13:31', '2019-08-22 11:13:31'),
(69, 'Edit PO', 'po-edit', '2019-08-22 12:42:06', '2019-08-22 12:42:06'),
(70, 'Delete PO', 'po-delete', '2019-08-22 12:42:38', '2019-08-22 12:42:38'),
(71, 'PO Update', 'po-update', '2019-08-22 12:42:53', '2019-08-22 12:42:53');

-- --------------------------------------------------------

--
-- Table structure for table `pos`
--

CREATE TABLE `pos` (
  `id` int(10) UNSIGNED NOT NULL,
  `nopo` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nopr` varchar(110) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pr_id` int(10) UNSIGNED DEFAULT NULL,
  `bahanmros_id` int(11) NOT NULL,
  `qty` int(11) NOT NULL,
  `price` double NOT NULL,
  `total_price` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplier_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `issue_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pos`
--

INSERT INTO `pos` (`id`, `nopo`, `nopr`, `pr_id`, `bahanmros_id`, `qty`, `price`, `total_price`, `supplier_id`, `issue_date`, `delivery_date`, `created_at`, `updated_at`) VALUES
(1, 'PO01', 'PR04', NULL, 15, 33, 10000, '330000', 'PT Jadoba', '2019-08-08', '2019-10-08', '2019-08-22 17:11:51', '2019-08-22 17:11:51');

-- --------------------------------------------------------

--
-- Table structure for table `prs`
--

CREATE TABLE `prs` (
  `id` int(11) UNSIGNED NOT NULL,
  `nopr` varchar(10) NOT NULL,
  `requestfp_id` int(11) UNSIGNED DEFAULT NULL,
  `norfps` varchar(11) DEFAULT NULL,
  `bahanmros_id` int(11) NOT NULL,
  `partname` varchar(100) DEFAULT NULL,
  `issue_date` date NOT NULL,
  `delivery_date` date NOT NULL,
  `qty` int(20) NOT NULL,
  `price` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_by` varchar(100) NOT NULL,
  `modified_by` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `prs`
--

INSERT INTO `prs` (`id`, `nopr`, `requestfp_id`, `norfps`, `bahanmros_id`, `partname`, `issue_date`, `delivery_date`, `qty`, `price`, `total_price`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'PR01', NULL, '0', 0, '', '2019-08-19', '2019-10-08', 12, 13000, 156000, 0, 'superadmin', 'maintenancemanager', '2019-08-19 11:18:38', '2019-08-22 08:50:48'),
(2, 'PR02', NULL, '0', 0, '', '2019-08-19', '2019-10-08', 12, 13000, 156000, 0, 'superadmin', NULL, '2019-08-19 11:25:51', NULL),
(3, 'PR03', NULL, '0', 15, '', '2019-08-22', '2019-10-08', 33, 11000, 363000, 0, 'maintenancemanager', NULL, '2019-08-22 05:26:21', NULL),
(4, 'PR04', NULL, NULL, 15, NULL, '2019-08-08', '2019-10-08', 33, 10000, 330000, 0, 'maintenancemanager', NULL, '2019-08-22 06:36:38', NULL),
(5, 'PR01', NULL, NULL, 15, NULL, '2019-08-08', '2019-10-08', 33, 13000, 429000, 0, 'maintenancemanager', NULL, '2019-08-22 06:41:38', NULL),
(6, 'PR04', NULL, NULL, 15, NULL, '2019-08-08', '2019-10-08', 33, 13000, 429000, 0, 'maintenancemanager', NULL, '2019-08-22 06:52:45', NULL),
(7, 'PR04', NULL, NULL, 15, NULL, '2019-08-08', '2019-10-08', 33, 11000, 363000, 0, 'maintenancemanager', NULL, '2019-08-22 06:53:41', NULL),
(8, 'PR04', NULL, NULL, 15, NULL, '2019-08-08', '2019-10-08', 33, 13000, 429000, 0, 'maintenancemanager', NULL, '2019-08-22 06:54:33', NULL),
(9, 'PR04', NULL, 'RFP01', 15, NULL, '2019-08-08', '2019-10-08', 33, 13000, 429000, 1, 'maintenancemanager', 'finance', '2019-08-22 06:56:56', '2019-08-22 08:53:32'),
(10, 'PR03', NULL, 'RFP02', 14, NULL, '2019-08-08', '2019-10-08', 12, 11000, 132000, 0, 'maintenancemanager', NULL, '2019-08-22 07:27:10', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` int(10) UNSIGNED NOT NULL,
  `goods_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `party_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `totalamount` double NOT NULL,
  `paidamount` double NOT NULL,
  `dueamount` double NOT NULL,
  `status` enum('vat','pan','normal') COLLATE utf8mb4_unicode_ci NOT NULL,
  `purchase_date` date NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`id`, `goods_name`, `party_name`, `totalamount`, `paidamount`, `dueamount`, `status`, `purchase_date`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'Software', 'Cheetahwebtech', 500000, 500000, 0, 'vat', '2017-07-20', 'admin', NULL, '2017-07-20 09:03:02', '2017-07-20 09:03:02'),
(2, 'Other Purchase', 'Some Other', 50000, 50000, 0, 'pan', '2017-07-20', 'admin', NULL, '2017-07-20 09:03:41', '2017-10-28 14:46:18'),
(3, 'Furniture', 'Thapa furniture', 4000, 30000, -26000, 'pan', '2017-10-28', 'admin', NULL, '2017-10-28 14:50:57', '2017-10-28 14:50:57'),
(4, 'Baby Product 1 Bundel', 'Gupta wholeSell', 5000, 5000, 0, 'pan', '2017-10-28', 'admin', NULL, '2017-10-28 15:46:07', '2017-10-28 15:46:07');

-- --------------------------------------------------------

--
-- Table structure for table `requestfps`
--

CREATE TABLE `requestfps` (
  `id` int(10) UNSIGNED NOT NULL,
  `norfps` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bahanmros_id` int(11) NOT NULL,
  `minquantity` int(11) NOT NULL,
  `maxquantity` int(11) NOT NULL,
  `actquantity` int(11) NOT NULL,
  `qty` int(11) DEFAULT NULL,
  `month` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `use` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `supplier_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` date DEFAULT NULL,
  `updated_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `requestfps`
--

INSERT INTO `requestfps` (`id`, `norfps`, `bahanmros_id`, `minquantity`, `maxquantity`, `actquantity`, `qty`, `month`, `use`, `supplier_id`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(3, 'RFP01', 15, 1, 100, 2, 33, 'September, Oktober, November', '10,11,12', 'PT Jadoba', 1, 'superadmin', 'maintenancemanager', '2019-08-22', '2019-08-22'),
(5, 'RFP02', 14, 12, 100, 2, 12, 'September, Oktober, November', '10,11,12', 'PT Jadoba', 1, 'maintenancemanager', 'maintenancemanager', '2019-08-22', '2019-08-22');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Super Admin', '2017-07-19 18:15:00', '2017-07-20 18:15:00'),
(2, 'Admin', '2017-07-19 18:15:00', '2017-07-20 18:15:00'),
(3, 'maintenancemanager', '2019-07-26 08:05:12', '2019-07-26 08:05:12'),
(4, 'warehouse', '2019-07-26 08:05:25', '2019-07-26 08:05:25'),
(5, 'purchasing', '2019-07-26 08:05:34', '2019-07-26 08:05:34'),
(6, 'maintenancestaff', '2019-08-17 10:29:24', '2019-08-17 10:29:24'),
(7, 'finance', '2019-08-16 17:00:00', '2019-08-16 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `role_modules`
--

CREATE TABLE `role_modules` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `module_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_modules`
--

INSERT INTO `role_modules` (`id`, `role_id`, `module_id`, `created_at`, `updated_at`) VALUES
(49, 1, 23, '2019-08-17 10:59:55', '2019-08-17 10:59:55'),
(50, 2, 23, '2019-08-17 10:59:55', '2019-08-17 10:59:55'),
(51, 3, 23, '2019-08-17 10:59:55', '2019-08-17 10:59:55'),
(52, 4, 23, '2019-08-17 10:59:55', '2019-08-17 10:59:55'),
(53, 5, 23, '2019-08-17 10:59:55', '2019-08-17 10:59:55'),
(54, 6, 23, '2019-08-17 10:59:55', '2019-08-17 10:59:55'),
(55, 1, 24, '2019-08-17 11:00:32', '2019-08-17 11:00:32'),
(56, 2, 24, '2019-08-17 11:00:32', '2019-08-17 11:00:32'),
(57, 1, 25, '2019-08-17 11:01:31', '2019-08-17 11:01:31'),
(58, 2, 25, '2019-08-17 11:01:31', '2019-08-17 11:01:31'),
(59, 1, 26, '2019-08-17 11:02:18', '2019-08-17 11:02:18'),
(60, 2, 26, '2019-08-17 11:02:18', '2019-08-17 11:02:18'),
(61, 1, 27, '2019-08-17 11:03:14', '2019-08-17 11:03:14'),
(62, 2, 27, '2019-08-17 11:03:14', '2019-08-17 11:03:14'),
(63, 1, 28, '2019-08-17 11:12:21', '2019-08-17 11:12:21'),
(64, 2, 28, '2019-08-17 11:12:21', '2019-08-17 11:12:21'),
(65, 3, 28, '2019-08-17 11:12:22', '2019-08-17 11:12:22'),
(66, 6, 28, '2019-08-17 11:12:22', '2019-08-17 11:12:22'),
(67, 1, 29, '2019-08-17 11:16:13', '2019-08-17 11:16:13'),
(68, 3, 29, '2019-08-17 11:16:13', '2019-08-17 11:16:13'),
(69, 5, 29, '2019-08-17 11:16:13', '2019-08-17 11:16:13'),
(70, 6, 29, '2019-08-17 11:16:13', '2019-08-17 11:16:13'),
(71, 1, 30, '2019-08-17 11:19:26', '2019-08-17 11:19:26'),
(72, 3, 30, '2019-08-17 11:19:26', '2019-08-17 11:19:26'),
(73, 6, 30, '2019-08-17 11:19:26', '2019-08-17 11:19:26'),
(74, 1, 31, '2019-08-17 19:43:12', '2019-08-17 19:43:12'),
(75, 3, 31, '2019-08-17 19:43:12', '2019-08-17 19:43:12'),
(76, 5, 31, '2019-08-17 19:43:12', '2019-08-17 19:43:12'),
(77, 7, 31, '2019-08-17 19:43:12', '2019-08-17 19:43:12'),
(78, 1, 32, '2019-08-19 12:21:05', '2019-08-19 12:21:05'),
(79, 3, 32, '2019-08-19 12:21:05', '2019-08-19 12:21:05'),
(80, 4, 32, '2019-08-19 12:21:05', '2019-08-19 12:21:05'),
(81, 5, 32, '2019-08-19 12:21:05', '2019-08-19 12:21:05'),
(82, 7, 32, '2019-08-19 12:21:05', '2019-08-19 12:21:05'),
(83, 1, 33, '2019-08-22 02:04:48', '2019-08-22 02:04:48'),
(84, 3, 33, '2019-08-22 02:04:48', '2019-08-22 02:04:48'),
(85, 4, 33, '2019-08-22 02:04:48', '2019-08-22 02:04:48'),
(86, 5, 33, '2019-08-22 02:04:48', '2019-08-22 02:04:48'),
(87, 6, 33, '2019-08-22 02:04:48', '2019-08-22 02:04:48');

-- --------------------------------------------------------

--
-- Table structure for table `role_permissions`
--

CREATE TABLE `role_permissions` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `permission_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permissions`
--

INSERT INTO `role_permissions` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1026, 2, 17, '2019-08-17 10:38:13', '2019-08-17 10:38:13'),
(1027, 2, 18, '2019-08-17 10:38:13', '2019-08-17 10:38:13'),
(1028, 2, 19, '2019-08-17 10:38:13', '2019-08-17 10:38:13'),
(1029, 2, 20, '2019-08-17 10:38:13', '2019-08-17 10:38:13'),
(1030, 2, 53, '2019-08-17 10:38:13', '2019-08-17 10:38:13'),
(1031, 6, 17, '2019-08-17 11:33:13', '2019-08-17 11:33:13'),
(1032, 6, 50, '2019-08-17 11:33:13', '2019-08-17 11:33:13'),
(1033, 6, 53, '2019-08-17 11:33:13', '2019-08-17 11:33:13'),
(1034, 6, 54, '2019-08-17 11:33:14', '2019-08-17 11:33:14'),
(1035, 6, 55, '2019-08-17 11:33:14', '2019-08-17 11:33:14'),
(1036, 6, 56, '2019-08-17 11:33:14', '2019-08-17 11:33:14'),
(1076, 3, 17, '2019-08-19 05:12:28', '2019-08-19 05:12:28'),
(1077, 3, 18, '2019-08-19 05:12:28', '2019-08-19 05:12:28'),
(1078, 3, 19, '2019-08-19 05:12:28', '2019-08-19 05:12:28'),
(1079, 3, 20, '2019-08-19 05:12:28', '2019-08-19 05:12:28'),
(1080, 3, 50, '2019-08-19 05:12:28', '2019-08-19 05:12:28'),
(1081, 3, 53, '2019-08-19 05:12:29', '2019-08-19 05:12:29'),
(1082, 3, 54, '2019-08-19 05:12:29', '2019-08-19 05:12:29'),
(1083, 3, 55, '2019-08-19 05:12:29', '2019-08-19 05:12:29'),
(1084, 3, 57, '2019-08-19 05:12:29', '2019-08-19 05:12:29'),
(1085, 3, 58, '2019-08-19 05:12:29', '2019-08-19 05:12:29'),
(1086, 3, 59, '2019-08-19 05:12:29', '2019-08-19 05:12:29'),
(1087, 3, 60, '2019-08-19 05:12:29', '2019-08-19 05:12:29'),
(1131, 7, 58, '2019-08-19 13:03:11', '2019-08-19 13:03:11'),
(1132, 7, 60, '2019-08-19 13:03:11', '2019-08-19 13:03:11'),
(1133, 7, 62, '2019-08-19 13:03:11', '2019-08-19 13:03:11'),
(1233, 4, 17, '2019-08-22 03:19:21', '2019-08-22 03:19:21'),
(1234, 4, 25, '2019-08-22 03:19:21', '2019-08-22 03:19:21'),
(1235, 4, 63, '2019-08-22 03:19:21', '2019-08-22 03:19:21'),
(1236, 4, 64, '2019-08-22 03:19:21', '2019-08-22 03:19:21'),
(1237, 4, 65, '2019-08-22 03:19:21', '2019-08-22 03:19:21'),
(1238, 4, 66, '2019-08-22 03:19:21', '2019-08-22 03:19:21'),
(1239, 5, 25, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1240, 5, 26, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1241, 5, 49, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1242, 5, 50, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1243, 5, 51, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1244, 5, 52, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1245, 5, 58, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1246, 5, 60, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1247, 5, 62, '2019-08-22 08:55:06', '2019-08-22 08:55:06'),
(1298, 1, 1, '2019-08-23 12:03:11', '2019-08-23 12:03:11'),
(1299, 1, 2, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1300, 1, 3, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1301, 1, 4, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1302, 1, 5, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1303, 1, 6, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1304, 1, 7, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1305, 1, 8, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1306, 1, 9, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1307, 1, 10, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1308, 1, 11, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1309, 1, 12, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1310, 1, 17, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1311, 1, 18, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1312, 1, 19, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1313, 1, 20, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1314, 1, 25, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1315, 1, 26, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1316, 1, 30, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1317, 1, 31, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1318, 1, 32, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1319, 1, 33, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1320, 1, 34, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1321, 1, 35, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1322, 1, 36, '2019-08-23 12:03:12', '2019-08-23 12:03:12'),
(1323, 1, 37, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1324, 1, 45, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1325, 1, 46, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1326, 1, 47, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1327, 1, 48, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1328, 1, 49, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1329, 1, 50, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1330, 1, 51, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1331, 1, 52, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1332, 1, 53, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1333, 1, 54, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1334, 1, 55, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1335, 1, 56, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1336, 1, 57, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1337, 1, 58, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1338, 1, 59, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1339, 1, 60, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1340, 1, 61, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1341, 1, 62, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1342, 1, 63, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1343, 1, 64, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1344, 1, 65, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1345, 1, 66, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1346, 1, 67, '2019-08-23 12:03:13', '2019-08-23 12:03:13'),
(1347, 1, 68, '2019-08-23 12:03:14', '2019-08-23 12:03:14'),
(1348, 1, 69, '2019-08-23 12:03:14', '2019-08-23 12:03:14'),
(1349, 1, 70, '2019-08-23 12:03:14', '2019-08-23 12:03:14'),
(1350, 1, 71, '2019-08-23 12:03:14', '2019-08-23 12:03:14');

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(10) UNSIGNED NOT NULL,
  `suppliername` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `suppliercode` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` (`id`, `suppliername`, `suppliercode`, `phone`, `address`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(1, 'PT Jadoba Sukses', 'SC01', '021-2371835', 'JKT', 'superadmin', NULL, '2019-08-14 17:00:00', '2019-08-14 17:00:00'),
(2, 'CV. INTI SUPPLIES MEGA PERKASA', 'SC02', '021-2398342', 'BEKASI', 'superadmin', NULL, '2019-08-22 17:00:00', '2019-08-22 17:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` int(10) UNSIGNED NOT NULL,
  `totalamount` double NOT NULL,
  `depositeamount` double NOT NULL,
  `remainingamount` double NOT NULL,
  `deposite_by` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deposite_date` date NOT NULL,
  `bank_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `password`, `last_login`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Grocery System', 'admin', 'nagarikbazar@gmail.com', '$2y$10$lIKCIfwU/4/PMkUDOQYXdOv5TNZBfFGl5XnD/N.PIOF8Tu/ChAAc2', '2019-08-17 17:38:29', 1, 'wDrjZjASi38Fy6YclWb1UWyNJXNvQXFch6oWDUD4ySQlW9npoZ2UPWq3DtCv', '2017-06-05 21:35:29', '2019-08-17 10:38:29'),
(2, 'User Admin', 'user', 'nagarikbazar1@testtest.com', '$2y$10$RJobR0XNPlyFr0XL5ENkg./R.lw2yRmxQoU6EW9nntGASaZ89xzQe', '2017-10-29 09:27:32', 1, 't4d8hhkDCOcbq3ASUlkwEHtPb69jZoq16Kl53SpfR9CkHxQd8HW8NwcyghQu', '2017-06-06 19:47:19', '2017-10-29 03:42:32'),
(3, 'Gabriella Victoria', 'superadmin', 'superadmin@admin.com', '$2y$10$ROdiCcEXsvVJ9hioUAj8oudCdtwluwgRh/hqW8PCUJBd/q/9Mseoy', '2019-08-23 21:13:34', 1, 'ItpzoAXKNbUwBlSphw6kwyKiZPG7gBnnciIMbrV0E5x9jbuOlli6BecknVJU', '2019-07-29 06:16:03', '2019-08-23 14:13:34'),
(5, 'maintenancemanager', 'maintenancemanager', 'maintenancecpm@gmail.com', '$2y$10$1sH/G5LIxjb0Fll.HraG6uPcir4aAEmq/TrykLXPhpCaXFYTfIyOa', '2019-08-22 15:54:00', 1, 'gwmZIxOnnHi1Zk7A3bHrCv78pU3cypZOz0FNfTQ1KqOnP4KFmdVV6JKMx3kf', '2019-08-17 09:36:02', '2019-08-22 08:54:00'),
(6, 'maintenancestaff', 'maintenancestaff', 'maintenancestaff@gmail.com', '$2y$10$feJLvsD5P5yt57ZNIM072.BqqZIChOcBwKs4VZEdm1N3lyrKzkBey', '2019-08-17 21:18:47', 1, 'yeJcqDbLpOqcZmF7B3y7PEt8EpaZepQuQlncgicJzW8V0gyWRYohUMi2LojY', '2019-08-17 11:31:47', '2019-08-17 14:18:47'),
(7, 'Finance', 'finance', 'financecpm@gmail.com', '$2y$10$WjRLyDGtCh4wG1cARJsm3uV543Cn.nmNo1vbzg5mLl/ZhGhoT5UHa', '2019-08-22 15:53:23', 1, '9qLsOAKCStUg2ETcLKDerVdC6r0WijMZDPtymvPmrI7iVjUJaV5NhKkvkJuy', '2019-08-19 13:02:20', '2019-08-22 08:53:23'),
(8, 'Purchasing', 'purchasing', 'purchasingcpm@gmail.com', '$2y$10$qmGr/LgUygA0IDA6ztGihujxyhpVzWwxtsCcUa3s/rr0YL/.Kygwm', '2019-08-22 15:55:15', 1, 'HMUNVQ2qSEHx20XqoEkdlNp7Mil9SJKIVgZLeOlpd4bhJwlfWVeHMsqlxbCg', '2019-08-19 13:27:16', '2019-08-22 08:55:15'),
(9, 'Warehouse Staff', 'warehousestaff', 'warehousecpm@gmail.com', '$2y$10$6DbQ4mnSSVZedWsH3.Ye5OzDj4UmWQ0PQRXvSZJsQVN43gFt8FtlG', '2019-08-22 10:19:31', 1, 'mUa62G2fLPKHx5P4vbUn7RSdm3sAM97HEnzfyTGFXoSWeHKUdiQLSV9hKnAv', '2019-08-22 03:16:36', '2019-08-22 03:19:31');

-- --------------------------------------------------------

--
-- Table structure for table `user_roles`
--

CREATE TABLE `user_roles` (
  `id` int(10) UNSIGNED NOT NULL,
  `role_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `user_roles`
--

INSERT INTO `user_roles` (`id`, `role_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, '2017-06-05 21:35:29', '2017-06-05 21:35:29'),
(2, 2, 2, '2017-06-06 19:47:19', '2017-06-06 19:47:19'),
(3, 1, 3, '2019-07-29 06:16:03', '2019-07-29 06:16:03'),
(5, 3, 5, '2019-08-17 09:36:02', '2019-08-17 09:36:02'),
(6, 6, 6, '2019-08-17 11:31:47', '2019-08-17 11:31:47'),
(7, 7, 7, '2019-08-19 13:02:20', '2019-08-19 13:02:20'),
(8, 5, 8, '2019-08-19 13:27:16', '2019-08-19 13:27:16'),
(9, 4, 9, '2019-08-22 03:16:36', '2019-08-22 03:16:36');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(10) UNSIGNED NOT NULL,
  `bahanmros_id` int(10) UNSIGNED NOT NULL,
  `qty` int(11) NOT NULL,
  `stock` int(11) DEFAULT NULL,
  `limit_stock` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(125) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `created_by` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `modified_by` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `bahanmros_id`, `qty`, `stock`, `limit_stock`, `location`, `status`, `created_by`, `modified_by`, `created_at`, `updated_at`) VALUES
(13, 13, 44, 32, '1', 'b5', 1, 'superadmin', 'superadmin', '2019-08-22 02:56:48', '2019-08-22 16:00:03'),
(15, 14, 12, 2, '15', 'Rak A3', 1, 'superadmin', NULL, '2019-08-22 03:14:52', '2019-08-22 03:15:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bahanmros`
--
ALTER TABLE `bahanmros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_code_unique` (`partnumber`),
  ADD KEY `products_productcategory_id_foreign` (`productcategory_id`),
  ADD KEY `products_created_by_foreign` (`created_by`),
  ADD KEY `products_modified_by_foreign` (`modified_by`);

--
-- Indexes for table `detailpos`
--
ALTER TABLE `detailpos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `salescarts_product_id_foreign` (`pr_id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_created_by_foreign` (`created_by`),
  ADD KEY `expenses_modified_by_foreign` (`modified_by`);

--
-- Indexes for table `expensestitles`
--
ALTER TABLE `expensestitles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `modules`
--
ALTER TABLE `modules`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `modules_name_unique` (`name`),
  ADD UNIQUE KEY `modules_module_key_unique` (`module_key`),
  ADD UNIQUE KEY `modules_module_url_unique` (`module_url`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_unique` (`name`),
  ADD UNIQUE KEY `permissions_permission_key_unique` (`permission_key`);

--
-- Indexes for table `pos`
--
ALTER TABLE `pos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_product_id_foreign` (`pr_id`);

--
-- Indexes for table `prs`
--
ALTER TABLE `prs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foreignkey` (`requestfp_id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_created_by_foreign` (`created_by`),
  ADD KEY `purchases_modified_by_foreign` (`modified_by`);

--
-- Indexes for table `requestfps`
--
ALTER TABLE `requestfps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `foreignkey` (`norfps`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_modules`
--
ALTER TABLE `role_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_modules_role_id_foreign` (`role_id`),
  ADD KEY `role_modules_module_id_foreign` (`module_id`);

--
-- Indexes for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permissions_role_id_foreign` (`role_id`),
  ADD KEY `role_permissions_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `productcategories_created_by_foreign` (`created_by`),
  ADD KEY `productcategories_modified_by_foreign` (`modified_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_created_by_foreign` (`created_by`),
  ADD KEY `transactions_modified_by_foreign` (`modified_by`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_roles_role_id_foreign` (`role_id`),
  ADD KEY `user_roles_user_id_foreign` (`user_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_productcategory_id_foreign` (`bahanmros_id`),
  ADD KEY `products_created_by_foreign` (`created_by`),
  ADD KEY `products_modified_by_foreign` (`modified_by`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bahanmros`
--
ALTER TABLE `bahanmros`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `detailpos`
--
ALTER TABLE `detailpos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `expensestitles`
--
ALTER TABLE `expensestitles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `modules`
--
ALTER TABLE `modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- AUTO_INCREMENT for table `pos`
--
ALTER TABLE `pos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `prs`
--
ALTER TABLE `prs`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `requestfps`
--
ALTER TABLE `requestfps`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `role_modules`
--
ALTER TABLE `role_modules`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT for table `role_permissions`
--
ALTER TABLE `role_permissions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1351;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user_roles`
--
ALTER TABLE `user_roles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bahanmros`
--
ALTER TABLE `bahanmros`
  ADD CONSTRAINT `products_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `products_productcategory_id_foreign` FOREIGN KEY (`productcategory_id`) REFERENCES `productcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `detailpos`
--
ALTER TABLE `detailpos`
  ADD CONSTRAINT `salescarts_product_id_foreign` FOREIGN KEY (`pr_id`) REFERENCES `bahanmros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `expenses_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `expenses_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `pos`
--
ALTER TABLE `pos`
  ADD CONSTRAINT `sales_product_id_foreign` FOREIGN KEY (`pr_id`) REFERENCES `bahanmros` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `role_modules`
--
ALTER TABLE `role_modules`
  ADD CONSTRAINT `role_modules_module_id_foreign` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_modules_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `role_permissions`
--
ALTER TABLE `role_permissions`
  ADD CONSTRAINT `role_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `role_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `productcategories_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `productcategories_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE,
  ADD CONSTRAINT `transactions_modified_by_foreign` FOREIGN KEY (`modified_by`) REFERENCES `users` (`username`) ON UPDATE CASCADE;

--
-- Constraints for table `user_roles`
--
ALTER TABLE `user_roles`
  ADD CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
