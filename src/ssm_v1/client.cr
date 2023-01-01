private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.ssm_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonSSM", "ssm", "1.1", EXCEPTION_FACTORY, config)
    end

    def add_tags_to_resource(input : AS::AddTagsToResourceRequest) : Core::ParsedResponse(AS::AddTagsToResourceResult)
      Log.info { "performing 'AddTagsToResource' operation" }
      response = post("AddTagsToResource", "/", input.to_json)
      Core::ParsedResponse(AS::AddTagsToResourceResult).new(response)
    end

    def associate_ops_item_related_item(input : AS::AssociateOpsItemRelatedItemRequest) : Core::ParsedResponse(AS::AssociateOpsItemRelatedItemResponse)
      Log.info { "performing 'AssociateOpsItemRelatedItem' operation" }
      response = post("AssociateOpsItemRelatedItem", "/", input.to_json)
      Core::ParsedResponse(AS::AssociateOpsItemRelatedItemResponse).new(response)
    end

    def cancel_command(input : AS::CancelCommandRequest) : Core::ParsedResponse(AS::CancelCommandResult)
      Log.info { "performing 'CancelCommand' operation" }
      response = post("CancelCommand", "/", input.to_json)
      Core::ParsedResponse(AS::CancelCommandResult).new(response)
    end

    def cancel_maintenance_window_execution(input : AS::CancelMaintenanceWindowExecutionRequest) : Core::ParsedResponse(AS::CancelMaintenanceWindowExecutionResult)
      Log.info { "performing 'CancelMaintenanceWindowExecution' operation" }
      response = post("CancelMaintenanceWindowExecution", "/", input.to_json)
      Core::ParsedResponse(AS::CancelMaintenanceWindowExecutionResult).new(response)
    end

    def create_activation(input : AS::CreateActivationRequest) : Core::ParsedResponse(AS::CreateActivationResult)
      Log.info { "performing 'CreateActivation' operation" }
      response = post("CreateActivation", "/", input.to_json)
      Core::ParsedResponse(AS::CreateActivationResult).new(response)
    end

    def create_association(input : AS::CreateAssociationRequest) : Core::ParsedResponse(AS::CreateAssociationResult)
      Log.info { "performing 'CreateAssociation' operation" }
      response = post("CreateAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::CreateAssociationResult).new(response)
    end

    def create_association_batch(input : AS::CreateAssociationBatchRequest) : Core::ParsedResponse(AS::CreateAssociationBatchResult)
      Log.info { "performing 'CreateAssociationBatch' operation" }
      response = post("CreateAssociationBatch", "/", input.to_json)
      Core::ParsedResponse(AS::CreateAssociationBatchResult).new(response)
    end

    def create_document(input : AS::CreateDocumentRequest) : Core::ParsedResponse(AS::CreateDocumentResult)
      Log.info { "performing 'CreateDocument' operation" }
      response = post("CreateDocument", "/", input.to_json)
      Core::ParsedResponse(AS::CreateDocumentResult).new(response)
    end

    def create_maintenance_window(input : AS::CreateMaintenanceWindowRequest) : Core::ParsedResponse(AS::CreateMaintenanceWindowResult)
      Log.info { "performing 'CreateMaintenanceWindow' operation" }
      response = post("CreateMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::CreateMaintenanceWindowResult).new(response)
    end

    def create_ops_item(input : AS::CreateOpsItemRequest) : Core::ParsedResponse(AS::CreateOpsItemResponse)
      Log.info { "performing 'CreateOpsItem' operation" }
      response = post("CreateOpsItem", "/", input.to_json)
      Core::ParsedResponse(AS::CreateOpsItemResponse).new(response)
    end

    def create_ops_metadata(input : AS::CreateOpsMetadataRequest) : Core::ParsedResponse(AS::CreateOpsMetadataResult)
      Log.info { "performing 'CreateOpsMetadata' operation" }
      response = post("CreateOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::CreateOpsMetadataResult).new(response)
    end

    def create_patch_baseline(input : AS::CreatePatchBaselineRequest) : Core::ParsedResponse(AS::CreatePatchBaselineResult)
      Log.info { "performing 'CreatePatchBaseline' operation" }
      response = post("CreatePatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::CreatePatchBaselineResult).new(response)
    end

    def create_resource_data_sync(input : AS::CreateResourceDataSyncRequest) : Core::ParsedResponse(AS::CreateResourceDataSyncResult)
      Log.info { "performing 'CreateResourceDataSync' operation" }
      response = post("CreateResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::CreateResourceDataSyncResult).new(response)
    end

    def delete_activation(input : AS::DeleteActivationRequest) : Core::ParsedResponse(AS::DeleteActivationResult)
      Log.info { "performing 'DeleteActivation' operation" }
      response = post("DeleteActivation", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteActivationResult).new(response)
    end

    def delete_association(input : AS::DeleteAssociationRequest) : Core::ParsedResponse(AS::DeleteAssociationResult)
      Log.info { "performing 'DeleteAssociation' operation" }
      response = post("DeleteAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteAssociationResult).new(response)
    end

    def delete_document(input : AS::DeleteDocumentRequest) : Core::ParsedResponse(AS::DeleteDocumentResult)
      Log.info { "performing 'DeleteDocument' operation" }
      response = post("DeleteDocument", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteDocumentResult).new(response)
    end

    def delete_inventory(input : AS::DeleteInventoryRequest) : Core::ParsedResponse(AS::DeleteInventoryResult)
      Log.info { "performing 'DeleteInventory' operation" }
      response = post("DeleteInventory", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteInventoryResult).new(response)
    end

    def delete_maintenance_window(input : AS::DeleteMaintenanceWindowRequest) : Core::ParsedResponse(AS::DeleteMaintenanceWindowResult)
      Log.info { "performing 'DeleteMaintenanceWindow' operation" }
      response = post("DeleteMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteMaintenanceWindowResult).new(response)
    end

    def delete_ops_metadata(input : AS::DeleteOpsMetadataRequest) : Core::ParsedResponse(AS::DeleteOpsMetadataResult)
      Log.info { "performing 'DeleteOpsMetadata' operation" }
      response = post("DeleteOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteOpsMetadataResult).new(response)
    end

    def delete_parameter(input : AS::DeleteParameterRequest) : Core::ParsedResponse(AS::DeleteParameterResult)
      Log.info { "performing 'DeleteParameter' operation" }
      response = post("DeleteParameter", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteParameterResult).new(response)
    end

    def delete_parameters(input : AS::DeleteParametersRequest) : Core::ParsedResponse(AS::DeleteParametersResult)
      Log.info { "performing 'DeleteParameters' operation" }
      response = post("DeleteParameters", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteParametersResult).new(response)
    end

    def delete_patch_baseline(input : AS::DeletePatchBaselineRequest) : Core::ParsedResponse(AS::DeletePatchBaselineResult)
      Log.info { "performing 'DeletePatchBaseline' operation" }
      response = post("DeletePatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::DeletePatchBaselineResult).new(response)
    end

    def delete_resource_data_sync(input : AS::DeleteResourceDataSyncRequest) : Core::ParsedResponse(AS::DeleteResourceDataSyncResult)
      Log.info { "performing 'DeleteResourceDataSync' operation" }
      response = post("DeleteResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteResourceDataSyncResult).new(response)
    end

    def deregister_managed_instance(input : AS::DeregisterManagedInstanceRequest) : Core::ParsedResponse(AS::DeregisterManagedInstanceResult)
      Log.info { "performing 'DeregisterManagedInstance' operation" }
      response = post("DeregisterManagedInstance", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterManagedInstanceResult).new(response)
    end

    def deregister_patch_baseline_for_patch_group(input : AS::DeregisterPatchBaselineForPatchGroupRequest) : Core::ParsedResponse(AS::DeregisterPatchBaselineForPatchGroupResult)
      Log.info { "performing 'DeregisterPatchBaselineForPatchGroup' operation" }
      response = post("DeregisterPatchBaselineForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterPatchBaselineForPatchGroupResult).new(response)
    end

    def deregister_target_from_maintenance_window(input : AS::DeregisterTargetFromMaintenanceWindowRequest) : Core::ParsedResponse(AS::DeregisterTargetFromMaintenanceWindowResult)
      Log.info { "performing 'DeregisterTargetFromMaintenanceWindow' operation" }
      response = post("DeregisterTargetFromMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterTargetFromMaintenanceWindowResult).new(response)
    end

    def deregister_task_from_maintenance_window(input : AS::DeregisterTaskFromMaintenanceWindowRequest) : Core::ParsedResponse(AS::DeregisterTaskFromMaintenanceWindowResult)
      Log.info { "performing 'DeregisterTaskFromMaintenanceWindow' operation" }
      response = post("DeregisterTaskFromMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterTaskFromMaintenanceWindowResult).new(response)
    end

    def describe_activations(input : AS::DescribeActivationsRequest) : Core::ParsedResponse(AS::DescribeActivationsResult)
      Log.info { "performing 'DescribeActivations' operation" }
      response = post("DescribeActivations", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeActivationsResult).new(response)
    end

    def describe_association(input : AS::DescribeAssociationRequest) : Core::ParsedResponse(AS::DescribeAssociationResult)
      Log.info { "performing 'DescribeAssociation' operation" }
      response = post("DescribeAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAssociationResult).new(response)
    end

    def describe_association_execution_targets(input : AS::DescribeAssociationExecutionTargetsRequest) : Core::ParsedResponse(AS::DescribeAssociationExecutionTargetsResult)
      Log.info { "performing 'DescribeAssociationExecutionTargets' operation" }
      response = post("DescribeAssociationExecutionTargets", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAssociationExecutionTargetsResult).new(response)
    end

    def describe_association_executions(input : AS::DescribeAssociationExecutionsRequest) : Core::ParsedResponse(AS::DescribeAssociationExecutionsResult)
      Log.info { "performing 'DescribeAssociationExecutions' operation" }
      response = post("DescribeAssociationExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAssociationExecutionsResult).new(response)
    end

    def describe_automation_executions(input : AS::DescribeAutomationExecutionsRequest) : Core::ParsedResponse(AS::DescribeAutomationExecutionsResult)
      Log.info { "performing 'DescribeAutomationExecutions' operation" }
      response = post("DescribeAutomationExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAutomationExecutionsResult).new(response)
    end

    def describe_automation_step_executions(input : AS::DescribeAutomationStepExecutionsRequest) : Core::ParsedResponse(AS::DescribeAutomationStepExecutionsResult)
      Log.info { "performing 'DescribeAutomationStepExecutions' operation" }
      response = post("DescribeAutomationStepExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAutomationStepExecutionsResult).new(response)
    end

    def describe_available_patches(input : AS::DescribeAvailablePatchesRequest) : Core::ParsedResponse(AS::DescribeAvailablePatchesResult)
      Log.info { "performing 'DescribeAvailablePatches' operation" }
      response = post("DescribeAvailablePatches", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAvailablePatchesResult).new(response)
    end

    def describe_document(input : AS::DescribeDocumentRequest) : Core::ParsedResponse(AS::DescribeDocumentResult)
      Log.info { "performing 'DescribeDocument' operation" }
      response = post("DescribeDocument", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeDocumentResult).new(response)
    end

    def describe_document_permission(input : AS::DescribeDocumentPermissionRequest) : Core::ParsedResponse(AS::DescribeDocumentPermissionResponse)
      Log.info { "performing 'DescribeDocumentPermission' operation" }
      response = post("DescribeDocumentPermission", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeDocumentPermissionResponse).new(response)
    end

    def describe_effective_instance_associations(input : AS::DescribeEffectiveInstanceAssociationsRequest) : Core::ParsedResponse(AS::DescribeEffectiveInstanceAssociationsResult)
      Log.info { "performing 'DescribeEffectiveInstanceAssociations' operation" }
      response = post("DescribeEffectiveInstanceAssociations", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeEffectiveInstanceAssociationsResult).new(response)
    end

    def describe_effective_patches_for_patch_baseline(input : AS::DescribeEffectivePatchesForPatchBaselineRequest) : Core::ParsedResponse(AS::DescribeEffectivePatchesForPatchBaselineResult)
      Log.info { "performing 'DescribeEffectivePatchesForPatchBaseline' operation" }
      response = post("DescribeEffectivePatchesForPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeEffectivePatchesForPatchBaselineResult).new(response)
    end

    def describe_instance_associations_status(input : AS::DescribeInstanceAssociationsStatusRequest) : Core::ParsedResponse(AS::DescribeInstanceAssociationsStatusResult)
      Log.info { "performing 'DescribeInstanceAssociationsStatus' operation" }
      response = post("DescribeInstanceAssociationsStatus", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstanceAssociationsStatusResult).new(response)
    end

    def describe_instance_information(input : AS::DescribeInstanceInformationRequest) : Core::ParsedResponse(AS::DescribeInstanceInformationResult)
      Log.info { "performing 'DescribeInstanceInformation' operation" }
      response = post("DescribeInstanceInformation", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstanceInformationResult).new(response)
    end

    def describe_instance_patch_states(input : AS::DescribeInstancePatchStatesRequest) : Core::ParsedResponse(AS::DescribeInstancePatchStatesResult)
      Log.info { "performing 'DescribeInstancePatchStates' operation" }
      response = post("DescribeInstancePatchStates", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstancePatchStatesResult).new(response)
    end

    def describe_instance_patch_states_for_patch_group(input : AS::DescribeInstancePatchStatesForPatchGroupRequest) : Core::ParsedResponse(AS::DescribeInstancePatchStatesForPatchGroupResult)
      Log.info { "performing 'DescribeInstancePatchStatesForPatchGroup' operation" }
      response = post("DescribeInstancePatchStatesForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstancePatchStatesForPatchGroupResult).new(response)
    end

    def describe_instance_patches(input : AS::DescribeInstancePatchesRequest) : Core::ParsedResponse(AS::DescribeInstancePatchesResult)
      Log.info { "performing 'DescribeInstancePatches' operation" }
      response = post("DescribeInstancePatches", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstancePatchesResult).new(response)
    end

    def describe_inventory_deletions(input : AS::DescribeInventoryDeletionsRequest) : Core::ParsedResponse(AS::DescribeInventoryDeletionsResult)
      Log.info { "performing 'DescribeInventoryDeletions' operation" }
      response = post("DescribeInventoryDeletions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInventoryDeletionsResult).new(response)
    end

    def describe_maintenance_window_execution_task_invocations(input : AS::DescribeMaintenanceWindowExecutionTaskInvocationsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTaskInvocationsResult)
      Log.info { "performing 'DescribeMaintenanceWindowExecutionTaskInvocations' operation" }
      response = post("DescribeMaintenanceWindowExecutionTaskInvocations", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTaskInvocationsResult).new(response)
    end

    def describe_maintenance_window_execution_tasks(input : AS::DescribeMaintenanceWindowExecutionTasksRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTasksResult)
      Log.info { "performing 'DescribeMaintenanceWindowExecutionTasks' operation" }
      response = post("DescribeMaintenanceWindowExecutionTasks", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTasksResult).new(response)
    end

    def describe_maintenance_window_executions(input : AS::DescribeMaintenanceWindowExecutionsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionsResult)
      Log.info { "performing 'DescribeMaintenanceWindowExecutions' operation" }
      response = post("DescribeMaintenanceWindowExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionsResult).new(response)
    end

    def describe_maintenance_window_schedule(input : AS::DescribeMaintenanceWindowScheduleRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowScheduleResult)
      Log.info { "performing 'DescribeMaintenanceWindowSchedule' operation" }
      response = post("DescribeMaintenanceWindowSchedule", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowScheduleResult).new(response)
    end

    def describe_maintenance_window_targets(input : AS::DescribeMaintenanceWindowTargetsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowTargetsResult)
      Log.info { "performing 'DescribeMaintenanceWindowTargets' operation" }
      response = post("DescribeMaintenanceWindowTargets", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowTargetsResult).new(response)
    end

    def describe_maintenance_window_tasks(input : AS::DescribeMaintenanceWindowTasksRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowTasksResult)
      Log.info { "performing 'DescribeMaintenanceWindowTasks' operation" }
      response = post("DescribeMaintenanceWindowTasks", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowTasksResult).new(response)
    end

    def describe_maintenance_windows(input : AS::DescribeMaintenanceWindowsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowsResult)
      Log.info { "performing 'DescribeMaintenanceWindows' operation" }
      response = post("DescribeMaintenanceWindows", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowsResult).new(response)
    end

    def describe_maintenance_windows_for_target(input : AS::DescribeMaintenanceWindowsForTargetRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowsForTargetResult)
      Log.info { "performing 'DescribeMaintenanceWindowsForTarget' operation" }
      response = post("DescribeMaintenanceWindowsForTarget", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowsForTargetResult).new(response)
    end

    def describe_ops_items(input : AS::DescribeOpsItemsRequest) : Core::ParsedResponse(AS::DescribeOpsItemsResponse)
      Log.info { "performing 'DescribeOpsItems' operation" }
      response = post("DescribeOpsItems", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeOpsItemsResponse).new(response)
    end

    def describe_parameters(input : AS::DescribeParametersRequest) : Core::ParsedResponse(AS::DescribeParametersResult)
      Log.info { "performing 'DescribeParameters' operation" }
      response = post("DescribeParameters", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeParametersResult).new(response)
    end

    def describe_patch_baselines(input : AS::DescribePatchBaselinesRequest) : Core::ParsedResponse(AS::DescribePatchBaselinesResult)
      Log.info { "performing 'DescribePatchBaselines' operation" }
      response = post("DescribePatchBaselines", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchBaselinesResult).new(response)
    end

    def describe_patch_group_state(input : AS::DescribePatchGroupStateRequest) : Core::ParsedResponse(AS::DescribePatchGroupStateResult)
      Log.info { "performing 'DescribePatchGroupState' operation" }
      response = post("DescribePatchGroupState", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchGroupStateResult).new(response)
    end

    def describe_patch_groups(input : AS::DescribePatchGroupsRequest) : Core::ParsedResponse(AS::DescribePatchGroupsResult)
      Log.info { "performing 'DescribePatchGroups' operation" }
      response = post("DescribePatchGroups", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchGroupsResult).new(response)
    end

    def describe_patch_properties(input : AS::DescribePatchPropertiesRequest) : Core::ParsedResponse(AS::DescribePatchPropertiesResult)
      Log.info { "performing 'DescribePatchProperties' operation" }
      response = post("DescribePatchProperties", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchPropertiesResult).new(response)
    end

    def describe_sessions(input : AS::DescribeSessionsRequest) : Core::ParsedResponse(AS::DescribeSessionsResponse)
      Log.info { "performing 'DescribeSessions' operation" }
      response = post("DescribeSessions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeSessionsResponse).new(response)
    end

    def disassociate_ops_item_related_item(input : AS::DisassociateOpsItemRelatedItemRequest) : Core::ParsedResponse(AS::DisassociateOpsItemRelatedItemResponse)
      Log.info { "performing 'DisassociateOpsItemRelatedItem' operation" }
      response = post("DisassociateOpsItemRelatedItem", "/", input.to_json)
      Core::ParsedResponse(AS::DisassociateOpsItemRelatedItemResponse).new(response)
    end

    def get_automation_execution(input : AS::GetAutomationExecutionRequest) : Core::ParsedResponse(AS::GetAutomationExecutionResult)
      Log.info { "performing 'GetAutomationExecution' operation" }
      response = post("GetAutomationExecution", "/", input.to_json)
      Core::ParsedResponse(AS::GetAutomationExecutionResult).new(response)
    end

    def get_calendar_state(input : AS::GetCalendarStateRequest) : Core::ParsedResponse(AS::GetCalendarStateResponse)
      Log.info { "performing 'GetCalendarState' operation" }
      response = post("GetCalendarState", "/", input.to_json)
      Core::ParsedResponse(AS::GetCalendarStateResponse).new(response)
    end

    def get_command_invocation(input : AS::GetCommandInvocationRequest) : Core::ParsedResponse(AS::GetCommandInvocationResult)
      Log.info { "performing 'GetCommandInvocation' operation" }
      response = post("GetCommandInvocation", "/", input.to_json)
      Core::ParsedResponse(AS::GetCommandInvocationResult).new(response)
    end

    def get_connection_status(input : AS::GetConnectionStatusRequest) : Core::ParsedResponse(AS::GetConnectionStatusResponse)
      Log.info { "performing 'GetConnectionStatus' operation" }
      response = post("GetConnectionStatus", "/", input.to_json)
      Core::ParsedResponse(AS::GetConnectionStatusResponse).new(response)
    end

    def get_default_patch_baseline(input : AS::GetDefaultPatchBaselineRequest) : Core::ParsedResponse(AS::GetDefaultPatchBaselineResult)
      Log.info { "performing 'GetDefaultPatchBaseline' operation" }
      response = post("GetDefaultPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::GetDefaultPatchBaselineResult).new(response)
    end

    def get_deployable_patch_snapshot_for_instance(input : AS::GetDeployablePatchSnapshotForInstanceRequest) : Core::ParsedResponse(AS::GetDeployablePatchSnapshotForInstanceResult)
      Log.info { "performing 'GetDeployablePatchSnapshotForInstance' operation" }
      response = post("GetDeployablePatchSnapshotForInstance", "/", input.to_json)
      Core::ParsedResponse(AS::GetDeployablePatchSnapshotForInstanceResult).new(response)
    end

    def get_document(input : AS::GetDocumentRequest) : Core::ParsedResponse(AS::GetDocumentResult)
      Log.info { "performing 'GetDocument' operation" }
      response = post("GetDocument", "/", input.to_json)
      Core::ParsedResponse(AS::GetDocumentResult).new(response)
    end

    def get_inventory(input : AS::GetInventoryRequest) : Core::ParsedResponse(AS::GetInventoryResult)
      Log.info { "performing 'GetInventory' operation" }
      response = post("GetInventory", "/", input.to_json)
      Core::ParsedResponse(AS::GetInventoryResult).new(response)
    end

    def get_inventory_schema(input : AS::GetInventorySchemaRequest) : Core::ParsedResponse(AS::GetInventorySchemaResult)
      Log.info { "performing 'GetInventorySchema' operation" }
      response = post("GetInventorySchema", "/", input.to_json)
      Core::ParsedResponse(AS::GetInventorySchemaResult).new(response)
    end

    def get_maintenance_window(input : AS::GetMaintenanceWindowRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowResult)
      Log.info { "performing 'GetMaintenanceWindow' operation" }
      response = post("GetMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowResult).new(response)
    end

    def get_maintenance_window_execution(input : AS::GetMaintenanceWindowExecutionRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowExecutionResult)
      Log.info { "performing 'GetMaintenanceWindowExecution' operation" }
      response = post("GetMaintenanceWindowExecution", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowExecutionResult).new(response)
    end

    def get_maintenance_window_execution_task(input : AS::GetMaintenanceWindowExecutionTaskRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskResult)
      Log.info { "performing 'GetMaintenanceWindowExecutionTask' operation" }
      response = post("GetMaintenanceWindowExecutionTask", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskResult).new(response)
    end

    def get_maintenance_window_execution_task_invocation(input : AS::GetMaintenanceWindowExecutionTaskInvocationRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskInvocationResult)
      Log.info { "performing 'GetMaintenanceWindowExecutionTaskInvocation' operation" }
      response = post("GetMaintenanceWindowExecutionTaskInvocation", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskInvocationResult).new(response)
    end

    def get_maintenance_window_task(input : AS::GetMaintenanceWindowTaskRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowTaskResult)
      Log.info { "performing 'GetMaintenanceWindowTask' operation" }
      response = post("GetMaintenanceWindowTask", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowTaskResult).new(response)
    end

    def get_ops_item(input : AS::GetOpsItemRequest) : Core::ParsedResponse(AS::GetOpsItemResponse)
      Log.info { "performing 'GetOpsItem' operation" }
      response = post("GetOpsItem", "/", input.to_json)
      Core::ParsedResponse(AS::GetOpsItemResponse).new(response)
    end

    def get_ops_metadata(input : AS::GetOpsMetadataRequest) : Core::ParsedResponse(AS::GetOpsMetadataResult)
      Log.info { "performing 'GetOpsMetadata' operation" }
      response = post("GetOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::GetOpsMetadataResult).new(response)
    end

    def get_ops_summary(input : AS::GetOpsSummaryRequest) : Core::ParsedResponse(AS::GetOpsSummaryResult)
      Log.info { "performing 'GetOpsSummary' operation" }
      response = post("GetOpsSummary", "/", input.to_json)
      Core::ParsedResponse(AS::GetOpsSummaryResult).new(response)
    end

    def get_parameter(input : AS::GetParameterRequest) : Core::ParsedResponse(AS::GetParameterResult)
      Log.info { "performing 'GetParameter' operation" }
      response = post("GetParameter", "/", input.to_json)
      Core::ParsedResponse(AS::GetParameterResult).new(response)
    end

    def get_parameter_history(input : AS::GetParameterHistoryRequest) : Core::ParsedResponse(AS::GetParameterHistoryResult)
      Log.info { "performing 'GetParameterHistory' operation" }
      response = post("GetParameterHistory", "/", input.to_json)
      Core::ParsedResponse(AS::GetParameterHistoryResult).new(response)
    end

    def get_parameters(input : AS::GetParametersRequest) : Core::ParsedResponse(AS::GetParametersResult)
      Log.info { "performing 'GetParameters' operation" }
      response = post("GetParameters", "/", input.to_json)
      Core::ParsedResponse(AS::GetParametersResult).new(response)
    end

    def get_parameters_by_path(input : AS::GetParametersByPathRequest) : Core::ParsedResponse(AS::GetParametersByPathResult)
      Log.info { "performing 'GetParametersByPath' operation" }
      response = post("GetParametersByPath", "/", input.to_json)
      Core::ParsedResponse(AS::GetParametersByPathResult).new(response)
    end

    def get_patch_baseline(input : AS::GetPatchBaselineRequest) : Core::ParsedResponse(AS::GetPatchBaselineResult)
      Log.info { "performing 'GetPatchBaseline' operation" }
      response = post("GetPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::GetPatchBaselineResult).new(response)
    end

    def get_patch_baseline_for_patch_group(input : AS::GetPatchBaselineForPatchGroupRequest) : Core::ParsedResponse(AS::GetPatchBaselineForPatchGroupResult)
      Log.info { "performing 'GetPatchBaselineForPatchGroup' operation" }
      response = post("GetPatchBaselineForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::GetPatchBaselineForPatchGroupResult).new(response)
    end

    def get_service_setting(input : AS::GetServiceSettingRequest) : Core::ParsedResponse(AS::GetServiceSettingResult)
      Log.info { "performing 'GetServiceSetting' operation" }
      response = post("GetServiceSetting", "/", input.to_json)
      Core::ParsedResponse(AS::GetServiceSettingResult).new(response)
    end

    def label_parameter_version(input : AS::LabelParameterVersionRequest) : Core::ParsedResponse(AS::LabelParameterVersionResult)
      Log.info { "performing 'LabelParameterVersion' operation" }
      response = post("LabelParameterVersion", "/", input.to_json)
      Core::ParsedResponse(AS::LabelParameterVersionResult).new(response)
    end

    def list_association_versions(input : AS::ListAssociationVersionsRequest) : Core::ParsedResponse(AS::ListAssociationVersionsResult)
      Log.info { "performing 'ListAssociationVersions' operation" }
      response = post("ListAssociationVersions", "/", input.to_json)
      Core::ParsedResponse(AS::ListAssociationVersionsResult).new(response)
    end

    def list_associations(input : AS::ListAssociationsRequest) : Core::ParsedResponse(AS::ListAssociationsResult)
      Log.info { "performing 'ListAssociations' operation" }
      response = post("ListAssociations", "/", input.to_json)
      Core::ParsedResponse(AS::ListAssociationsResult).new(response)
    end

    def list_command_invocations(input : AS::ListCommandInvocationsRequest) : Core::ParsedResponse(AS::ListCommandInvocationsResult)
      Log.info { "performing 'ListCommandInvocations' operation" }
      response = post("ListCommandInvocations", "/", input.to_json)
      Core::ParsedResponse(AS::ListCommandInvocationsResult).new(response)
    end

    def list_commands(input : AS::ListCommandsRequest) : Core::ParsedResponse(AS::ListCommandsResult)
      Log.info { "performing 'ListCommands' operation" }
      response = post("ListCommands", "/", input.to_json)
      Core::ParsedResponse(AS::ListCommandsResult).new(response)
    end

    def list_compliance_items(input : AS::ListComplianceItemsRequest) : Core::ParsedResponse(AS::ListComplianceItemsResult)
      Log.info { "performing 'ListComplianceItems' operation" }
      response = post("ListComplianceItems", "/", input.to_json)
      Core::ParsedResponse(AS::ListComplianceItemsResult).new(response)
    end

    def list_compliance_summaries(input : AS::ListComplianceSummariesRequest) : Core::ParsedResponse(AS::ListComplianceSummariesResult)
      Log.info { "performing 'ListComplianceSummaries' operation" }
      response = post("ListComplianceSummaries", "/", input.to_json)
      Core::ParsedResponse(AS::ListComplianceSummariesResult).new(response)
    end

    def list_document_metadata_history(input : AS::ListDocumentMetadataHistoryRequest) : Core::ParsedResponse(AS::ListDocumentMetadataHistoryResponse)
      Log.info { "performing 'ListDocumentMetadataHistory' operation" }
      response = post("ListDocumentMetadataHistory", "/", input.to_json)
      Core::ParsedResponse(AS::ListDocumentMetadataHistoryResponse).new(response)
    end

    def list_document_versions(input : AS::ListDocumentVersionsRequest) : Core::ParsedResponse(AS::ListDocumentVersionsResult)
      Log.info { "performing 'ListDocumentVersions' operation" }
      response = post("ListDocumentVersions", "/", input.to_json)
      Core::ParsedResponse(AS::ListDocumentVersionsResult).new(response)
    end

    def list_documents(input : AS::ListDocumentsRequest) : Core::ParsedResponse(AS::ListDocumentsResult)
      Log.info { "performing 'ListDocuments' operation" }
      response = post("ListDocuments", "/", input.to_json)
      Core::ParsedResponse(AS::ListDocumentsResult).new(response)
    end

    def list_inventory_entries(input : AS::ListInventoryEntriesRequest) : Core::ParsedResponse(AS::ListInventoryEntriesResult)
      Log.info { "performing 'ListInventoryEntries' operation" }
      response = post("ListInventoryEntries", "/", input.to_json)
      Core::ParsedResponse(AS::ListInventoryEntriesResult).new(response)
    end

    def list_ops_item_events(input : AS::ListOpsItemEventsRequest) : Core::ParsedResponse(AS::ListOpsItemEventsResponse)
      Log.info { "performing 'ListOpsItemEvents' operation" }
      response = post("ListOpsItemEvents", "/", input.to_json)
      Core::ParsedResponse(AS::ListOpsItemEventsResponse).new(response)
    end

    def list_ops_item_related_items(input : AS::ListOpsItemRelatedItemsRequest) : Core::ParsedResponse(AS::ListOpsItemRelatedItemsResponse)
      Log.info { "performing 'ListOpsItemRelatedItems' operation" }
      response = post("ListOpsItemRelatedItems", "/", input.to_json)
      Core::ParsedResponse(AS::ListOpsItemRelatedItemsResponse).new(response)
    end

    def list_ops_metadata(input : AS::ListOpsMetadataRequest) : Core::ParsedResponse(AS::ListOpsMetadataResult)
      Log.info { "performing 'ListOpsMetadata' operation" }
      response = post("ListOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::ListOpsMetadataResult).new(response)
    end

    def list_resource_compliance_summaries(input : AS::ListResourceComplianceSummariesRequest) : Core::ParsedResponse(AS::ListResourceComplianceSummariesResult)
      Log.info { "performing 'ListResourceComplianceSummaries' operation" }
      response = post("ListResourceComplianceSummaries", "/", input.to_json)
      Core::ParsedResponse(AS::ListResourceComplianceSummariesResult).new(response)
    end

    def list_resource_data_sync(input : AS::ListResourceDataSyncRequest) : Core::ParsedResponse(AS::ListResourceDataSyncResult)
      Log.info { "performing 'ListResourceDataSync' operation" }
      response = post("ListResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::ListResourceDataSyncResult).new(response)
    end

    def list_tags_for_resource(input : AS::ListTagsForResourceRequest) : Core::ParsedResponse(AS::ListTagsForResourceResult)
      Log.info { "performing 'ListTagsForResource' operation" }
      response = post("ListTagsForResource", "/", input.to_json)
      Core::ParsedResponse(AS::ListTagsForResourceResult).new(response)
    end

    def modify_document_permission(input : AS::ModifyDocumentPermissionRequest) : Core::ParsedResponse(AS::ModifyDocumentPermissionResponse)
      Log.info { "performing 'ModifyDocumentPermission' operation" }
      response = post("ModifyDocumentPermission", "/", input.to_json)
      Core::ParsedResponse(AS::ModifyDocumentPermissionResponse).new(response)
    end

    def put_compliance_items(input : AS::PutComplianceItemsRequest) : Core::ParsedResponse(AS::PutComplianceItemsResult)
      Log.info { "performing 'PutComplianceItems' operation" }
      response = post("PutComplianceItems", "/", input.to_json)
      Core::ParsedResponse(AS::PutComplianceItemsResult).new(response)
    end

    def put_inventory(input : AS::PutInventoryRequest) : Core::ParsedResponse(AS::PutInventoryResult)
      Log.info { "performing 'PutInventory' operation" }
      response = post("PutInventory", "/", input.to_json)
      Core::ParsedResponse(AS::PutInventoryResult).new(response)
    end

    def put_parameter(input : AS::PutParameterRequest) : Core::ParsedResponse(AS::PutParameterResult)
      Log.info { "performing 'PutParameter' operation" }
      response = post("PutParameter", "/", input.to_json)
      Core::ParsedResponse(AS::PutParameterResult).new(response)
    end

    def register_default_patch_baseline(input : AS::RegisterDefaultPatchBaselineRequest) : Core::ParsedResponse(AS::RegisterDefaultPatchBaselineResult)
      Log.info { "performing 'RegisterDefaultPatchBaseline' operation" }
      response = post("RegisterDefaultPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterDefaultPatchBaselineResult).new(response)
    end

    def register_patch_baseline_for_patch_group(input : AS::RegisterPatchBaselineForPatchGroupRequest) : Core::ParsedResponse(AS::RegisterPatchBaselineForPatchGroupResult)
      Log.info { "performing 'RegisterPatchBaselineForPatchGroup' operation" }
      response = post("RegisterPatchBaselineForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterPatchBaselineForPatchGroupResult).new(response)
    end

    def register_target_with_maintenance_window(input : AS::RegisterTargetWithMaintenanceWindowRequest) : Core::ParsedResponse(AS::RegisterTargetWithMaintenanceWindowResult)
      Log.info { "performing 'RegisterTargetWithMaintenanceWindow' operation" }
      response = post("RegisterTargetWithMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterTargetWithMaintenanceWindowResult).new(response)
    end

    def register_task_with_maintenance_window(input : AS::RegisterTaskWithMaintenanceWindowRequest) : Core::ParsedResponse(AS::RegisterTaskWithMaintenanceWindowResult)
      Log.info { "performing 'RegisterTaskWithMaintenanceWindow' operation" }
      response = post("RegisterTaskWithMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterTaskWithMaintenanceWindowResult).new(response)
    end

    def remove_tags_from_resource(input : AS::RemoveTagsFromResourceRequest) : Core::ParsedResponse(AS::RemoveTagsFromResourceResult)
      Log.info { "performing 'RemoveTagsFromResource' operation" }
      response = post("RemoveTagsFromResource", "/", input.to_json)
      Core::ParsedResponse(AS::RemoveTagsFromResourceResult).new(response)
    end

    def reset_service_setting(input : AS::ResetServiceSettingRequest) : Core::ParsedResponse(AS::ResetServiceSettingResult)
      Log.info { "performing 'ResetServiceSetting' operation" }
      response = post("ResetServiceSetting", "/", input.to_json)
      Core::ParsedResponse(AS::ResetServiceSettingResult).new(response)
    end

    def resume_session(input : AS::ResumeSessionRequest) : Core::ParsedResponse(AS::ResumeSessionResponse)
      Log.info { "performing 'ResumeSession' operation" }
      response = post("ResumeSession", "/", input.to_json)
      Core::ParsedResponse(AS::ResumeSessionResponse).new(response)
    end

    def send_automation_signal(input : AS::SendAutomationSignalRequest) : Core::ParsedResponse(AS::SendAutomationSignalResult)
      Log.info { "performing 'SendAutomationSignal' operation" }
      response = post("SendAutomationSignal", "/", input.to_json)
      Core::ParsedResponse(AS::SendAutomationSignalResult).new(response)
    end

    def send_command(input : AS::SendCommandRequest) : Core::ParsedResponse(AS::SendCommandResult)
      Log.info { "performing 'SendCommand' operation" }
      response = post("SendCommand", "/", input.to_json)
      Core::ParsedResponse(AS::SendCommandResult).new(response)
    end

    def start_associations_once(input : AS::StartAssociationsOnceRequest) : Core::ParsedResponse(AS::StartAssociationsOnceResult)
      Log.info { "performing 'StartAssociationsOnce' operation" }
      response = post("StartAssociationsOnce", "/", input.to_json)
      Core::ParsedResponse(AS::StartAssociationsOnceResult).new(response)
    end

    def start_automation_execution(input : AS::StartAutomationExecutionRequest) : Core::ParsedResponse(AS::StartAutomationExecutionResult)
      Log.info { "performing 'StartAutomationExecution' operation" }
      response = post("StartAutomationExecution", "/", input.to_json)
      Core::ParsedResponse(AS::StartAutomationExecutionResult).new(response)
    end

    def start_change_request_execution(input : AS::StartChangeRequestExecutionRequest) : Core::ParsedResponse(AS::StartChangeRequestExecutionResult)
      Log.info { "performing 'StartChangeRequestExecution' operation" }
      response = post("StartChangeRequestExecution", "/", input.to_json)
      Core::ParsedResponse(AS::StartChangeRequestExecutionResult).new(response)
    end

    def start_session(input : AS::StartSessionRequest) : Core::ParsedResponse(AS::StartSessionResponse)
      Log.info { "performing 'StartSession' operation" }
      response = post("StartSession", "/", input.to_json)
      Core::ParsedResponse(AS::StartSessionResponse).new(response)
    end

    def stop_automation_execution(input : AS::StopAutomationExecutionRequest) : Core::ParsedResponse(AS::StopAutomationExecutionResult)
      Log.info { "performing 'StopAutomationExecution' operation" }
      response = post("StopAutomationExecution", "/", input.to_json)
      Core::ParsedResponse(AS::StopAutomationExecutionResult).new(response)
    end

    def terminate_session(input : AS::TerminateSessionRequest) : Core::ParsedResponse(AS::TerminateSessionResponse)
      Log.info { "performing 'TerminateSession' operation" }
      response = post("TerminateSession", "/", input.to_json)
      Core::ParsedResponse(AS::TerminateSessionResponse).new(response)
    end

    def unlabel_parameter_version(input : AS::UnlabelParameterVersionRequest) : Core::ParsedResponse(AS::UnlabelParameterVersionResult)
      Log.info { "performing 'UnlabelParameterVersion' operation" }
      response = post("UnlabelParameterVersion", "/", input.to_json)
      Core::ParsedResponse(AS::UnlabelParameterVersionResult).new(response)
    end

    def update_association(input : AS::UpdateAssociationRequest) : Core::ParsedResponse(AS::UpdateAssociationResult)
      Log.info { "performing 'UpdateAssociation' operation" }
      response = post("UpdateAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateAssociationResult).new(response)
    end

    def update_association_status(input : AS::UpdateAssociationStatusRequest) : Core::ParsedResponse(AS::UpdateAssociationStatusResult)
      Log.info { "performing 'UpdateAssociationStatus' operation" }
      response = post("UpdateAssociationStatus", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateAssociationStatusResult).new(response)
    end

    def update_document(input : AS::UpdateDocumentRequest) : Core::ParsedResponse(AS::UpdateDocumentResult)
      Log.info { "performing 'UpdateDocument' operation" }
      response = post("UpdateDocument", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateDocumentResult).new(response)
    end

    def update_document_default_version(input : AS::UpdateDocumentDefaultVersionRequest) : Core::ParsedResponse(AS::UpdateDocumentDefaultVersionResult)
      Log.info { "performing 'UpdateDocumentDefaultVersion' operation" }
      response = post("UpdateDocumentDefaultVersion", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateDocumentDefaultVersionResult).new(response)
    end

    def update_document_metadata(input : AS::UpdateDocumentMetadataRequest) : Core::ParsedResponse(AS::UpdateDocumentMetadataResponse)
      Log.info { "performing 'UpdateDocumentMetadata' operation" }
      response = post("UpdateDocumentMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateDocumentMetadataResponse).new(response)
    end

    def update_maintenance_window(input : AS::UpdateMaintenanceWindowRequest) : Core::ParsedResponse(AS::UpdateMaintenanceWindowResult)
      Log.info { "performing 'UpdateMaintenanceWindow' operation" }
      response = post("UpdateMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateMaintenanceWindowResult).new(response)
    end

    def update_maintenance_window_target(input : AS::UpdateMaintenanceWindowTargetRequest) : Core::ParsedResponse(AS::UpdateMaintenanceWindowTargetResult)
      Log.info { "performing 'UpdateMaintenanceWindowTarget' operation" }
      response = post("UpdateMaintenanceWindowTarget", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateMaintenanceWindowTargetResult).new(response)
    end

    def update_maintenance_window_task(input : AS::UpdateMaintenanceWindowTaskRequest) : Core::ParsedResponse(AS::UpdateMaintenanceWindowTaskResult)
      Log.info { "performing 'UpdateMaintenanceWindowTask' operation" }
      response = post("UpdateMaintenanceWindowTask", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateMaintenanceWindowTaskResult).new(response)
    end

    def update_managed_instance_role(input : AS::UpdateManagedInstanceRoleRequest) : Core::ParsedResponse(AS::UpdateManagedInstanceRoleResult)
      Log.info { "performing 'UpdateManagedInstanceRole' operation" }
      response = post("UpdateManagedInstanceRole", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateManagedInstanceRoleResult).new(response)
    end

    def update_ops_item(input : AS::UpdateOpsItemRequest) : Core::ParsedResponse(AS::UpdateOpsItemResponse)
      Log.info { "performing 'UpdateOpsItem' operation" }
      response = post("UpdateOpsItem", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateOpsItemResponse).new(response)
    end

    def update_ops_metadata(input : AS::UpdateOpsMetadataRequest) : Core::ParsedResponse(AS::UpdateOpsMetadataResult)
      Log.info { "performing 'UpdateOpsMetadata' operation" }
      response = post("UpdateOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateOpsMetadataResult).new(response)
    end

    def update_patch_baseline(input : AS::UpdatePatchBaselineRequest) : Core::ParsedResponse(AS::UpdatePatchBaselineResult)
      Log.info { "performing 'UpdatePatchBaseline' operation" }
      response = post("UpdatePatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::UpdatePatchBaselineResult).new(response)
    end

    def update_resource_data_sync(input : AS::UpdateResourceDataSyncRequest) : Core::ParsedResponse(AS::UpdateResourceDataSyncResult)
      Log.info { "performing 'UpdateResourceDataSync' operation" }
      response = post("UpdateResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateResourceDataSyncResult).new(response)
    end

    def update_service_setting(input : AS::UpdateServiceSettingRequest) : Core::ParsedResponse(AS::UpdateServiceSettingResult)
      Log.info { "performing 'UpdateServiceSetting' operation" }
      response = post("UpdateServiceSetting", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateServiceSettingResult).new(response)
    end
  end
end
