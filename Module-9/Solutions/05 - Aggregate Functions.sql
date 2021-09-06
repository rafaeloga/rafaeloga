{"version":"NotebookV1","origId":3623476344927655,"name":"05 - Aggregate Functions","language":"sql","commands":[{"version":"CommandV1","origId":3623476344927656,"guid":"68e7d1c0-460a-48e8-be7a-7d862bd4e25f","subtype":"command","commandType":"auto","position":1.0,"command":"\n%md-sandbox\n\n<div style=\"text-align: center; line-height: 0; padding-top: 9px;\">\n  <img src=\"https://databricks.com/wp-content/uploads/2018/03/db-academy-rgb-1200px.png\" alt=\"Databricks Learning\" style=\"width: 600px\">\n</div>","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"69c36035-717a-4556-94f0-da5a1fca7e1f"},{"version":"CommandV1","origId":3623476344927657,"guid":"5b84f41e-2a43-482d-9005-3e18d2eb8142","subtype":"command","commandType":"auto","position":2.0,"command":"%md\n## Create Tables\nRun the cell below to create tables for the questions in this notebook. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"99c323d9-e939-4d38-b721-d998ec6ce450"},{"version":"CommandV1","origId":3623476344927658,"guid":"2535fd86-cdef-4aca-8e1a-5cbe96046e94","subtype":"command","commandType":"auto","position":3.0,"command":"%run ../Utilities/05-CreateTables","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"5c4bf803-5ee1-4410-9a06-d3222a91e5c3"},{"version":"CommandV1","origId":3623476344927659,"guid":"df86998f-496e-43d4-85c1-0f9c0ba34338","subtype":"command","commandType":"auto","position":4.0,"command":"%md\n## Question 1: Min Function\n### Summary\nCompute the minimum value from the **`Amount`** field for each unique value in the **`TrueFalse`** field in the table **`revenue1`**.\n\n### Steps to complete\nWrite a SQL query that achieves the following: \n* Computes the number of **`true`** and **`false`** records in the **`TrueFalse`** field from the table **`revenue1`**\n* Renames the new column to **`count`**\n* Store the records in a temporary view named  **`q1Results`** with the following schema:\n\n| column | type |\n|--------|--------|\n| TrueFalse | boolean |\n| MinAmount | int |\n\nA properly completed solution should produce a view similar to this sample output:\n\n|TrueFalse|         count |\n|---------|------------------|\n|     true|        4956|\n|    false|        5044|","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"42da9553-c88c-4e0c-a5f6-aa2f8b747944"},{"version":"CommandV1","origId":3623476344927660,"guid":"03b3bb20-56a8-407b-ae24-6c9a6de8eca4","subtype":"command","commandType":"auto","position":5.0,"command":"--ANSWER\nCREATE OR REPLACE TEMPORARY VIEW q1Results AS\n  SELECT count(*) AS count FROM revenue1\n  GROUP BY TrueFalse;\n\nSELECT * FROM q1Results;\n  ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"19b21d1e-f55d-4caa-bb85-03846381ed10"},{"version":"CommandV1","origId":3623476344927661,"guid":"ca583e69-13ef-4b78-aaf1-0d894ace7225","subtype":"command","commandType":"auto","position":6.0,"command":"%md\n## Question 2: Max Function\n### Summary\nCompute the maximum value from the **`Amount`** field for each unique value in the **`TrueFalse`** field in the table **`revenue2`**.\n\n### Steps to complete\n* Computes the maximum **`Amount`** for **`True`** records and **`False`** records from the **`TrueFalse`** field from the table **`revenue2`**\n* Renames the new column to **`maxAmount`**\n* Store the records in a temporary view named  **`q2Results`** with the following schema:\n   \n| column | type |\n|--------|--------|\n| TrueFalse | boolean |\n| maxAmount | double |\n\nA properly completed solution should produce a DataFrame similar to this sample output:\n\n|TrueFalse|         MaxAmount|\n|---------|------------------|\n|     true|        2243937.93|\n|    false|2559457.1799999997|","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"20c9f6cc-46ff-4ddb-a3d2-b69b01523fd3"},{"version":"CommandV1","origId":3623476344927662,"guid":"f279592e-f18e-4479-a6a0-709633d8f10d","subtype":"command","commandType":"auto","position":7.0,"command":"--ANSWER\nCREATE OR REPLACE TEMPORARY VIEW q2results AS\n  SELECT TrueFalse, max(Amount) AS MaxAmount \n  FROM revenue2\n  GROUP BY TrueFalse;\n  \nSELECT * FROM q2Results;\n","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"6dabde91-f5be-4544-9cb7-5e2ca1511a78"},{"version":"CommandV1","origId":3623476344927663,"guid":"06fadcb2-d021-4fc5-922b-89e5ac265d0d","subtype":"command","commandType":"auto","position":8.0,"command":"%md\n## Question 3: Avg Function\n### Summary\nCompute the average of the **`Amount`** field for each unique value in the **`TrueFalse`** field in the table **`revenue3`**.\n\n### Steps to complete\n\n* Computes the average of **`Amount`** for **`True`** records and **`False`** records from the **`TrueFalse`** field in the table **`revenue3`**.\n* Renames the new column to **`avgAmount`**\n* Store the records in a temporary view named  **`q3Results`** with the following schema:\n\n| column | type |\n|--------|--------|\n| TrueFalse | boolean |\n| avgAmount | double |\n\nA properly completed solution should produce a DataFrame similar to this sample output:\n\n|TrueFalse|         AvgAmount|\n|---------|------------------|\n|     true|        2243937.93|\n|    false|2559457.1799999997|","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"2045d4cb-0fca-406d-b96d-c5c6079cacc7"},{"version":"CommandV1","origId":3623476344927664,"guid":"915a5909-d1cd-4593-a09a-36905bba0b06","subtype":"command","commandType":"auto","position":9.0,"command":"-- ANSWER\nCREATE OR REPLACE TEMPORARY VIEW q3Results AS\n  SELECT TrueFalse, avg(Amount) AS AvgAmount \n  FROM revenue3\n  GROUP BY TrueFalse;\n\nSELECT * FROM q3Results;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"ba3b612d-ddd3-4802-853c-1b6bcca73fe3"},{"version":"CommandV1","origId":3623476344927665,"guid":"5480ebb1-22f7-404d-ab96-da97555ae58f","subtype":"command","commandType":"auto","position":10.0,"command":"%md\n## Question 4: Pivot\n### Summary\nCalculate the total **`Amount`** for **`YesNo`** values of **true** and **false** in 2002 and 2003 from the table **`revenue4`**.\n    \n### Steps to complete\n* Casts the **`UTCTime`** field to Timestamp and names the new column **`Date`**\n* Extracts a **`Year`** column from the **`Date`** column\n* Filters for years greater than 2001 and less than or equal to 2003\n* Groups by **`YesNo`** and creates a pivot table to get the total **`Amount`** for each year and each value in **`YesNo`**\n* Represents each total amount as a float rounded to two decimal places\n* Store the results into a temporary table named **`q4results`**\n   \nA properly completed solution should produce a view similar to this sample output:\n\n|YesNo|    2002|    2003|\n|-----|--------|--------|\n| true| 61632.3| 8108.47|\n|false|44699.99|35062.22|","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"a633aa88-572a-4473-aa61-26a555873a85"},{"version":"CommandV1","origId":3623476344927666,"guid":"7eeeaa18-46ac-4602-a48e-5b8e961daee1","subtype":"command","commandType":"auto","position":11.0,"command":"-- ANSWER\nCREATE OR REPLACE TEMPORARY VIEW q4Results AS\n  SELECT * \n  FROM (SELECT Year, YesNo, Amount\n        FROM (SELECT year(CAST(UTCTime AS timestamp)) as Year,\n                     YesNo,\n                     Amount \n              FROM revenue4) \n        WHERE Year > 2001 AND Year <= 2003)\n  PIVOT ( round( sum(Amount), 2) AS total FOR Year in (2002, 2003) );\n  \n  SELECT * FROM q4Results;\n  \n  ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"51c0c266-9200-4cfb-b4e4-a7d5e7b9546c"},{"version":"CommandV1","origId":3623476344927667,"guid":"14ae0eb8-42f1-4526-84a6-37f800c10066","subtype":"command","commandType":"auto","position":12.0,"command":"%md\n## Question 5: Null Values and Aggregates\n### Summary\nCompute sums of **`amount`** grouped by **`aisle`** after dropping null values from **`products`** table.\n\n### Steps to complete\n\n* Drops any rows that contain null values in either the **`itemId`** or the **`aisle`** column\n* Aggregates sums of the **`amount`** column grouped by **`aisle`**\n* Store the results into a temporary view named  **`q5Results`**","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"85db8b5b-9c43-43f0-99f1-d57ce02ff0ca"},{"version":"CommandV1","origId":3623476344927668,"guid":"7fe7d565-f6bd-4084-886d-e3bbec4347fe","subtype":"command","commandType":"auto","position":13.0,"command":"--ANSWER\nCREATE OR REPLACE TEMPORARY VIEW q5Results AS\n  SELECT aisle, sum(amount) FROM products \n  WHERE (itemId IS NOT NULL AND aisle IS NOT NULL) \n  GROUP BY aisle;\n  \nSELECT * FROM q5Results","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"4b07a42d-96e6-4a46-bedb-473275300a6a"},{"version":"CommandV1","origId":3623476344927669,"guid":"bf2fe59a-e059-4ed6-95ae-2d11806a4930","subtype":"command","commandType":"auto","position":14.0,"command":"%md\n## Question 6: Generate Subtotals By Rollup\n### Summary\nCompute averages of **`income`** grouped by **`itemName`** and **`month`** such that the results include averages across all months as well as a subtotal for an individual month from the **`sales`** table. \n\n### Steps to complete\n\n* Coalesces null values in the **`month`** column generated by the `ROLLUP` clause\n* Store the results into a temporary view named  **`q6Results`**\n\nYour results should look something like this: \n\n| itemName| month | avgRevenue |\n| --------| ----- | ---------- |\n| Anim | 10 | 4794.16 |\n| Anim | 7 | 5551.31 |\n| Anim | All months | 5046.54 |\n| Aute | 4 | 4069.51 |\n| Aute | 7 | 3479.31 |\n| Aute | 8 | 6339.28 |\n| Aute | All months |  4489.41 |\n| ... | ... | ... | ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"fdfc66b4-f144-46f6-aa04-cd1e1be8fe80"},{"version":"CommandV1","origId":3623476344927670,"guid":"b2746211-63ac-47c8-9b1c-b1bad70805e1","subtype":"command","commandType":"auto","position":15.0,"command":"--ANSWER\nCREATE OR REPLACE TEMPORARY VIEW q6Results AS\n  SELECT \n    COALESCE(itemName, \"All items\") AS itemName,\n    COALESCE(month(date), \"All months\") AS month,\n    ROUND(AVG(revenue), 2) as avgRevenue\n  FROM sales\n  GROUP BY ROLLUP (itemName, month(date))\n  ORDER BY itemName, month;\n\nSELECT * FROM q6Results;\n","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"c47a350a-6e0e-4622-91d9-205641660275"},{"version":"CommandV1","origId":3623476344927671,"guid":"b2a55055-996d-4179-96fb-2a3bf6d73e9e","subtype":"command","commandType":"auto","position":16.0,"command":"%md-sandbox\n&copy; 2020 Databricks, Inc. All rights reserved.<br/>\nApache, Apache Spark, Spark and the Spark logo are trademarks of the <a href=\"http://www.apache.org/\">Apache Software Foundation</a>.<br/>\n<br/>\n<a href=\"https://databricks.com/privacy-policy\">Privacy Policy</a> | <a href=\"https://databricks.com/terms-of-use\">Terms of Use</a> | <a href=\"http://help.databricks.com/\">Support</a>","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"ff8aa84f-8998-4f4b-9fd0-8dfdf86de77d"}],"dashboards":[],"guid":"ad64ac56-5c79-4c1f-bdfe-ec9ca5f75986","globalVars":{},"iPythonMetadata":null,"inputWidgets":{},"notebookMetadata":{}}