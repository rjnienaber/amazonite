private alias ADDB = Amazonite::DynamoDBv2
private alias AC = Amazonite::Core

module Amazonite::DynamoDBv2
  class Client < AC::Client
    Log               = ::Log.for("amazonite.dynamodb_v2.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = AC::Config.new)
      super("DynamoDB_20120810", "dynamodb", EXCEPTION_FACTORY, config)
    end

    def batch_execute_statement(input : ADDB::BatchExecuteStatementInput) : AC::ParsedResponse(ADDB::BatchExecuteStatementOutput)
      Log.info { "performing 'BatchExecuteStatement' operation" }
      response = post("BatchExecuteStatement", "/", input.to_json)
      AC::ParsedResponse(ADDB::BatchExecuteStatementOutput).new(response)
    end

    def batch_get_item(input : ADDB::BatchGetItemInput) : AC::ParsedResponse(ADDB::BatchGetItemOutput)
      Log.info { "performing 'BatchGetItem' operation" }
      response = post("BatchGetItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::BatchGetItemOutput).new(response)
    end

    def batch_write_item(input : ADDB::BatchWriteItemInput) : AC::ParsedResponse(ADDB::BatchWriteItemOutput)
      Log.info { "performing 'BatchWriteItem' operation" }
      response = post("BatchWriteItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::BatchWriteItemOutput).new(response)
    end

    def create_backup(input : ADDB::CreateBackupInput) : AC::ParsedResponse(ADDB::CreateBackupOutput)
      Log.info { "performing 'CreateBackup' operation" }
      response = post("CreateBackup", "/", input.to_json)
      AC::ParsedResponse(ADDB::CreateBackupOutput).new(response)
    end

    def create_global_table(input : ADDB::CreateGlobalTableInput) : AC::ParsedResponse(ADDB::CreateGlobalTableOutput)
      Log.info { "performing 'CreateGlobalTable' operation" }
      response = post("CreateGlobalTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::CreateGlobalTableOutput).new(response)
    end

    def create_table(input : ADDB::CreateTableInput) : AC::ParsedResponse(ADDB::CreateTableOutput)
      Log.info { "performing 'CreateTable' operation" }
      response = post("CreateTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::CreateTableOutput).new(response)
    end

    def delete_backup(input : ADDB::DeleteBackupInput) : AC::ParsedResponse(ADDB::DeleteBackupOutput)
      Log.info { "performing 'DeleteBackup' operation" }
      response = post("DeleteBackup", "/", input.to_json)
      AC::ParsedResponse(ADDB::DeleteBackupOutput).new(response)
    end

    def delete_item(input : ADDB::DeleteItemInput) : AC::ParsedResponse(ADDB::DeleteItemOutput)
      Log.info { "performing 'DeleteItem' operation" }
      response = post("DeleteItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::DeleteItemOutput).new(response)
    end

    def delete_table(input : ADDB::DeleteTableInput) : AC::ParsedResponse(ADDB::DeleteTableOutput)
      Log.info { "performing 'DeleteTable' operation" }
      response = post("DeleteTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::DeleteTableOutput).new(response)
    end

    def describe_backup(input : ADDB::DescribeBackupInput) : AC::ParsedResponse(ADDB::DescribeBackupOutput)
      Log.info { "performing 'DescribeBackup' operation" }
      response = post("DescribeBackup", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeBackupOutput).new(response)
    end

    def describe_continuous_backups(input : ADDB::DescribeContinuousBackupsInput) : AC::ParsedResponse(ADDB::DescribeContinuousBackupsOutput)
      Log.info { "performing 'DescribeContinuousBackups' operation" }
      response = post("DescribeContinuousBackups", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeContinuousBackupsOutput).new(response)
    end

    def describe_contributor_insights(input : ADDB::DescribeContributorInsightsInput) : AC::ParsedResponse(ADDB::DescribeContributorInsightsOutput)
      Log.info { "performing 'DescribeContributorInsights' operation" }
      response = post("DescribeContributorInsights", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeContributorInsightsOutput).new(response)
    end

    def describe_endpoints(input : ADDB::DescribeEndpointsRequest) : AC::ParsedResponse(ADDB::DescribeEndpointsResponse)
      Log.info { "performing 'DescribeEndpoints' operation" }
      response = post("DescribeEndpoints", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeEndpointsResponse).new(response)
    end

    def describe_export(input : ADDB::DescribeExportInput) : AC::ParsedResponse(ADDB::DescribeExportOutput)
      Log.info { "performing 'DescribeExport' operation" }
      response = post("DescribeExport", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeExportOutput).new(response)
    end

    def describe_global_table(input : ADDB::DescribeGlobalTableInput) : AC::ParsedResponse(ADDB::DescribeGlobalTableOutput)
      Log.info { "performing 'DescribeGlobalTable' operation" }
      response = post("DescribeGlobalTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeGlobalTableOutput).new(response)
    end

    def describe_global_table_settings(input : ADDB::DescribeGlobalTableSettingsInput) : AC::ParsedResponse(ADDB::DescribeGlobalTableSettingsOutput)
      Log.info { "performing 'DescribeGlobalTableSettings' operation" }
      response = post("DescribeGlobalTableSettings", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeGlobalTableSettingsOutput).new(response)
    end

    def describe_import(input : ADDB::DescribeImportInput) : AC::ParsedResponse(ADDB::DescribeImportOutput)
      Log.info { "performing 'DescribeImport' operation" }
      response = post("DescribeImport", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeImportOutput).new(response)
    end

    def describe_kinesis_streaming_destination(input : ADDB::DescribeKinesisStreamingDestinationInput) : AC::ParsedResponse(ADDB::DescribeKinesisStreamingDestinationOutput)
      Log.info { "performing 'DescribeKinesisStreamingDestination' operation" }
      response = post("DescribeKinesisStreamingDestination", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeKinesisStreamingDestinationOutput).new(response)
    end

    def describe_limits(input : ADDB::DescribeLimitsInput) : AC::ParsedResponse(ADDB::DescribeLimitsOutput)
      Log.info { "performing 'DescribeLimits' operation" }
      response = post("DescribeLimits", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeLimitsOutput).new(response)
    end

    def describe_table(input : ADDB::DescribeTableInput) : AC::ParsedResponse(ADDB::DescribeTableOutput)
      Log.info { "performing 'DescribeTable' operation" }
      response = post("DescribeTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeTableOutput).new(response)
    end

    def describe_table_replica_auto_scaling(input : ADDB::DescribeTableReplicaAutoScalingInput) : AC::ParsedResponse(ADDB::DescribeTableReplicaAutoScalingOutput)
      Log.info { "performing 'DescribeTableReplicaAutoScaling' operation" }
      response = post("DescribeTableReplicaAutoScaling", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeTableReplicaAutoScalingOutput).new(response)
    end

    def describe_time_to_live(input : ADDB::DescribeTimeToLiveInput) : AC::ParsedResponse(ADDB::DescribeTimeToLiveOutput)
      Log.info { "performing 'DescribeTimeToLive' operation" }
      response = post("DescribeTimeToLive", "/", input.to_json)
      AC::ParsedResponse(ADDB::DescribeTimeToLiveOutput).new(response)
    end

    def disable_kinesis_streaming_destination(input : ADDB::KinesisStreamingDestinationInput) : AC::ParsedResponse(ADDB::KinesisStreamingDestinationOutput)
      Log.info { "performing 'DisableKinesisStreamingDestination' operation" }
      response = post("DisableKinesisStreamingDestination", "/", input.to_json)
      AC::ParsedResponse(ADDB::KinesisStreamingDestinationOutput).new(response)
    end

    def enable_kinesis_streaming_destination(input : ADDB::KinesisStreamingDestinationInput) : AC::ParsedResponse(ADDB::KinesisStreamingDestinationOutput)
      Log.info { "performing 'EnableKinesisStreamingDestination' operation" }
      response = post("EnableKinesisStreamingDestination", "/", input.to_json)
      AC::ParsedResponse(ADDB::KinesisStreamingDestinationOutput).new(response)
    end

    def execute_statement(input : ADDB::ExecuteStatementInput) : AC::ParsedResponse(ADDB::ExecuteStatementOutput)
      Log.info { "performing 'ExecuteStatement' operation" }
      response = post("ExecuteStatement", "/", input.to_json)
      AC::ParsedResponse(ADDB::ExecuteStatementOutput).new(response)
    end

    def execute_transaction(input : ADDB::ExecuteTransactionInput) : AC::ParsedResponse(ADDB::ExecuteTransactionOutput)
      Log.info { "performing 'ExecuteTransaction' operation" }
      response = post("ExecuteTransaction", "/", input.to_json)
      AC::ParsedResponse(ADDB::ExecuteTransactionOutput).new(response)
    end

    def export_table_to_point_in_time(input : ADDB::ExportTableToPointInTimeInput) : AC::ParsedResponse(ADDB::ExportTableToPointInTimeOutput)
      Log.info { "performing 'ExportTableToPointInTime' operation" }
      response = post("ExportTableToPointInTime", "/", input.to_json)
      AC::ParsedResponse(ADDB::ExportTableToPointInTimeOutput).new(response)
    end

    def get_item(input : ADDB::GetItemInput) : AC::ParsedResponse(ADDB::GetItemOutput)
      Log.info { "performing 'GetItem' operation" }
      response = post("GetItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::GetItemOutput).new(response)
    end

    def import_table(input : ADDB::ImportTableInput) : AC::ParsedResponse(ADDB::ImportTableOutput)
      Log.info { "performing 'ImportTable' operation" }
      response = post("ImportTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::ImportTableOutput).new(response)
    end

    def list_backups(input : ADDB::ListBackupsInput) : AC::ParsedResponse(ADDB::ListBackupsOutput)
      Log.info { "performing 'ListBackups' operation" }
      response = post("ListBackups", "/", input.to_json)
      AC::ParsedResponse(ADDB::ListBackupsOutput).new(response)
    end

    def list_contributor_insights(input : ADDB::ListContributorInsightsInput) : AC::ParsedResponse(ADDB::ListContributorInsightsOutput)
      Log.info { "performing 'ListContributorInsights' operation" }
      response = post("ListContributorInsights", "/", input.to_json)
      AC::ParsedResponse(ADDB::ListContributorInsightsOutput).new(response)
    end

    def list_exports(input : ADDB::ListExportsInput) : AC::ParsedResponse(ADDB::ListExportsOutput)
      Log.info { "performing 'ListExports' operation" }
      response = post("ListExports", "/", input.to_json)
      AC::ParsedResponse(ADDB::ListExportsOutput).new(response)
    end

    def list_global_tables(input : ADDB::ListGlobalTablesInput) : AC::ParsedResponse(ADDB::ListGlobalTablesOutput)
      Log.info { "performing 'ListGlobalTables' operation" }
      response = post("ListGlobalTables", "/", input.to_json)
      AC::ParsedResponse(ADDB::ListGlobalTablesOutput).new(response)
    end

    def list_imports(input : ADDB::ListImportsInput) : AC::ParsedResponse(ADDB::ListImportsOutput)
      Log.info { "performing 'ListImports' operation" }
      response = post("ListImports", "/", input.to_json)
      AC::ParsedResponse(ADDB::ListImportsOutput).new(response)
    end

    def list_tables(input : ADDB::ListTablesInput) : AC::ParsedResponse(ADDB::ListTablesOutput)
      Log.info { "performing 'ListTables' operation" }
      response = post("ListTables", "/", input.to_json)
      AC::ParsedResponse(ADDB::ListTablesOutput).new(response)
    end

    def list_tags_of_resource(input : ADDB::ListTagsOfResourceInput) : AC::ParsedResponse(ADDB::ListTagsOfResourceOutput)
      Log.info { "performing 'ListTagsOfResource' operation" }
      response = post("ListTagsOfResource", "/", input.to_json)
      AC::ParsedResponse(ADDB::ListTagsOfResourceOutput).new(response)
    end

    def put_item(input : ADDB::PutItemInput) : AC::ParsedResponse(ADDB::PutItemOutput)
      Log.info { "performing 'PutItem' operation" }
      response = post("PutItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::PutItemOutput).new(response)
    end

    def query(input : ADDB::QueryInput) : AC::ParsedResponse(ADDB::QueryOutput)
      Log.info { "performing 'Query' operation" }
      response = post("Query", "/", input.to_json)
      AC::ParsedResponse(ADDB::QueryOutput).new(response)
    end

    def restore_table_from_backup(input : ADDB::RestoreTableFromBackupInput) : AC::ParsedResponse(ADDB::RestoreTableFromBackupOutput)
      Log.info { "performing 'RestoreTableFromBackup' operation" }
      response = post("RestoreTableFromBackup", "/", input.to_json)
      AC::ParsedResponse(ADDB::RestoreTableFromBackupOutput).new(response)
    end

    def restore_table_to_point_in_time(input : ADDB::RestoreTableToPointInTimeInput) : AC::ParsedResponse(ADDB::RestoreTableToPointInTimeOutput)
      Log.info { "performing 'RestoreTableToPointInTime' operation" }
      response = post("RestoreTableToPointInTime", "/", input.to_json)
      AC::ParsedResponse(ADDB::RestoreTableToPointInTimeOutput).new(response)
    end

    def scan(input : ADDB::ScanInput) : AC::ParsedResponse(ADDB::ScanOutput)
      Log.info { "performing 'Scan' operation" }
      response = post("Scan", "/", input.to_json)
      AC::ParsedResponse(ADDB::ScanOutput).new(response)
    end

    def tag_resource(input : ADDB::TagResourceInput) : AC::Response
      Log.info { "performing 'TagResource' operation" }
      response = post("TagResource", "/", input.to_json)
      AC::Response.new(response)
    end

    def transact_get_items(input : ADDB::TransactGetItemsInput) : AC::ParsedResponse(ADDB::TransactGetItemsOutput)
      Log.info { "performing 'TransactGetItems' operation" }
      response = post("TransactGetItems", "/", input.to_json)
      AC::ParsedResponse(ADDB::TransactGetItemsOutput).new(response)
    end

    def transact_write_items(input : ADDB::TransactWriteItemsInput) : AC::ParsedResponse(ADDB::TransactWriteItemsOutput)
      Log.info { "performing 'TransactWriteItems' operation" }
      response = post("TransactWriteItems", "/", input.to_json)
      AC::ParsedResponse(ADDB::TransactWriteItemsOutput).new(response)
    end

    def untag_resource(input : ADDB::UntagResourceInput) : AC::Response
      Log.info { "performing 'UntagResource' operation" }
      response = post("UntagResource", "/", input.to_json)
      AC::Response.new(response)
    end

    def update_continuous_backups(input : ADDB::UpdateContinuousBackupsInput) : AC::ParsedResponse(ADDB::UpdateContinuousBackupsOutput)
      Log.info { "performing 'UpdateContinuousBackups' operation" }
      response = post("UpdateContinuousBackups", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateContinuousBackupsOutput).new(response)
    end

    def update_contributor_insights(input : ADDB::UpdateContributorInsightsInput) : AC::ParsedResponse(ADDB::UpdateContributorInsightsOutput)
      Log.info { "performing 'UpdateContributorInsights' operation" }
      response = post("UpdateContributorInsights", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateContributorInsightsOutput).new(response)
    end

    def update_global_table(input : ADDB::UpdateGlobalTableInput) : AC::ParsedResponse(ADDB::UpdateGlobalTableOutput)
      Log.info { "performing 'UpdateGlobalTable' operation" }
      response = post("UpdateGlobalTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateGlobalTableOutput).new(response)
    end

    def update_global_table_settings(input : ADDB::UpdateGlobalTableSettingsInput) : AC::ParsedResponse(ADDB::UpdateGlobalTableSettingsOutput)
      Log.info { "performing 'UpdateGlobalTableSettings' operation" }
      response = post("UpdateGlobalTableSettings", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateGlobalTableSettingsOutput).new(response)
    end

    def update_item(input : ADDB::UpdateItemInput) : AC::ParsedResponse(ADDB::UpdateItemOutput)
      Log.info { "performing 'UpdateItem' operation" }
      response = post("UpdateItem", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateItemOutput).new(response)
    end

    def update_table(input : ADDB::UpdateTableInput) : AC::ParsedResponse(ADDB::UpdateTableOutput)
      Log.info { "performing 'UpdateTable' operation" }
      response = post("UpdateTable", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateTableOutput).new(response)
    end

    def update_table_replica_auto_scaling(input : ADDB::UpdateTableReplicaAutoScalingInput) : AC::ParsedResponse(ADDB::UpdateTableReplicaAutoScalingOutput)
      Log.info { "performing 'UpdateTableReplicaAutoScaling' operation" }
      response = post("UpdateTableReplicaAutoScaling", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateTableReplicaAutoScalingOutput).new(response)
    end

    def update_time_to_live(input : ADDB::UpdateTimeToLiveInput) : AC::ParsedResponse(ADDB::UpdateTimeToLiveOutput)
      Log.info { "performing 'UpdateTimeToLive' operation" }
      response = post("UpdateTimeToLive", "/", input.to_json)
      AC::ParsedResponse(ADDB::UpdateTimeToLiveOutput).new(response)
    end
  end
end
