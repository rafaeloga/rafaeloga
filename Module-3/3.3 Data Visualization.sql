{"version":"NotebookV1","origId":3623476344927575,"name":"3.3 Data Visualization","language":"sql","commands":[{"version":"CommandV1","origId":3623476344927576,"guid":"b5bfdf18-5277-497e-b75d-f0edd1b6c43e","subtype":"command","commandType":"auto","position":1.0,"command":"\n%md-sandbox\n\n<div style=\"text-align: center; line-height: 0; padding-top: 9px;\">\n  <img src=\"https://databricks.com/wp-content/uploads/2018/03/db-academy-rgb-1200px.png\" alt=\"Databricks Learning\" style=\"width: 600px\">\n</div>","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"d2277868-0ad0-463e-92ee-a75c30fd0ae5"},{"version":"CommandV1","origId":3623476344927577,"guid":"a083f9fd-d286-4f8e-8edf-fe2a3faeabfa","subtype":"command","commandType":"auto","position":2.0,"command":"%md\n## Data Visualization with Databricks\n\nIn this lesson, you'll learn how to create and share data visualizations in Databricks. \n\nBy the end of the lesson, you will be able to: \n* Create a table with a specified schema\n* Cast a column as a timestamp and extract day, month, or year\n* Use in-notebook visualizations to see your data \n\nStep 1: Read through and run all the cells in this notebook. <br>\nStep 2: View the corresponding video to see instructions for visualizing and sharing data. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"c52d55ad-ccf8-460e-a272-45950352d642"},{"version":"CommandV1","origId":3623476344927578,"guid":"abaf60a9-c820-4bdc-afc5-3ffc4cf487ea","subtype":"command","commandType":"auto","position":3.0,"command":"%md\n## Getting Started\n\nRun the following cell to connect your workspace to the appropriate data source. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"764c1511-daf1-4e4e-a2c0-1d8837df1c0f"},{"version":"CommandV1","origId":3623476344927579,"guid":"dde56549-c648-4179-94f2-0711dce5b1c6","subtype":"command","commandType":"auto","position":4.0,"command":"%run ../Includes/Classroom-Setup","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"ceacf016-082f-4e7a-b7ea-e8c34efacead"},{"version":"CommandV1","origId":3623476344927580,"guid":"f712680e-ed99-4540-b8a4-5bcde87bf712","subtype":"command","commandType":"auto","position":5.0,"command":"%md\n## Create a Table\n\nIn the previous lesson, we created a table for you to start querying. In this lesson, you will create the table by reading directly from the data source and specifying a **schema**. A schema describes the structure of your data. It contains column names and the type of data in each column. All tables must have an associated schema; if you do not explicitly define one, Spark may be able to infer it.  \n\nIn the cell below, we define the schema as we create the table. This data has the following schema: \n\n|Column Name | Type |\n| ---------- | ---- |\n| userId | INT|\n| movieId | INT|\n| rating | FLOAT|\n| timeRecorded | INT|\n\nNotice that it is defined right after the `CREATE TABLE` statement with the name of each column followed by the datatypes within the column. The whole group of columns is surround by parentheses and each individual column is spereated by a comma. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"d5477fcd-f425-41c6-97d7-708b1c3c719a"},{"version":"CommandV1","origId":3623476344927581,"guid":"15ae0239-6abe-43c9-8ec1-3074ce3e75ac","subtype":"command","commandType":"auto","position":6.0,"command":"DROP TABLE IF EXISTS movieRatings;\nCREATE TABLE movieRatings (\n  userId INT,\n  movieId INT,\n  rating FLOAT,\n  timeRecorded INT\n) USING csv OPTIONS (\n  PATH \"/mnt/training/movies/20m/ratings.csv\",\n  header \"true\"\n);","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"86c8188b-75d2-4743-93f8-d26c15d2ef10"},{"version":"CommandV1","origId":3623476344927582,"guid":"03195de9-7773-4e57-9246-c401dee5ebca","subtype":"command","commandType":"auto","position":7.0,"command":"%md\n## Preview the data\n\nThis table contains a little more than 20 million records of movies ratings submitted by users. Note that the timestamp is an integer value recorded in UTC time. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"6c2da148-8550-4b09-b805-25ab2edcd2a6"},{"version":"CommandV1","origId":3623476344927583,"guid":"9f7c1363-807b-40c4-adfb-0a75a7dc485b","subtype":"command","commandType":"auto","position":8.0,"command":"SELECT\n  *\nFROM\n  movieRatings;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"8af7c2af-e44b-42b6-ba08-36ef257f939b"},{"version":"CommandV1","origId":3623476344927584,"guid":"3d9ef77d-dd74-402b-9218-8905ac19fb02","subtype":"command","commandType":"auto","position":9.0,"command":"%md\n## Cast as timestamp\n\nWe use the `CAST()` function to show the timestamp as a human-readable time and date. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"06788bad-99a6-4900-a072-402c22d4d8b4"},{"version":"CommandV1","origId":3623476344927585,"guid":"ad9810ff-f0c7-4ec2-aed1-3018e2d5c4a1","subtype":"command","commandType":"auto","position":10.0,"command":"SELECT\n  rating,\n  CAST(timeRecorded as timestamp)\nFROM\n  movieRatings;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"0d99608f-57a6-4019-af1c-aa536a69df36"},{"version":"CommandV1","origId":3623476344927586,"guid":"22cbae04-aed0-433d-9a04-c547d651ddf5","subtype":"command","commandType":"auto","position":11.0,"command":"%md\n## Create temporary view\nWe will create a temporary view that we can easily refer to the data we want to include in our visualization. For this data, we can investigate whether there are any patterns in the ratings when grouped by month. To do that, we use the `ROUND()` and `AVG()` functions to calculate the average rating and limit it to 3 decimal places. Then, extract the month from the `timeRecorded` column after casting it as a timestamp. The `AVG()` is calculated over the course of a month, as specified in the `GROUP BY` clause. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"ee15e1cf-98e7-435c-be5b-85b16e674ec1"},{"version":"CommandV1","origId":3623476344927587,"guid":"a9a377af-ba56-4977-b992-21b95dffdc83","subtype":"command","commandType":"auto","position":12.0,"command":"CREATE\nOR REPLACE TEMPORARY VIEW ratingsByMonth AS\nSELECT\n  ROUND(AVG(rating), 3) AS avgRating,\n  month(CAST(timeRecorded as timestamp)) AS month\nFROM\n  movieRatings\nGROUP BY\n  month;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"35ce31fb-16ae-4475-88f5-ca69c0b6931a"},{"version":"CommandV1","origId":3623476344927588,"guid":"1b6cfc5f-dab4-426c-8acd-8c440cbf031f","subtype":"command","commandType":"auto","position":13.0,"command":"%md\n## Visualize the data\n\nRun the next cell to see the view we just defined ordered by `avgRating` from least to greatest. The results will appear as a table. In the next section, you will receive video instruction that will show you how to display this table as a chart. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"15a71c3b-51b4-4372-8882-3b13885ad6c7"},{"version":"CommandV1","origId":3623476344927589,"guid":"60e336e6-3cfd-4887-b4b0-b349a0d172d2","subtype":"command","commandType":"auto","position":14.0,"command":"SELECT\n  *\nFROM\n  ratingsByMonth\nORDER BY\n  avgRating;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"76562fad-0c95-4330-892c-19b460395d8a"},{"version":"CommandV1","origId":3623476344927590,"guid":"0a8f4eae-a36f-4d37-8b03-b7c5b4b53069","subtype":"command","commandType":"auto","position":15.0,"command":"%run ../Includes/Classroom-Cleanup","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"aff7c945-16c8-491c-8b86-e60dcb37ed01"},{"version":"CommandV1","origId":3623476344927591,"guid":"5d4cb1a0-3f80-4671-81d3-c12f18331ca6","subtype":"command","commandType":"auto","position":16.0,"command":"%md\n#### Citation\nAccess original data and backround information here: \n\nF. Maxwell Harper and Joseph A. Konstan. 2015. The MovieLens Datasets: History and Context. ACM Transactions on Interactive Intelligent Systems (TiiS) 5, 4, Article 19 (December 2015), 19 pages. DOI=<http://dx.doi.org/10.1145/2827872>\n","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"e841e12c-6f31-4d62-b05a-e5df3cc7a470"},{"version":"CommandV1","origId":3623476344927592,"guid":"ee82fa1f-ce10-4ed4-8630-32bc35c494d3","subtype":"command","commandType":"auto","position":17.0,"command":"%md-sandbox\n&copy; 2020 Databricks, Inc. All rights reserved.<br/>\nApache, Apache Spark, Spark and the Spark logo are trademarks of the <a href=\"http://www.apache.org/\">Apache Software Foundation</a>.<br/>\n<br/>\n<a href=\"https://databricks.com/privacy-policy\">Privacy Policy</a> | <a href=\"https://databricks.com/terms-of-use\">Terms of Use</a> | <a href=\"http://help.databricks.com/\">Support</a>","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"bb95e3dc-8281-4ce1-b5e5-c59525baf068"}],"dashboards":[],"guid":"d9eeea4b-5b70-4f65-84a7-e0b50168fd6f","globalVars":{},"iPythonMetadata":null,"inputWidgets":{},"notebookMetadata":{"pythonIndentUnit":2}}