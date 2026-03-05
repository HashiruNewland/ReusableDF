# Fabric notebook source

# METADATA ********************

# META {
# META   "kernel_info": {
# META     "name": "synapse_pyspark"
# META   },
# META   "dependencies": {}
# META }

# CELL ********************

import sempy.fabric as fabric

# Trigger the refresh
request_id = fabric.refresh_semantic_model(
    dataset="SemPyRefresh",
    workspace="DataflowVariable"
)


# METADATA ********************

# META {
# META   "language": "python",
# META   "language_group": "synapse_pyspark"
# META }
