--Combine first name and Second name
SELECT first_name || ' ' || last_name AS full_name, email
FROM donation_data;

--Total donations made was 249085
SELECT SUM(donation) AS sum_don
FROM donation_data;

--Total donation by Gender, the result shows Male has the highest donation of 127628
--and female has 121457
SELECT gender, SUM(donation) AS sum_don
FROM donation_data
GROUP BY gender
ORDER BY gender DESC;

--Number and total number of donations by gender shows that
--males have the highest donations, there are more female donor than male
SELECT gender, COUNT(*) AS num_don, SUM(donation) AS sum_don
FROM donation_data
GROUP BY gender
ORDER BY num_don;

--Total donation made by frequency of donation was topped by Yearly with 35266
--and the least to be monthly with 26870
SELECT d.donation_frequency, Sum(dd.donation) AS sum_don
FROM donor_data AS d
INNER JOIN donation_data AS dd
ON d.id = dd.id
GROUP BY d.donation_frequency
ORDER BY sum_don DESC;

--Number and total donations by job_field
--Business Development has a high number of donors
--while Human Resources has a high sum of donations
SELECT job_field, COUNT(*) AS num_don, SUM(donation) AS sum_don
From donation_data
GROUP BY job_field
ORDER BY num_don DESC;

--Total donations and number of donations above $200 was sum of 205892
--and count of 586
SELECT COUNT(*) AS num_don, SUM(donation) AS sum_don
FROM donation_data 
WHERE donation > 200;

--Total donations and number of donations below $200 was a sum of 42593
--and count of 411
SELECT COUNT(*) AS num_don, SUM(donation) AS sum_don
FROM donation_data
WHERE donation < 200;

--Top 10 states with highest donations has California with the greatest donation(30264)
SELECT state, COUNT(*) AS num_don, SUM(donation) AS sum_don
FROM donation_data
GROUP BY state
ORDER BY sum_don DESC
LIMIT 10;

--Top 10 states with lowest donations has Wyoming with the sum of 232 as donation
SELECT state, SUM(donation) AS sum_don
FROM donation_data 
GROUP BY state
ORDER BY sum_don
LIMIT 10;

--Top cars driven by highest donors has Ford with the highest(22706)
--and Foose with the lowest(69)
SELECT d.car, SUM(dd.donation) AS sum_don
FROM donor_data AS d
INNER JOIN donation_data AS dd
ON d.id = dd.id
GROUP BY car
ORDER BY sum_don DESC;