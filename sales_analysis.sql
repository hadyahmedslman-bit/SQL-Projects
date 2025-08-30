-- Preview Data (عرض أول 1000 صف من جدول المبيعات)
SELECT *
FROM `aesthetic-forge-466408-t7.sales.sales_info`
LIMIT 1000;

-- 1. إجمالي المبيعات لكل منتج
SELECT
  ProductId,
  SUM(UnitPrice * Quantity) AS TotalSales
FROM `aesthetic-forge-466408-t7.sales.sales_info`
GROUP BY ProductId
ORDER BY TotalSales DESC;

-- 2. إجمالي المبيعات لكل متجر
SELECT
  StoreId,
  SUM(UnitPrice * Quantity) AS TotalSales
FROM `aesthetic-forge-466408-t7.sales.sales_info`
GROUP BY StoreId
ORDER BY TotalSales DESC;

-- 3. المبيعات اليومية لكل متجر
SELECT
  StoreId,
  Date,
  SUM(UnitPrice * Quantity) AS DailySales
FROM `aesthetic-forge-466408-t7.sales.sales_info`
GROUP BY StoreId, Date
ORDER BY Date;

-- 4. المبيعات الشهرية لكل منتج
SELECT
  ProductId,
  EXTRACT(YEAR FROM Date) AS Year,
  EXTRACT(MONTH FROM Date) AS Month,
  SUM(UnitPrice * Quantity) AS MonthlySales
FROM `aesthetic-forge-466408-t7.sales.sales_info`
GROUP BY ProductId, Year, Month
ORDER BY Year, Month, ProductId;

-- 5. أفضل 5 منتجات حسب المبيعات
SELECT
  ProductId,
  SUM(UnitPrice * Quantity) AS TotalSales
FROM `aesthetic-forge-466408-t7.sales.sales_info`
GROUP BY ProductId
ORDER BY TotalSales DESC
LIMIT 5;

-- 6. أفضل 5 متاجر حسب المبيعات
SELECT
  StoreId,
  SUM(UnitPrice * Quantity) AS TotalSales
FROM `aesthetic-forge-466408-t7.sales.sales_info`
GROUP BY StoreId
ORDER BY TotalSales DESC
LIMIT 5;

-- 7. تحليل أداء المتاجر (متوسط المبيعات اليومية)
SELECT
  StoreId,
  AVG(UnitPrice * Quantity) AS AvgDailySales
FROM `aesthetic-forge-466408-t7.sales.sales_info`
GROUP BY StoreId
ORDER BY AvgDailySales DESC;
