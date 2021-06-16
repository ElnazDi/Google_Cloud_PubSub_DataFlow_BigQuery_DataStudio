{\rtf1\ansi\ansicpg1252\cocoartf2578
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fnil\fcharset0 Menlo-Regular;}
{\colortbl;\red255\green255\blue255;\red204\green0\blue78;\red255\green255\blue254;\red0\green0\blue0;
\red39\green78\blue204;\red21\green129\blue62;\red42\green55\blue62;\red238\green57\blue24;\red107\green0\blue1;
}
{\*\expandedcolortbl;;\cssrgb\c84706\c10588\c37647;\cssrgb\c100000\c100000\c99608;\cssrgb\c0\c0\c0;
\cssrgb\c20000\c40392\c83922;\cssrgb\c5098\c56471\c30980;\cssrgb\c21569\c27843\c30980;\cssrgb\c95686\c31765\c11765;\cssrgb\c50196\c0\c0;
}
\paperw11900\paperh16840\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\deftab720
\pard\pardeftab720\sl360\partightenfactor0

\f0\fs24 \cf2 \cb3 \expnd0\expndtw0\kerning0
\outl0\strokewidth0 \strokec2 -- 1. How many boroughs are there in London ? \cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  \cf5 \strokec5 DISTINCT\cf4 \strokec4  borough\cb1 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \strokec4 ;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 2. What is the rate of crimes in each borough?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  borough, \cf5 \strokec5 SUM\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  number_of_crimes\cb1 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  borough\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  number_of_crimes \cf5 \strokec5 DESC\cf4 \strokec4 ;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 3. How many LSOA codes are there per borough?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  borough, \cf5 \strokec5 count\cf7 \strokec7 (\cf5 \strokec5 DISTINCT\cf4 \strokec4  lsoa_code\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 as\cf4 \strokec4  n_codes\cb1 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  borough\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  \cf5 \strokec5 count\cf7 \strokec7 (\cf5 \strokec5 DISTINCT\cf4 \strokec4  lsoa_code\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 DESC\cf4 \strokec4 ;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 4. How many crimes have happend per year in London from 2008 to 2016?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  year, \cf5 \strokec5 sum\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  \cf6 \strokec6 `total_crime`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 WHERE\cf4 \strokec4  year \cf5 \strokec5 BETWEEN\cf4 \strokec4  \cf8 \strokec8 2008\cf4 \strokec4  \cf5 \strokec5 AND\cf4 \strokec4  \cf8 \strokec8 2016\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  year\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  total_crime \cf5 \strokec5 DESC\cf4 \strokec4 ; \cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 5. What is the overall volume of the different crimes in London?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  year, major_category, \cf5 \strokec5 sum\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  \cf6 \strokec6 `total_crime`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  year, major_category\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  year, total_crime \cf5 \strokec5 DESC\cf4 \strokec4 ;\cb1 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 6. How are the crimes in Croydon over the whole time period?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  year, \cf5 \strokec5 sum\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  \cf6 \strokec6 `total_crime`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 WHERE\cf4 \strokec4  \cf9 \strokec9 borough\cf4 \strokec4  = \cf6 \strokec6 'Croydon'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  year\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  total_crime \cf5 \strokec5 DESC\cf4 \strokec4 ;\cb1 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 7. What is the order of major crime categories for Croydon in 2012 that most of the crimes has happened in that year?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  major_category, \cf5 \strokec5 sum\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  \cf6 \strokec6 `total_crime`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 WHERE\cf4 \strokec4  \cf9 \strokec9 borough\cf4 \strokec4  = \cf6 \strokec6 'Croydon'\cf4 \strokec4  \cf5 \strokec5 AND\cf4 \strokec4  \cf9 \strokec9 year\cf4 \strokec4  = \cf8 \strokec8 2012\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  major_category\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  total_crime \cf5 \strokec5 DESC\cf4 \strokec4 ;\cb1 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 8. What type of crimes are growing fastest? (by finding the total crime counts for the major categories across all the years in the data set)\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  year, major_category, \cf5 \strokec5 SUM\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  \cf6 \strokec6 `total_crime`\cf4 \strokec4  \cb1 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  major_category, year\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  major_category, year;\cb1 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 9. What are the different types of crimes and their quantity per year?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  year, major_category, \cf5 \strokec5 SUM\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  \cf6 \strokec6 `total_crime`\cf4 \strokec4  \cb1 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 WHERE\cf4 \strokec4  year \cf5 \strokec5 BETWEEN\cf4 \strokec4  \cf8 \strokec8 2008\cf4 \strokec4  \cf5 \strokec5 AND\cf4 \strokec4  \cf8 \strokec8 2016\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  major_category, year\cb1 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  major_category, year;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 10. What are the minor categories in Theft and Handling?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \strokec4  major_category, minor_category, year,\cf5 \strokec5 SUM\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  total_possesions\cb1 \
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 WHERE\cf4 \strokec4  \cf9 \strokec9 major_category\cf4 \strokec4 =\cf6 \strokec6 'Theft and Handling'\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  \cf8 \strokec8 1\cf4 \strokec4 ,\cf8 \strokec8 2\cf4 \strokec4 ,\cf8 \strokec8 3\cf4 \cb1 \strokec4 \
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  \cf8 \strokec8 3\cf4 \strokec4  \cf5 \strokec5 DESC\cf4 \strokec4 ;\cb1 \
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 11. What is the change in the number of crime incidents from 2011 to 2016?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   borough,\cb1 \
\cb3   no_crimes_2011,\cb1 \
\cb3   no_crimes_2016,\cb1 \
\cb3   no_crimes_2016 \cf7 \strokec7 -\cf4 \strokec4  no_crimes_2011 \cf5 \strokec5 AS\cf4 \strokec4  change,\cb1 \
\cb3   \cf5 \strokec5 ROUND\cf7 \strokec7 (((\cf4 \strokec4 no_crimes_2016 \cf7 \strokec7 -\cf4 \strokec4  no_crimes_2011\cf7 \strokec7 )\cf4 \strokec4  \cf7 \strokec7 /\cf4 \strokec4  no_crimes_2016\cf7 \strokec7 )\cf4 \strokec4  \cf7 \strokec7 *\cf4 \strokec4  \cf8 \strokec8 100\cf4 \strokec4 , \cf8 \strokec8 2\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  perc_change\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf7 \strokec7 (\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 SELECT\cf4 \cb1 \strokec4 \
\cb3     borough,\cb1 \
\cb3     \cf5 \strokec5 SUM\cf7 \strokec7 (\cf5 \strokec5 IF\cf7 \strokec7 (\cf9 \strokec9 year\cf4 \strokec4 =\cf8 \strokec8 2011\cf4 \strokec4 , value, \cf5 \strokec5 NULL\cf7 \strokec7 ))\cf4 \strokec4  no_crimes_2011,\cb1 \
\cb3     \cf5 \strokec5 SUM\cf7 \strokec7 (\cf5 \strokec5 IF\cf7 \strokec7 (\cf9 \strokec9 year\cf4 \strokec4 =\cf8 \strokec8 2016\cf4 \strokec4 , value, \cf5 \strokec5 NULL\cf7 \strokec7 ))\cf4 \strokec4  no_crimes_2016\cb1 \
\cb3   \cf5 \strokec5 FROM\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \cb1 \strokec4 \
\cb3     borough \cf7 \strokec7 )\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   perc_change \cf5 \strokec5 ASC\cf4 \strokec4 ;\cb1 \
\
\
\pard\pardeftab720\sl360\partightenfactor0
\cf2 \cb3 \strokec2 -- 12. What are the top 3 crimes per borough?\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 SELECT\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   borough,\cb1 \
\cb3   major_category,\cb1 \
\cb3   rank_per_borough,\cb1 \
\cb3   no_of_incidents\cb1 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 FROM\cf4 \strokec4  \cf7 \strokec7 (\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   \cf5 \strokec5 SELECT\cf4 \cb1 \strokec4 \
\cb3     borough,\cb1 \
\cb3     major_category,\cb1 \
\cb3     \cf5 \strokec5 RANK\cf7 \strokec7 ()\cf4 \strokec4  \cf5 \strokec5 OVER\cf7 \strokec7 (\cf5 \strokec5 PARTITION\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  borough \cf5 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \strokec4  \cf5 \strokec5 SUM\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 DESC\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  rank_per_borough,\cb1 \
\cb3     \cf5 \strokec5 SUM\cf7 \strokec7 (\cf4 \strokec4 value\cf7 \strokec7 )\cf4 \strokec4  \cf5 \strokec5 AS\cf4 \strokec4  no_of_incidents\cb1 \
\cb3   \cf5 \strokec5 FROM\cf4 \cb1 \strokec4 \
\cb3     \cf6 \strokec6 `dataengineering-315913.londoncrime.fromGCE_13M`\cf4 \cb1 \strokec4 \
\cb3   \cf5 \strokec5 GROUP\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \cb1 \strokec4 \
\cb3     borough,\cb1 \
\cb3     major_category \cf7 \strokec7 )\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 WHERE\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   rank_per_borough \cf7 \strokec7 <=\cf4 \strokec4  \cf8 \strokec8 3\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf5 \cb3 \strokec5 ORDER\cf4 \strokec4  \cf5 \strokec5 BY\cf4 \cb1 \strokec4 \
\pard\pardeftab720\sl360\partightenfactor0
\cf4 \cb3   borough,\cb1 \
\cb3   rank_per_borough;\cb1 \
\
}