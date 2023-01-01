private alias ADDB = Amazonite::DynamoDBV2
private alias Core = Amazonite::Core

module Amazonite::DynamoDBV2
  class Client < Core::Client
    Log               = ::Log.for("amazonite.dynamodb_v2.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("DynamoDB_20120810", "dynamodb", "1.0", EXCEPTION_FACTORY, config)
    end

    def batch_execute_statement(input : ADDB::BatchExecuteStatementInput) : Core::ParsedResponse(ADDB::BatchExecuteStatementOutput)
      Log.info { "performing 'BatchExecuteStatement' operation" }
      response = post("BatchExecuteStatement", "/", input.to_json)
      Core::ParsedResponse(ADDB::BatchExecuteStatementOutput).new(response)
    end

    def batch_get_item(input : ADDB::BatchGetItemInput) : Core::ParsedResponse(ADDB::BatchGetItemOutput)
      Log.info { "performing 'BatchGetItem' operation" }
      response = post("BatchGetItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::BatchGetItemOutput).new(response)
    end

    def batch_write_item(input : ADDB::BatchWriteItemInput) : Core::ParsedResponse(ADDB::BatchWriteItemOutput)
      Log.info { "performing 'BatchWriteItem' operation" }
      response = post("BatchWriteItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::BatchWriteItemOutput).new(response)
    end

    def create_backup(input : ADDB::CreateBackupInput) : Core::ParsedResponse(ADDB::CreateBackupOutput)
      Log.info { "performing 'CreateBackup' operation" }
      response = post("CreateBackup", "/", input.to_json)
      Core::ParsedResponse(ADDB::CreateBackupOutput).new(response)
    end

    def create_global_table(input : ADDB::CreateGlobalTableInput) : Core::ParsedResponse(ADDB::CreateGlobalTableOutput)
      Log.info { "performing 'CreateGlobalTable' operation" }
      response = post("CreateGlobalTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::CreateGlobalTableOutput).new(response)
    end

    def create_table(input : ADDB::CreateTableInput) : Core::ParsedResponse(ADDB::CreateTableOutput)
      Log.info { "performing 'CreateTable' operation" }
      response = post("CreateTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::CreateTableOutput).new(response)
    end

    def delete_backup(input : ADDB::DeleteBackupInput) : Core::ParsedResponse(ADDB::DeleteBackupOutput)
      Log.info { "performing 'DeleteBackup' operation" }
      response = post("DeleteBackup", "/", input.to_json)
      Core::ParsedResponse(ADDB::DeleteBackupOutput).new(response)
    end

    def delete_item(input : ADDB::DeleteItemInput) : Core::ParsedResponse(ADDB::DeleteItemOutput)
      Log.info { "performing 'DeleteItem' operation" }
      response = post("DeleteItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::DeleteItemOutput).new(response)
    end

    def delete_table(input : ADDB::DeleteTableInput) : Core::ParsedResponse(ADDB::DeleteTableOutput)
      Log.info { "performing 'DeleteTable' operation" }
      response = post("DeleteTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::DeleteTableOutput).new(response)
    end

    def describe_backup(input : ADDB::DescribeBackupInput) : Core::ParsedResponse(ADDB::DescribeBackupOutput)
      Log.info { "performing 'DescribeBackup' operation" }
      response = post("DescribeBackup", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeBackupOutput).new(response)
    end

    def describe_continuous_backups(input : ADDB::DescribeContinuousBackupsInput) : Core::ParsedResponse(ADDB::DescribeContinuousBackupsOutput)
      Log.info { "performing 'DescribeContinuousBackups' operation" }
      response = post("DescribeContinuousBackups", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeContinuousBackupsOutput).new(response)
    end

    def describe_contributor_insights(input : ADDB::DescribeContributorInsightsInput) : Core::ParsedResponse(ADDB::DescribeContributorInsightsOutput)
      Log.info { "performing 'DescribeContributorInsights' operation" }
      response = post("DescribeContributorInsights", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeContributorInsightsOutput).new(response)
    end

    def describe_endpoints(input : ADDB::DescribeEndpointsRequest) : Core::ParsedResponse(ADDB::DescribeEndpointsResponse)
      Log.info { "performing 'DescribeEndpoints' operation" }
      response = post("DescribeEndpoints", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeEndpointsResponse).new(response)
    end

    def describe_export(input : ADDB::DescribeExportInput) : Core::ParsedResponse(ADDB::DescribeExportOutput)
      Log.info { "performing 'DescribeExport' operation" }
      response = post("DescribeExport", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeExportOutput).new(response)
    end

    def describe_global_table(input : ADDB::DescribeGlobalTableInput) : Core::ParsedResponse(ADDB::DescribeGlobalTableOutput)
      Log.info { "performing 'DescribeGlobalTable' operation" }
      response = post("DescribeGlobalTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeGlobalTableOutput).new(response)
    end

    def describe_global_table_settings(input : ADDB::DescribeGlobalTableSettingsInput) : Core::ParsedResponse(ADDB::DescribeGlobalTableSettingsOutput)
      Log.info { "performing 'DescribeGlobalTableSettings' operation" }
      response = post("DescribeGlobalTableSettings", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeGlobalTableSettingsOutput).new(response)
    end

    def describe_import(input : ADDB::DescribeImportInput) : Core::ParsedResponse(ADDB::DescribeImportOutput)
      Log.info { "performing 'DescribeImport' operation" }
      response = post("DescribeImport", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeImportOutput).new(response)
    end

    def describe_kinesis_streaming_destination(input : ADDB::DescribeKinesisStreamingDestinationInput) : Core::ParsedResponse(ADDB::DescribeKinesisStreamingDestinationOutput)
      Log.info { "performing 'DescribeKinesisStreamingDestination' operation" }
      response = post("DescribeKinesisStreamingDestination", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeKinesisStreamingDestinationOutput).new(response)
    end

    def describe_limits(input : ADDB::DescribeLimitsInput) : Core::ParsedResponse(ADDB::DescribeLimitsOutput)
      Log.info { "performing 'DescribeLimits' operation" }
      response = post("DescribeLimits", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeLimitsOutput).new(response)
    end

    def describe_table(input : ADDB::DescribeTableInput) : Core::ParsedResponse(ADDB::DescribeTableOutput)
      Log.info { "performing 'DescribeTable' operation" }
      response = post("DescribeTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeTableOutput).new(response)
    end

    def describe_table_replica_auto_scaling(input : ADDB::DescribeTableReplicaAutoScalingInput) : Core::ParsedResponse(ADDB::DescribeTableReplicaAutoScalingOutput)
      Log.info { "performing 'DescribeTableReplicaAutoScaling' operation" }
      response = post("DescribeTableReplicaAutoScaling", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeTableReplicaAutoScalingOutput).new(response)
    end

    def describe_time_to_live(input : ADDB::DescribeTimeToLiveInput) : Core::ParsedResponse(ADDB::DescribeTimeToLiveOutput)
      Log.info { "performing 'DescribeTimeToLive' operation" }
      response = post("DescribeTimeToLive", "/", input.to_json)
      Core::ParsedResponse(ADDB::DescribeTimeToLiveOutput).new(response)
    end

    def disable_kinesis_streaming_destination(input : ADDB::KinesisStreamingDestinationInput) : Core::ParsedResponse(ADDB::KinesisStreamingDestinationOutput)
      Log.info { "performing 'DisableKinesisStreamingDestination' operation" }
      response = post("DisableKinesisStreamingDestination", "/", input.to_json)
      Core::ParsedResponse(ADDB::KinesisStreamingDestinationOutput).new(response)
    end

    def enable_kinesis_streaming_destination(input : ADDB::KinesisStreamingDestinationInput) : Core::ParsedResponse(ADDB::KinesisStreamingDestinationOutput)
      Log.info { "performing 'EnableKinesisStreamingDestination' operation" }
      response = post("EnableKinesisStreamingDestination", "/", input.to_json)
      Core::ParsedResponse(ADDB::KinesisStreamingDestinationOutput).new(response)
    end

    def execute_statement(input : ADDB::ExecuteStatementInput) : Core::ParsedResponse(ADDB::ExecuteStatementOutput)
      Log.info { "performing 'ExecuteStatement' operation" }
      response = post("ExecuteStatement", "/", input.to_json)
      Core::ParsedResponse(ADDB::ExecuteStatementOutput).new(response)
    end

    def execute_transaction(input : ADDB::ExecuteTransactionInput) : Core::ParsedResponse(ADDB::ExecuteTransactionOutput)
      Log.info { "performing 'ExecuteTransaction' operation" }
      response = post("ExecuteTransaction", "/", input.to_json)
      Core::ParsedResponse(ADDB::ExecuteTransactionOutput).new(response)
    end

    def export_table_to_point_in_time(input : ADDB::ExportTableToPointInTimeInput) : Core::ParsedResponse(ADDB::ExportTableToPointInTimeOutput)
      Log.info { "performing 'ExportTableToPointInTime' operation" }
      response = post("ExportTableToPointInTime", "/", input.to_json)
      Core::ParsedResponse(ADDB::ExportTableToPointInTimeOutput).new(response)
    end

    def get_item(input : ADDB::GetItemInput) : Core::ParsedResponse(ADDB::GetItemOutput)
      Log.info { "performing 'GetItem' operation" }
      response = post("GetItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::GetItemOutput).new(response)
    end

    def import_table(input : ADDB::ImportTableInput) : Core::ParsedResponse(ADDB::ImportTableOutput)
      Log.info { "performing 'ImportTable' operation" }
      response = post("ImportTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::ImportTableOutput).new(response)
    end

    def list_backups(input : ADDB::ListBackupsInput) : Core::ParsedResponse(ADDB::ListBackupsOutput)
      Log.info { "performing 'ListBackups' operation" }
      response = post("ListBackups", "/", input.to_json)
      Core::ParsedResponse(ADDB::ListBackupsOutput).new(response)
    end

    def list_contributor_insights(input : ADDB::ListContributorInsightsInput) : Core::ParsedResponse(ADDB::ListContributorInsightsOutput)
      Log.info { "performing 'ListContributorInsights' operation" }
      response = post("ListContributorInsights", "/", input.to_json)
      Core::ParsedResponse(ADDB::ListContributorInsightsOutput).new(response)
    end

    def list_exports(input : ADDB::ListExportsInput) : Core::ParsedResponse(ADDB::ListExportsOutput)
      Log.info { "performing 'ListExports' operation" }
      response = post("ListExports", "/", input.to_json)
      Core::ParsedResponse(ADDB::ListExportsOutput).new(response)
    end

    def list_global_tables(input : ADDB::ListGlobalTablesInput) : Core::ParsedResponse(ADDB::ListGlobalTablesOutput)
      Log.info { "performing 'ListGlobalTables' operation" }
      response = post("ListGlobalTables", "/", input.to_json)
      Core::ParsedResponse(ADDB::ListGlobalTablesOutput).new(response)
    end

    def list_imports(input : ADDB::ListImportsInput) : Core::ParsedResponse(ADDB::ListImportsOutput)
      Log.info { "performing 'ListImports' operation" }
      response = post("ListImports", "/", input.to_json)
      Core::ParsedResponse(ADDB::ListImportsOutput).new(response)
    end

    def list_tables(input : ADDB::ListTablesInput) : Core::ParsedResponse(ADDB::ListTablesOutput)
      Log.info { "performing 'ListTables' operation" }
      response = post("ListTables", "/", input.to_json)
      Core::ParsedResponse(ADDB::ListTablesOutput).new(response)
    end

    def list_tags_of_resource(input : ADDB::ListTagsOfResourceInput) : Core::ParsedResponse(ADDB::ListTagsOfResourceOutput)
      Log.info { "performing 'ListTagsOfResource' operation" }
      response = post("ListTagsOfResource", "/", input.to_json)
      Core::ParsedResponse(ADDB::ListTagsOfResourceOutput).new(response)
    end

    def put_item(input : ADDB::PutItemInput) : Core::ParsedResponse(ADDB::PutItemOutput)
      Log.info { "performing 'PutItem' operation" }
      response = post("PutItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::PutItemOutput).new(response)
    end

    def query(input : ADDB::QueryInput) : Core::ParsedResponse(ADDB::QueryOutput)
      Log.info { "performing 'Query' operation" }
      response = post("Query", "/", input.to_json)
      Core::ParsedResponse(ADDB::QueryOutput).new(response)
    end

    def restore_table_from_backup(input : ADDB::RestoreTableFromBackupInput) : Core::ParsedResponse(ADDB::RestoreTableFromBackupOutput)
      Log.info { "performing 'RestoreTableFromBackup' operation" }
      response = post("RestoreTableFromBackup", "/", input.to_json)
      Core::ParsedResponse(ADDB::RestoreTableFromBackupOutput).new(response)
    end

    def restore_table_to_point_in_time(input : ADDB::RestoreTableToPointInTimeInput) : Core::ParsedResponse(ADDB::RestoreTableToPointInTimeOutput)
      Log.info { "performing 'RestoreTableToPointInTime' operation" }
      response = post("RestoreTableToPointInTime", "/", input.to_json)
      Core::ParsedResponse(ADDB::RestoreTableToPointInTimeOutput).new(response)
    end

    def scan(input : ADDB::ScanInput) : Core::ParsedResponse(ADDB::ScanOutput)
      Log.info { "performing 'Scan' operation" }
      response = post("Scan", "/", input.to_json)
      Core::ParsedResponse(ADDB::ScanOutput).new(response)
    end

    def tag_resource(input : ADDB::TagResourceInput) : Core::Response
      Log.info { "performing 'TagResource' operation" }
      response = post("TagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    def transact_get_items(input : ADDB::TransactGetItemsInput) : Core::ParsedResponse(ADDB::TransactGetItemsOutput)
      Log.info { "performing 'TransactGetItems' operation" }
      response = post("TransactGetItems", "/", input.to_json)
      Core::ParsedResponse(ADDB::TransactGetItemsOutput).new(response)
    end

    def transact_write_items(input : ADDB::TransactWriteItemsInput) : Core::ParsedResponse(ADDB::TransactWriteItemsOutput)
      Log.info { "performing 'TransactWriteItems' operation" }
      response = post("TransactWriteItems", "/", input.to_json)
      Core::ParsedResponse(ADDB::TransactWriteItemsOutput).new(response)
    end

    def untag_resource(input : ADDB::UntagResourceInput) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      response = post("UntagResource", "/", input.to_json)
      Core::Response.new(response)
    end

    def update_continuous_backups(input : ADDB::UpdateContinuousBackupsInput) : Core::ParsedResponse(ADDB::UpdateContinuousBackupsOutput)
      Log.info { "performing 'UpdateContinuousBackups' operation" }
      response = post("UpdateContinuousBackups", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateContinuousBackupsOutput).new(response)
    end

    def update_contributor_insights(input : ADDB::UpdateContributorInsightsInput) : Core::ParsedResponse(ADDB::UpdateContributorInsightsOutput)
      Log.info { "performing 'UpdateContributorInsights' operation" }
      response = post("UpdateContributorInsights", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateContributorInsightsOutput).new(response)
    end

    def update_global_table(input : ADDB::UpdateGlobalTableInput) : Core::ParsedResponse(ADDB::UpdateGlobalTableOutput)
      Log.info { "performing 'UpdateGlobalTable' operation" }
      response = post("UpdateGlobalTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateGlobalTableOutput).new(response)
    end

    def update_global_table_settings(input : ADDB::UpdateGlobalTableSettingsInput) : Core::ParsedResponse(ADDB::UpdateGlobalTableSettingsOutput)
      Log.info { "performing 'UpdateGlobalTableSettings' operation" }
      response = post("UpdateGlobalTableSettings", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateGlobalTableSettingsOutput).new(response)
    end

    def update_item(input : ADDB::UpdateItemInput) : Core::ParsedResponse(ADDB::UpdateItemOutput)
      Log.info { "performing 'UpdateItem' operation" }
      response = post("UpdateItem", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateItemOutput).new(response)
    end

    def update_table(input : ADDB::UpdateTableInput) : Core::ParsedResponse(ADDB::UpdateTableOutput)
      Log.info { "performing 'UpdateTable' operation" }
      response = post("UpdateTable", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateTableOutput).new(response)
    end

    def update_table_replica_auto_scaling(input : ADDB::UpdateTableReplicaAutoScalingInput) : Core::ParsedResponse(ADDB::UpdateTableReplicaAutoScalingOutput)
      Log.info { "performing 'UpdateTableReplicaAutoScaling' operation" }
      response = post("UpdateTableReplicaAutoScaling", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateTableReplicaAutoScalingOutput).new(response)
    end

    def update_time_to_live(input : ADDB::UpdateTimeToLiveInput) : Core::ParsedResponse(ADDB::UpdateTimeToLiveOutput)
      Log.info { "performing 'UpdateTimeToLive' operation" }
      response = post("UpdateTimeToLive", "/", input.to_json)
      Core::ParsedResponse(ADDB::UpdateTimeToLiveOutput).new(response)
    end
  end
end
