{"version":"NotebookV1","origId":3623476344927280,"name":"6.2 Aggregating and Summarizing Data","language":"sql","commands":[{"version":"CommandV1","origId":3623476344927281,"guid":"70654a16-3632-439e-bc42-38d06cd0d3ed","subtype":"command","commandType":"auto","position":1.0,"command":"\n%md-sandbox\n\n<div style=\"text-align: center; line-height: 0; padding-top: 9px;\">\n  <img src=\"https://databricks.com/wp-content/uploads/2018/03/db-academy-rgb-1200px.png\" alt=\"Databricks Learning\" style=\"width: 600px\">\n</div>","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"c0252c9e-7714-4f46-9c67-2795fc6c2708"},{"version":"CommandV1","origId":3623476344927282,"guid":"bd93de1c-0729-4fb9-bb14-2e14c398fe3d","subtype":"command","commandType":"auto","position":2.0,"command":"%md\n## Aggregating and summarizing data\n\nNow let's look at some powerful functions we can use to aggregate and summarize data. In this notebook, we will continue to work with hihger-order functions; this time we will apply them to arrays containing numerical data. Also, we will work with additional functions in Spark SQL  that can be helpful when presenting data. \n\nIn this notebook, you will: \n* Apply higher-order functions to numeric data\n* Use a `PIVOT` command to create Pivot tables\n* Use `ROLLUP` and `CUBE` modifiers to generate subtotals\n* Use window functions to perform operations on a group of rows\n* Use Databricks visualization tools to visualize and share data\n\nRun the cell below to set up our classroom environment.","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"d4db12a8-ebc4-4282-b293-581ae17f4da6"},{"version":"CommandV1","origId":3623476344927283,"guid":"3224af2c-25fb-4c50-bb04-dd7b17e5e169","subtype":"command","commandType":"auto","position":3.0,"command":"%run ../Includes/Classroom-Setup","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"255a08a5-cca8-4843-ab77-3f4698111c6a"},{"version":"CommandV1","origId":3623476344927284,"guid":"5b71e30f-9fad-4d57-bb6a-f8cfce90fbb8","subtype":"command","commandType":"auto","position":4.0,"command":"%md\n## Higher-order functions and numerical data\n\nEach of the higher-order functions we worked with in the last lesson can also be used with numerical data. In this lesson, we demonstrate how each of the functions in the previous lesson work with numeric data, as well as explore some powerful new higher-order functions.\n\nRun the next two cells to create and describe the table we will be working with. You may recognize this table from a previous lesson. Recall that it contains data measuring environmental variability in a collection of data centers. The table `DeviceData` contains the `temps` and `co2Level` arrays we use to demonstrate higher-order functions. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"2d2560a2-317d-4072-9bc0-ed8d434c9df9"},{"version":"CommandV1","origId":3623476344927285,"guid":"a8b5b0b9-8b35-4957-81dd-bbbfec1d4788","subtype":"command","commandType":"auto","position":5.0,"command":"DROP TABLE IF EXISTS DCDataRaw;\nCREATE TABLE DCDataRaw\nUSING parquet                           \nOPTIONS (\n    PATH \"/mnt/training/iot-devices/data-centers/2019-q2-q3\"\n    );\n    \nCREATE TABLE IF NOT EXISTS DeviceData     \nUSING parquet                               \nWITH ExplodeSource                        \nAS\n  (\n  SELECT \n  dc_id,\n  to_date(date) AS date,\n  EXPLODE (source)\n  FROM DCDataRaw\n  )\nSELECT \n  dc_id,\n  key device_type,                         \n  date,\n  value.description,\n  value.ip,\n  value.temps,\n  value.co2_level co2Level\n  \nFROM ExplodeSource;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"49baa086-9289-4119-8d1b-583d5f022ae4"},{"version":"CommandV1","origId":3623476344927286,"guid":"0e471d3d-38c3-4bc1-91cf-2cffadffabdc","subtype":"command","commandType":"auto","position":6.0,"command":"DESCRIBE DeviceData;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"3a432bfe-130c-4114-84f6-800889f9da6f"},{"version":"CommandV1","origId":3623476344927287,"guid":"fbdfa8ef-b2f3-49cc-9c69-42e87211cbf5","subtype":"command","commandType":"auto","position":7.0,"command":"%md\n### Preview data\n\nLet's take a look a sample fo the data so that we con better understand the array values. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"e38dbe54-384a-43dd-abbf-8cbd9c79f844"},{"version":"CommandV1","origId":3623476344927288,"guid":"76a0b14f-bf70-4fbb-bab9-b25ee87e1f4c","subtype":"command","commandType":"auto","position":8.0,"command":"SELECT \n  temps, \n  co2Level\nFROM DeviceData\nTABLESAMPLE (1 ROWS)","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"10bb9430-6cef-420d-aeb8-611710fc5c04"},{"version":"CommandV1","origId":3623476344927289,"guid":"a200a062-6fa5-4a8f-835c-9229f4258bb9","subtype":"command","commandType":"auto","position":9.0,"command":"%md\n### Filter\n\nFilter operates on arrays containing numeric data just the same as those with text data. In this case, let's imagine that we want to collect all temperatures above a given threshold. Run the cell below to view the example. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"1c569c0c-7e3c-43d4-a2e0-133c310b884a"},{"version":"CommandV1","origId":3623476344927290,"guid":"c9799380-d8c1-494f-aaaa-a11aa3af74db","subtype":"command","commandType":"auto","position":10.0,"command":"SELECT \n  temps, \n  FILTER(temps, t -> t > 18) highTemps\nFROM DeviceData\n","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"2f9f9829-2e01-4f3b-b6bd-2aa3d2fe4a7f"},{"version":"CommandV1","origId":3623476344927291,"guid":"361d8369-8540-44eb-a283-5f6b0e7feb9e","subtype":"command","commandType":"auto","position":11.0,"command":"%md\n### Exists\nExists operates on arrays containing numeric data just the same as those with text data. Let's say that we want to flag the records whose temperatures have exceeded a given value. Run the cell below to view the example. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"cb1c224d-bc3d-4069-9ec2-53ac12075ffa"},{"version":"CommandV1","origId":3623476344927292,"guid":"3f169348-bb42-48af-b58d-750f25f80905","subtype":"command","commandType":"auto","position":12.0,"command":"SELECT \n  temps, \n  EXISTS(temps, t -> t > 23) highTempsFlag\nFROM DeviceData","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"b047c992-64d4-4992-8089-30e0275fa205"},{"version":"CommandV1","origId":3623476344927293,"guid":"4db87999-8fef-4ebf-8c0e-51eaf570c07a","subtype":"command","commandType":"auto","position":13.0,"command":"%md-sandbox\n### Transform\n\nWhen using `TRANSFORM` with numeric data, we can apply any built-in function meant to work with a single value or we can name our own set of operations to be applied to each value in the array. This data includes temperature readings taken in Celsius. Each row contains an array of 12 temperature readings. We can use `TRANSFORM` to convert each element of each array to Fahrenheit. To convert from Celsius to Fahrenheit, multiply the temperature in Celsius by 9, divide by 5, and then add 32.\n\nLet's dissect the code below to better understand the function: \n\n`TRANSFORM(temps, t -> ((t * 9) div 5) + 32 ) temps_F`\n\n**`TRANSFORM`** : the name of the higher-order function <br>\n**`temps`** : the name of our input array <br>\n**`t`** : the name of the iterator variable. You choose this name and then use it in the lambda function. It iterates over the array, cycling each value into the function one at a time. <br>\n**`->`** :  Indicates the start of the function <br>\n**` ((t * 9) div 5) + 32`** : This is the function. For each value in the input array, the value is multipled by 9 and then divided by 5. Then, we add 32. This is the formula for converting from Celcius to Fahrenheit.\nRecall that TRANSFORM takes an array, an iterator, and an anonymous function as input. In the code below, temps is the column that holds the array and t is the iterator that cycles through the list. The anonymous function ((t * 9) div 5) + 32 will be applied to each value in the list.\n\n<img alt=\"Side Note\" title=\"Side Note\" style=\"vertical-align: text-bottom; position: relative; height:1.75em; top:0.05em; transform:rotate(15deg)\" src=\"https://files.training.databricks.com/static/images/icon-note.webp\"/> We use [the function](https://spark.apache.org/docs/latest/api/sql/#div) **`div`** to divide one expression by another without including decimal values. This is strictly for neatness in this example. For operations where precision counts, you would use the `/` operator, which performs floating point division. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"a4f11adf-6518-4614-9bd0-977828ea7d01"},{"version":"CommandV1","origId":3623476344927294,"guid":"67d688be-45a6-43a2-9d74-08c81a7cdde2","subtype":"command","commandType":"auto","position":14.0,"command":"SELECT \n  temps temps_C,\n  TRANSFORM (temps, t -> ((t * 9) div 5) + 32 ) temps_F\nFROM DeviceData;\n","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"3df12f67-2d4d-41c5-8fdd-1827455082a8"},{"version":"CommandV1","origId":3623476344927295,"guid":"804fb4fc-0080-4639-9469-45ee0b8de084","subtype":"command","commandType":"auto","position":15.0,"command":"%md-sandbox\n\n### Reduce \n`REDUCE` is more advanced than `TRANSFORM`; it takes two lambda functions. You can use it to reduce the elements of an array to a single value by merging the elements into a buffer, and applying a finishing function on the final buffer. \n\nWe will use the reduce function to find an average value, by day, for our CO<sub>2</sub> readings. Take a closer look at the individual pieces of the `REDUCE` function by reviewing the list below. \n\n`REDUCE(co2_level, 0, (c, acc) -> c + acc, acc ->(acc div size(co2_level)))`\n\n\n**`co2_level`** is the input array<br>\n**`0`** is the starting point for the buffer. Remember, we have to hold a temporary buffer value each time a new value is added to from the array; we start at zero in this case to get an accurate sum of the values in the list. <br>\n**`(c, acc)`** is the list of arguments we'll use for this function. It may be helpful to think of `acc` as the buffer value and `c` as the value that gets added to the buffer.<br>\n**`c + acc`** is the buffer function. As the function iterates over the list, it holds the total (`acc`) and adds the next value in the list (`c`). <br>\n**`acc div size(co2_level)`** is the finishing function. Once we have the sum of all numbers in the array, we divide by the number of elements to find the average. <br>\n\nThis view will be useful in subsequent exercises, so we’ll create a temporary view in this step so that we can access it later on. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"614d829a-3d8f-4c83-8881-5e3d763a6122"},{"version":"CommandV1","origId":3623476344927296,"guid":"8c50fc33-6b74-4149-8e1a-5fd313a1d087","subtype":"command","commandType":"auto","position":16.0,"command":"CREATE OR REPLACE TEMPORARY VIEW Co2LevelsTemporary\nAS\n  SELECT\n    dc_id, \n    device_type,\n    co2Level,\n    REDUCE(co2Level, 0, (c, acc) -> c + acc, acc ->(acc div size(co2Level))) as averageCo2Level\n  \n  FROM DeviceData  \n  SORT BY averageCo2Level DESC;\n\nSELECT * FROM Co2LevelsTemporary","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"d1b8fedf-1436-4bca-a7f8-30f7da8e055f"},{"version":"CommandV1","origId":3623476344927297,"guid":"c392a658-d1cf-4ac6-a526-6a2ef0fc8b8f","subtype":"command","commandType":"auto","position":17.0,"command":"%md\n### Other higher-order functions\nThere are many built-in functions designed to work with array type data and well as other higher-order functions to explore. You can import [this notebook](https://docs.databricks.com/_static/notebooks/apache-spark-2.4-functions.html?_ga=2.12496948.1216795462.1586360468-278368669.1586265166) for a list of examples. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"15046473-b472-47b3-a943-a67144491fa1"},{"version":"CommandV1","origId":3623476344927298,"guid":"5dea6eb2-74f1-49a5-b919-c8597b052162","subtype":"command","commandType":"auto","position":18.0,"command":"%md\n\n### Pivot tables: Example 1\nPivot tables are supported in Spark SQL. A pivot table allows you to transform rows into columns and group by any data field. Let's take a closer look at our query. \n\n**`SELECT * FROM ()`**: The `SELECT` statement inside the parentheses in the input for this table. Note that it takes two columns from the view `Co2LevelsTemporary` <br>\n**`PIVOT`**: The first argument in the clause is an aggregate function and the column to be aggregated. Then, we specify the pivot column in the `FOR` subclause. The `IN` operator contains the pivot column values. <br>","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"002c27eb-9313-4bf6-8e14-6bea243171dc"},{"version":"CommandV1","origId":3623476344927299,"guid":"cfe0c6b4-53c8-4a1f-8c7a-328665b95c0b","subtype":"command","commandType":"auto","position":19.0,"command":"SELECT * FROM (\n  SELECT device_type, averageCo2Level \n  FROM Co2LevelsTemporary\n)\nPIVOT (\n  ROUND(AVG(averageCo2Level), 2) avg_co2 \n  FOR device_type IN ('sensor-ipad', 'sensor-inest', \n    'sensor-istick', 'sensor-igauge')\n  );","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"018bfa07-8c36-466a-ab69-6f99ca5fabef"},{"version":"CommandV1","origId":3623476344927300,"guid":"49dfd3c3-5728-4463-a7b0-b11f99668bab","subtype":"command","commandType":"auto","position":20.0,"command":"%md\n### Pivot Tables: Example 2\n\nIn this example, we again pull data from our larger table `DeviceData`. Within the subquery, we create the `month` column and use the `REDUCE` function to create the `averageCo2Level` column. \n\nIn the pivot, we take the average of of the `averageCo2Level` values grouped by month. Notice that we rename the month columns from their number to the english abbreviations. \n\nLearn more about pivot tables in this [blog post](https://databricks.com/blog/2018/11/01/sql-pivot-converting-rows-to-columns.html).","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"679aa0b9-c5f0-4c9d-add7-d3046df2fb82"},{"version":"CommandV1","origId":3623476344927301,"guid":"ac5c2c2f-6666-495d-8db8-4fcb9c145d98","subtype":"command","commandType":"auto","position":21.0,"command":"SELECT\n  *\nFROM\n  (\n    SELECT\n      month(date) month,\n      REDUCE(co2Level, 0, (c, acc) -> c + acc, acc ->(acc div size(co2Level))) averageCo2Level\n    FROM\n      DeviceData\n  ) PIVOT (\n    avg(averageCo2Level) avg FOR month IN (7 JUL, 8 AUG, 9 SEPT, 10 OCT, 11 NOV)\n  )","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"ca359053-b3d8-42c9-a3d7-42ae9eb5b7ce"},{"version":"CommandV1","origId":3623476344927302,"guid":"8a4d38c0-ce9f-42de-b472-6107283c7a95","subtype":"command","commandType":"auto","position":22.0,"command":"%md-sandbox\n### Rollups\n\nRollups are operators used with the `GROUP BY` clause. They allow you to summarize data based on the columns passed to the `ROLLUP` operator. \n\nThis results of this query include average CO<sub>2</sub> levels, grouped by `dc_id` and `device_type`. Rollups are creating subtotals for a specific group of data. The subtotals introduce new rows, and the new rows will contain `NULL` values for everything other than the calculated subtotal. \n\nWe can alter this by using the `COALESCE()` function introduced in a previous lesson. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"95caa257-db5f-4233-9c54-b0ff4d097924"},{"version":"CommandV1","origId":3623476344927303,"guid":"1367ac0a-e561-4468-9e59-55d4bb775c58","subtype":"command","commandType":"auto","position":23.0,"command":"SELECT \n  COALESCE(dc_id, \"All data centers\") AS dc_id,\n  COALESCE(device_type, \"All devices\") AS device_type,\n  ROUND(AVG(averageCo2Level))  AS avgCo2Level\nFROM Co2LevelsTemporary\nGROUP BY ROLLUP (dc_id, device_type)\nORDER BY dc_id, device_type;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"56246ea7-4ac7-4023-a072-998e0454417b"},{"version":"CommandV1","origId":3623476344927304,"guid":"1e9e9e98-9b02-4e69-b1bd-36e2d0b16273","subtype":"command","commandType":"auto","position":24.0,"command":"%md\n### Cube\n`CUBE` is also an operator used with the `GROUP BY` clause. Similar to `ROLLUP`, you can use `CUBE` to generate summary values for sub-elements grouped by column value. `CUBE` is different than `ROLLUP` in that it will also generate subtotals for all combinations of grouping columns specified in the `GROUP BY` clause. \n\nNotice that the output for the example below shows some of additional values generated in this query. Data from `\"All data centers\"` has been aggregated across device types for all centers. ","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"f4183f69-944d-4f18-977c-f160a35fb8dd"},{"version":"CommandV1","origId":3623476344927305,"guid":"55e1b86d-e1ab-40ca-bfbf-6e0f759c777b","subtype":"command","commandType":"auto","position":25.0,"command":"SELECT \n  COALESCE(dc_id, \"All data centers\") AS dc_id,\n  COALESCE(device_type, \"All devices\") AS device_type,\n  ROUND(AVG(averageCo2Level))  AS avgCo2Level\nFROM Co2LevelsTemporary\nGROUP BY CUBE (dc_id, device_type)\nORDER BY dc_id, device_type;","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"1fb05650-2be8-43dd-bd4a-ac21c4599d5b"},{"version":"CommandV1","origId":3623476344927306,"guid":"8e77c4fe-a2c4-4fed-94e0-1339cc9bf62d","subtype":"command","commandType":"auto","position":26.0,"command":"%run ../Includes/Classroom-Cleanup\n","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"2bc3674b-b11e-43b7-a4a5-a29cca8f648d"},{"version":"CommandV1","origId":3623476344927307,"guid":"04821500-a6a7-4f5b-94b1-ef1f1effc357","subtype":"command","commandType":"auto","position":27.0,"command":"%md-sandbox\n&copy; 2020 Databricks, Inc. All rights reserved.<br/>\nApache, Apache Spark, Spark and the Spark logo are trademarks of the <a href=\"http://www.apache.org/\">Apache Software Foundation</a>.<br/>\n<br/>\n<a href=\"https://databricks.com/privacy-policy\">Privacy Policy</a> | <a href=\"https://databricks.com/terms-of-use\">Terms of Use</a> | <a href=\"http://help.databricks.com/\">Support</a>","commandVersion":0,"state":"finished","results":null,"errorSummary":null,"error":null,"workflows":[],"startTime":0,"submitTime":0,"finishTime":0,"collapsed":false,"bindings":{},"inputWidgets":{},"displayType":"table","width":"auto","height":"auto","xColumns":null,"yColumns":null,"pivotColumns":null,"pivotAggregation":null,"useConsistentColors":false,"customPlotOptions":{},"commentThread":[],"commentsVisible":false,"parentHierarchy":[],"diffInserts":[],"diffDeletes":[],"globalVars":{},"latestUser":"a user","latestUserId":null,"commandTitle":"","showCommandTitle":false,"hideCommandCode":false,"hideCommandResult":false,"isLockedInExamMode":false,"iPythonMetadata":null,"streamStates":{},"datasetPreviewNameToCmdIdMap":{},"nuid":"edb4fbe0-e199-425c-97ba-aeb3e34a8e46"}],"dashboards":[],"guid":"8496a22a-5309-4098-9b40-abc255c652f1","globalVars":{},"iPythonMetadata":null,"inputWidgets":{},"notebookMetadata":{}}