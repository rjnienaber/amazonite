private alias AS = Amazonite::SsmV1
private alias Core = Amazonite::Core

module Amazonite::SsmV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.ssm_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonSSM", "ssm", "1.1", EXCEPTION_FACTORY, config)
    end

    # Adds or overwrites one or more tags for the specified resource. *Tags* are metadata that you can
    # assign to your automations, documents, managed nodes, maintenance windows, Parameter Store
    # parameters, and patch baselines. Tags enable you to categorize your resources in different ways,
    # for example, by purpose, owner, or environment. Each tag consists of a key and an optional
    # value, both of which you define. For example, you could define a set of tags for your account's
    # managed nodes that helps you track each node's owner and stack level. For example:
    #
    # - `Key=Owner,Value=DbAdmin`
    #
    # - `Key=Owner,Value=SysAdmin`
    #
    # - `Key=Owner,Value=Dev`
    #
    # - `Key=Stack,Value=Production`
    #
    # - `Key=Stack,Value=Pre-Production`
    #
    # - `Key=Stack,Value=Test`
    #
    # Most resources can have a maximum of 50 tags. Automations can have a maximum of 5 tags.
    #
    # We recommend that you devise a set of tag keys that meets your needs for each resource type.
    # Using a consistent set of tag keys makes it easier for you to manage your resources. You can
    # search and filter the resources based on the tags you add. Tags don't have any semantic meaning
    # to and are interpreted strictly as a string of characters.
    #
    # For more information about using tags with Amazon Elastic Compute Cloud (Amazon EC2) instances,
    # see [Tag your Amazon EC2
    # resources](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Using_Tags.html) in the *Amazon
    # EC2 User Guide*.
    def add_tags_to_resource(input : AS::AddTagsToResourceRequest) : Core::ParsedResponse(AS::AddTagsToResourceResult)
      Log.info { "performing 'AddTagsToResource' operation" }
      response = post("AddTagsToResource", "/", input.to_json)
      Core::ParsedResponse(AS::AddTagsToResourceResult).new(response)
    end

    # Associates a related item to a Systems Manager OpsCenter OpsItem. For example, you can associate
    # an Incident Manager incident or analysis with an OpsItem. Incident Manager and OpsCenter are
    # tools in Amazon Web Services Systems Manager.
    def associate_ops_item_related_item(input : AS::AssociateOpsItemRelatedItemRequest) : Core::ParsedResponse(AS::AssociateOpsItemRelatedItemResponse)
      Log.info { "performing 'AssociateOpsItemRelatedItem' operation" }
      response = post("AssociateOpsItemRelatedItem", "/", input.to_json)
      Core::ParsedResponse(AS::AssociateOpsItemRelatedItemResponse).new(response)
    end

    # Attempts to cancel the command specified by the Command ID. There is no guarantee that the
    # command will be terminated and the underlying process stopped.
    def cancel_command(input : AS::CancelCommandRequest) : Core::ParsedResponse(AS::CancelCommandResult)
      Log.info { "performing 'CancelCommand' operation" }
      response = post("CancelCommand", "/", input.to_json)
      Core::ParsedResponse(AS::CancelCommandResult).new(response)
    end

    # Stops a maintenance window execution that is already in progress and cancels any tasks in the
    # window that haven't already starting running. Tasks already in progress will continue to
    # completion.
    def cancel_maintenance_window_execution(input : AS::CancelMaintenanceWindowExecutionRequest) : Core::ParsedResponse(AS::CancelMaintenanceWindowExecutionResult)
      Log.info { "performing 'CancelMaintenanceWindowExecution' operation" }
      response = post("CancelMaintenanceWindowExecution", "/", input.to_json)
      Core::ParsedResponse(AS::CancelMaintenanceWindowExecutionResult).new(response)
    end

    # Generates an activation code and activation ID you can use to register your on-premises servers,
    # edge devices, or virtual machine (VM) with Amazon Web Services Systems Manager. Registering
    # these machines with Systems Manager makes it possible to manage them using Systems Manager
    # tools. You use the activation code and ID when installing SSM Agent on machines in your hybrid
    # environment. For more information about requirements for managing on-premises machines using
    # Systems Manager, see [Using Amazon Web Services Systems Manager in hybrid and multicloud
    # environments](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-hybrid-multicloud.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # Amazon Elastic Compute Cloud (Amazon EC2) instances, edge devices, and on-premises servers and
    # VMs that are configured for Systems Manager are all called *managed nodes*.
    def create_activation(input : AS::CreateActivationRequest) : Core::ParsedResponse(AS::CreateActivationResult)
      Log.info { "performing 'CreateActivation' operation" }
      response = post("CreateActivation", "/", input.to_json)
      Core::ParsedResponse(AS::CreateActivationResult).new(response)
    end

    # A State Manager association defines the state that you want to maintain on your managed nodes.
    # For example, an association can specify that anti-virus software must be installed and running
    # on your managed nodes, or that certain ports must be closed. For static targets, the association
    # specifies a schedule for when the configuration is reapplied. For dynamic targets, such as an
    # Amazon Web Services resource group or an Amazon Web Services autoscaling group, State Manager, a
    # tool in Amazon Web Services Systems Manager applies the configuration when new managed nodes are
    # added to the group. The association also specifies actions to take when applying the
    # configuration. For example, an association for anti-virus software might run once a day. If the
    # software isn't installed, then State Manager installs it. If the software is installed, but the
    # service isn't running, then the association might instruct State Manager to start the service.
    def create_association(input : AS::CreateAssociationRequest) : Core::ParsedResponse(AS::CreateAssociationResult)
      Log.info { "performing 'CreateAssociation' operation" }
      response = post("CreateAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::CreateAssociationResult).new(response)
    end

    # Associates the specified Amazon Web Services Systems Manager document (SSM document) with the
    # specified managed nodes or targets.
    #
    # When you associate a document with one or more managed nodes using IDs or tags, Amazon Web
    # Services Systems Manager Agent (SSM Agent) running on the managed node processes the document
    # and configures the node as specified.
    #
    # If you associate a document with a managed node that already has an associated document, the
    # system returns the AssociationAlreadyExists exception.
    def create_association_batch(input : AS::CreateAssociationBatchRequest) : Core::ParsedResponse(AS::CreateAssociationBatchResult)
      Log.info { "performing 'CreateAssociationBatch' operation" }
      response = post("CreateAssociationBatch", "/", input.to_json)
      Core::ParsedResponse(AS::CreateAssociationBatchResult).new(response)
    end

    # Creates a cloud connector that establishes a connection between Systems Manager and a
    # third-party cloud environment.
    def create_cloud_connector(input : AS::CreateCloudConnectorRequest) : Core::ParsedResponse(AS::CreateCloudConnectorResult)
      Log.info { "performing 'CreateCloudConnector' operation" }
      response = post("CreateCloudConnector", "/", input.to_json)
      Core::ParsedResponse(AS::CreateCloudConnectorResult).new(response)
    end

    # Creates a Amazon Web Services Systems Manager (SSM document). An SSM document defines the
    # actions that Systems Manager performs on your managed nodes. For more information about SSM
    # documents, including information about supported schemas, features, and syntax, see [Amazon Web
    # Services Systems Manager
    # Documents](https://docs.aws.amazon.com/systems-manager/latest/userguide/documents.html) in the
    # *Amazon Web Services Systems Manager User Guide*.
    def create_document(input : AS::CreateDocumentRequest) : Core::ParsedResponse(AS::CreateDocumentResult)
      Log.info { "performing 'CreateDocument' operation" }
      response = post("CreateDocument", "/", input.to_json)
      Core::ParsedResponse(AS::CreateDocumentResult).new(response)
    end

    # Creates a new maintenance window.
    #
    # The value you specify for `Duration` determines the specific end time for the maintenance window
    # based on the time it begins. No maintenance window tasks are permitted to start after the
    # resulting endtime minus the number of hours you specify for `Cutoff`. For example, if the
    # maintenance window starts at 3 PM, the duration is three hours, and the value you specify for
    # `Cutoff` is one hour, no maintenance window tasks can start after 5 PM.
    def create_maintenance_window(input : AS::CreateMaintenanceWindowRequest) : Core::ParsedResponse(AS::CreateMaintenanceWindowResult)
      Log.info { "performing 'CreateMaintenanceWindow' operation" }
      response = post("CreateMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::CreateMaintenanceWindowResult).new(response)
    end

    # Creates a new OpsItem. You must have permission in Identity and Access Management (IAM) to
    # create a new OpsItem. For more information, see [Set up
    # OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html) in
    # the *Amazon Web Services Systems Manager User Guide*.
    #
    # Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to
    # view, investigate, and remediate operational issues impacting the performance and health of
    # their Amazon Web Services resources. For more information, see [Amazon Web Services Systems
    # Manager OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    def create_ops_item(input : AS::CreateOpsItemRequest) : Core::ParsedResponse(AS::CreateOpsItemResponse)
      Log.info { "performing 'CreateOpsItem' operation" }
      response = post("CreateOpsItem", "/", input.to_json)
      Core::ParsedResponse(AS::CreateOpsItemResponse).new(response)
    end

    # If you create a new application in Application Manager, Amazon Web Services Systems Manager
    # calls this API operation to specify information about the new application, including the
    # application type.
    def create_ops_metadata(input : AS::CreateOpsMetadataRequest) : Core::ParsedResponse(AS::CreateOpsMetadataResult)
      Log.info { "performing 'CreateOpsMetadata' operation" }
      response = post("CreateOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::CreateOpsMetadataResult).new(response)
    end

    # Creates a patch baseline.
    #
    # For information about valid key-value pairs in `PatchFilters` for each supported operating
    # system type, see PatchFilter.
    def create_patch_baseline(input : AS::CreatePatchBaselineRequest) : Core::ParsedResponse(AS::CreatePatchBaselineResult)
      Log.info { "performing 'CreatePatchBaseline' operation" }
      response = post("CreatePatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::CreatePatchBaselineResult).new(response)
    end

    # A resource data sync helps you view data from multiple sources in a single location. Amazon Web
    # Services Systems Manager offers two types of resource data sync: `SyncToDestination` and
    # `SyncFromSource`.
    #
    # You can configure Systems Manager Inventory to use the `SyncToDestination` type to synchronize
    # Inventory data from multiple Amazon Web Services Regions to a single Amazon Simple Storage
    # Service (Amazon S3) bucket. For more information, see [Creating a resource data sync for
    # Inventory](https://docs.aws.amazon.com/systems-manager/latest/userguide/inventory-create-resource-data-sync.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # You can configure Systems Manager Explorer to use the `SyncFromSource` type to synchronize
    # operational work items (OpsItems) and operational data (OpsData) from multiple Amazon Web
    # Services Regions to a single Amazon S3 bucket. This type can synchronize OpsItems and OpsData
    # from multiple Amazon Web Services accounts and Amazon Web Services Regions or
    # `EntireOrganization` by using Organizations. For more information, see [Setting up Systems
    # Manager Explorer to display data from multiple accounts and
    # Regions](https://docs.aws.amazon.com/systems-manager/latest/userguide/Explorer-resource-data-sync.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # A resource data sync is an asynchronous operation that returns immediately. After a successful
    # initial sync is completed, the system continuously syncs data. To check the status of a sync,
    # use the ListResourceDataSync.
    #
    # By default, data isn't encrypted in Amazon S3. We strongly recommend that you enable encryption
    # in Amazon S3 to ensure secure data storage. We also recommend that you secure access to the
    # Amazon S3 bucket by creating a restrictive bucket policy.
    def create_resource_data_sync(input : AS::CreateResourceDataSyncRequest) : Core::ParsedResponse(AS::CreateResourceDataSyncResult)
      Log.info { "performing 'CreateResourceDataSync' operation" }
      response = post("CreateResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::CreateResourceDataSyncResult).new(response)
    end

    # Deletes an activation. You aren't required to delete an activation. If you delete an activation,
    # you can no longer use it to register additional managed nodes. Deleting an activation doesn't
    # de-register managed nodes. You must manually de-register managed nodes.
    def delete_activation(input : AS::DeleteActivationRequest) : Core::ParsedResponse(AS::DeleteActivationResult)
      Log.info { "performing 'DeleteActivation' operation" }
      response = post("DeleteActivation", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteActivationResult).new(response)
    end

    # Disassociates the specified Amazon Web Services Systems Manager document (SSM document) from the
    # specified managed node. If you created the association by using the `Targets` parameter, then
    # you must delete the association by using the association ID.
    #
    # When you disassociate a document from a managed node, it doesn't change the configuration of the
    # node. To change the configuration state of a managed node after you disassociate a document, you
    # must create a new document with the desired configuration and associate it with the node.
    def delete_association(input : AS::DeleteAssociationRequest) : Core::ParsedResponse(AS::DeleteAssociationResult)
      Log.info { "performing 'DeleteAssociation' operation" }
      response = post("DeleteAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteAssociationResult).new(response)
    end

    # Deletes a cloud connector.
    def delete_cloud_connector(input : AS::DeleteCloudConnectorRequest) : Core::ParsedResponse(AS::DeleteCloudConnectorResult)
      Log.info { "performing 'DeleteCloudConnector' operation" }
      response = post("DeleteCloudConnector", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteCloudConnectorResult).new(response)
    end

    # Deletes the Amazon Web Services Systems Manager document (SSM document) and all managed node
    # associations to the document.
    #
    # Before you delete the document, we recommend that you use DeleteAssociation to disassociate all
    # managed nodes that are associated with the document.
    def delete_document(input : AS::DeleteDocumentRequest) : Core::ParsedResponse(AS::DeleteDocumentResult)
      Log.info { "performing 'DeleteDocument' operation" }
      response = post("DeleteDocument", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteDocumentResult).new(response)
    end

    # Delete a custom inventory type or the data associated with a custom Inventory type. Deleting a
    # custom inventory type is also referred to as deleting a custom inventory schema.
    def delete_inventory(input : AS::DeleteInventoryRequest) : Core::ParsedResponse(AS::DeleteInventoryResult)
      Log.info { "performing 'DeleteInventory' operation" }
      response = post("DeleteInventory", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteInventoryResult).new(response)
    end

    # Deletes a maintenance window.
    def delete_maintenance_window(input : AS::DeleteMaintenanceWindowRequest) : Core::ParsedResponse(AS::DeleteMaintenanceWindowResult)
      Log.info { "performing 'DeleteMaintenanceWindow' operation" }
      response = post("DeleteMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteMaintenanceWindowResult).new(response)
    end

    # Delete an OpsItem. You must have permission in Identity and Access Management (IAM) to delete an
    # OpsItem.
    #
    # Note the following important information about this operation.
    #
    # - Deleting an OpsItem is irreversible. You can't restore a deleted OpsItem.
    #
    # - This operation uses an *eventual consistency model*, which means the system can take a few
    # minutes to complete this operation. If you delete an OpsItem and immediately call, for example,
    # GetOpsItem, the deleted OpsItem might still appear in the response.
    #
    # - This operation is idempotent. The system doesn't throw an exception if you repeatedly call
    # this operation for the same OpsItem. If the first call is successful, all additional calls
    # return the same successful response as the first call.
    #
    # - This operation doesn't support cross-account calls. A delegated administrator or management
    # account can't delete OpsItems in other accounts, even if OpsCenter has been set up for
    # cross-account administration. For more information about cross-account administration, see
    # [Setting up OpsCenter to centrally manage OpsItems across
    # accounts](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setting-up-cross-account.html)
    # in the *Systems Manager User Guide*.
    def delete_ops_item(input : AS::DeleteOpsItemRequest) : Core::ParsedResponse(AS::DeleteOpsItemResponse)
      Log.info { "performing 'DeleteOpsItem' operation" }
      response = post("DeleteOpsItem", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteOpsItemResponse).new(response)
    end

    # Delete OpsMetadata related to an application.
    def delete_ops_metadata(input : AS::DeleteOpsMetadataRequest) : Core::ParsedResponse(AS::DeleteOpsMetadataResult)
      Log.info { "performing 'DeleteOpsMetadata' operation" }
      response = post("DeleteOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteOpsMetadataResult).new(response)
    end

    # Delete a parameter from the system. After deleting a parameter, wait for at least 30 seconds to
    # create a parameter with the same name.
    def delete_parameter(input : AS::DeleteParameterRequest) : Core::ParsedResponse(AS::DeleteParameterResult)
      Log.info { "performing 'DeleteParameter' operation" }
      response = post("DeleteParameter", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteParameterResult).new(response)
    end

    # Delete a list of parameters. After deleting a parameter, wait for at least 30 seconds to create
    # a parameter with the same name.
    def delete_parameters(input : AS::DeleteParametersRequest) : Core::ParsedResponse(AS::DeleteParametersResult)
      Log.info { "performing 'DeleteParameters' operation" }
      response = post("DeleteParameters", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteParametersResult).new(response)
    end

    # Deletes a patch baseline.
    def delete_patch_baseline(input : AS::DeletePatchBaselineRequest) : Core::ParsedResponse(AS::DeletePatchBaselineResult)
      Log.info { "performing 'DeletePatchBaseline' operation" }
      response = post("DeletePatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::DeletePatchBaselineResult).new(response)
    end

    # Deletes a resource data sync configuration. After the configuration is deleted, changes to data
    # on managed nodes are no longer synced to or from the target. Deleting a sync configuration
    # doesn't delete data.
    def delete_resource_data_sync(input : AS::DeleteResourceDataSyncRequest) : Core::ParsedResponse(AS::DeleteResourceDataSyncResult)
      Log.info { "performing 'DeleteResourceDataSync' operation" }
      response = post("DeleteResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteResourceDataSyncResult).new(response)
    end

    # Deletes a Systems Manager resource policy. A resource policy helps you to define the IAM entity
    # (for example, an Amazon Web Services account) that can manage your Systems Manager resources.
    # The following resources support Systems Manager resource policies.
    #
    # - `OpsItemGroup` - The resource policy for `OpsItemGroup` enables Amazon Web Services accounts
    # to view and interact with OpsCenter operational work items (OpsItems).
    #
    # - `Parameter` - The resource policy is used to share a parameter with other accounts using
    # Resource Access Manager (RAM). For more information about cross-account sharing of parameters,
    # see [Working with shared
    # parameters](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    def delete_resource_policy(input : AS::DeleteResourcePolicyRequest) : Core::ParsedResponse(AS::DeleteResourcePolicyResponse)
      Log.info { "performing 'DeleteResourcePolicy' operation" }
      response = post("DeleteResourcePolicy", "/", input.to_json)
      Core::ParsedResponse(AS::DeleteResourcePolicyResponse).new(response)
    end

    # Removes the server or virtual machine from the list of registered servers.
    #
    # If you want to reregister an on-premises server, edge device, or VM, you must use a different
    # Activation Code and Activation ID than used to register the machine previously. The Activation
    # Code and Activation ID must not have already been used on the maximum number of activations
    # specified when they were created. For more information, see [Deregistering managed nodes in a
    # hybrid and multicloud
    # environment](https://docs.aws.amazon.com/systems-manager/latest/userguide/fleet-manager-deregister-hybrid-nodes.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    def deregister_managed_instance(input : AS::DeregisterManagedInstanceRequest) : Core::ParsedResponse(AS::DeregisterManagedInstanceResult)
      Log.info { "performing 'DeregisterManagedInstance' operation" }
      response = post("DeregisterManagedInstance", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterManagedInstanceResult).new(response)
    end

    # Removes a patch group from a patch baseline.
    def deregister_patch_baseline_for_patch_group(input : AS::DeregisterPatchBaselineForPatchGroupRequest) : Core::ParsedResponse(AS::DeregisterPatchBaselineForPatchGroupResult)
      Log.info { "performing 'DeregisterPatchBaselineForPatchGroup' operation" }
      response = post("DeregisterPatchBaselineForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterPatchBaselineForPatchGroupResult).new(response)
    end

    # Removes a target from a maintenance window.
    def deregister_target_from_maintenance_window(input : AS::DeregisterTargetFromMaintenanceWindowRequest) : Core::ParsedResponse(AS::DeregisterTargetFromMaintenanceWindowResult)
      Log.info { "performing 'DeregisterTargetFromMaintenanceWindow' operation" }
      response = post("DeregisterTargetFromMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterTargetFromMaintenanceWindowResult).new(response)
    end

    # Removes a task from a maintenance window.
    def deregister_task_from_maintenance_window(input : AS::DeregisterTaskFromMaintenanceWindowRequest) : Core::ParsedResponse(AS::DeregisterTaskFromMaintenanceWindowResult)
      Log.info { "performing 'DeregisterTaskFromMaintenanceWindow' operation" }
      response = post("DeregisterTaskFromMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::DeregisterTaskFromMaintenanceWindowResult).new(response)
    end

    # Describes details about the activation, such as the date and time the activation was created,
    # its expiration date, the Identity and Access Management (IAM) role assigned to the managed nodes
    # in the activation, and the number of nodes registered by using this activation.
    def describe_activations(input : AS::DescribeActivationsRequest) : Core::ParsedResponse(AS::DescribeActivationsResult)
      Log.info { "performing 'DescribeActivations' operation" }
      response = post("DescribeActivations", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeActivationsResult).new(response)
    end

    # Describes the association for the specified target or managed node. If you created the
    # association by using the `Targets` parameter, then you must retrieve the association by using
    # the association ID.
    def describe_association(input : AS::DescribeAssociationRequest) : Core::ParsedResponse(AS::DescribeAssociationResult)
      Log.info { "performing 'DescribeAssociation' operation" }
      response = post("DescribeAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAssociationResult).new(response)
    end

    # Views all executions for a specific association ID.
    def describe_association_executions(input : AS::DescribeAssociationExecutionsRequest) : Core::ParsedResponse(AS::DescribeAssociationExecutionsResult)
      Log.info { "performing 'DescribeAssociationExecutions' operation" }
      response = post("DescribeAssociationExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAssociationExecutionsResult).new(response)
    end

    # Views information about a specific execution of a specific association.
    def describe_association_execution_targets(input : AS::DescribeAssociationExecutionTargetsRequest) : Core::ParsedResponse(AS::DescribeAssociationExecutionTargetsResult)
      Log.info { "performing 'DescribeAssociationExecutionTargets' operation" }
      response = post("DescribeAssociationExecutionTargets", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAssociationExecutionTargetsResult).new(response)
    end

    # Provides details about all active and terminated Automation executions.
    def describe_automation_executions(input : AS::DescribeAutomationExecutionsRequest) : Core::ParsedResponse(AS::DescribeAutomationExecutionsResult)
      Log.info { "performing 'DescribeAutomationExecutions' operation" }
      response = post("DescribeAutomationExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAutomationExecutionsResult).new(response)
    end

    # Information about all active and terminated step executions in an Automation workflow.
    def describe_automation_step_executions(input : AS::DescribeAutomationStepExecutionsRequest) : Core::ParsedResponse(AS::DescribeAutomationStepExecutionsResult)
      Log.info { "performing 'DescribeAutomationStepExecutions' operation" }
      response = post("DescribeAutomationStepExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAutomationStepExecutionsResult).new(response)
    end

    # Lists all patches eligible to be included in a patch baseline.
    #
    # Currently, `DescribeAvailablePatches` supports only the Amazon Linux 1, Amazon Linux 2, and
    # Windows Server operating systems.
    def describe_available_patches(input : AS::DescribeAvailablePatchesRequest) : Core::ParsedResponse(AS::DescribeAvailablePatchesResult)
      Log.info { "performing 'DescribeAvailablePatches' operation" }
      response = post("DescribeAvailablePatches", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeAvailablePatchesResult).new(response)
    end

    # Describes the specified Amazon Web Services Systems Manager document (SSM document).
    def describe_document(input : AS::DescribeDocumentRequest) : Core::ParsedResponse(AS::DescribeDocumentResult)
      Log.info { "performing 'DescribeDocument' operation" }
      response = post("DescribeDocument", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeDocumentResult).new(response)
    end

    # Describes the permissions for a Amazon Web Services Systems Manager document (SSM document). If
    # you created the document, you are the owner. If a document is shared, it can either be shared
    # privately (by specifying a user's Amazon Web Services account ID) or publicly (*All*).
    def describe_document_permission(input : AS::DescribeDocumentPermissionRequest) : Core::ParsedResponse(AS::DescribeDocumentPermissionResponse)
      Log.info { "performing 'DescribeDocumentPermission' operation" }
      response = post("DescribeDocumentPermission", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeDocumentPermissionResponse).new(response)
    end

    # All associations for the managed nodes.
    def describe_effective_instance_associations(input : AS::DescribeEffectiveInstanceAssociationsRequest) : Core::ParsedResponse(AS::DescribeEffectiveInstanceAssociationsResult)
      Log.info { "performing 'DescribeEffectiveInstanceAssociations' operation" }
      response = post("DescribeEffectiveInstanceAssociations", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeEffectiveInstanceAssociationsResult).new(response)
    end

    # Retrieves the current effective patches (the patch and the approval state) for the specified
    # patch baseline. Applies to patch baselines for Windows only.
    def describe_effective_patches_for_patch_baseline(input : AS::DescribeEffectivePatchesForPatchBaselineRequest) : Core::ParsedResponse(AS::DescribeEffectivePatchesForPatchBaselineResult)
      Log.info { "performing 'DescribeEffectivePatchesForPatchBaseline' operation" }
      response = post("DescribeEffectivePatchesForPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeEffectivePatchesForPatchBaselineResult).new(response)
    end

    # The status of the associations for the managed nodes.
    def describe_instance_associations_status(input : AS::DescribeInstanceAssociationsStatusRequest) : Core::ParsedResponse(AS::DescribeInstanceAssociationsStatusResult)
      Log.info { "performing 'DescribeInstanceAssociationsStatus' operation" }
      response = post("DescribeInstanceAssociationsStatus", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstanceAssociationsStatusResult).new(response)
    end

    # Provides information about one or more of your managed nodes, including the operating system
    # platform, SSM Agent version, association status, and IP address. This operation does not return
    # information for nodes that are either Stopped or Terminated.
    #
    # If you specify one or more node IDs, the operation returns information for those managed nodes.
    # If you don't specify node IDs, it returns information for all your managed nodes. If you specify
    # a node ID that isn't valid or a node that you don't own, you receive an error.
    #
    # The `IamRole` field returned for this API operation is the role assigned to an Amazon EC2
    # instance configured with a Systems Manager Quick Setup host management configuration or the role
    # assigned to an on-premises managed node.
    def describe_instance_information(input : AS::DescribeInstanceInformationRequest) : Core::ParsedResponse(AS::DescribeInstanceInformationResult)
      Log.info { "performing 'DescribeInstanceInformation' operation" }
      response = post("DescribeInstanceInformation", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstanceInformationResult).new(response)
    end

    # Retrieves information about the patches on the specified managed node and their state relative
    # to the patch baseline being used for the node.
    def describe_instance_patches(input : AS::DescribeInstancePatchesRequest) : Core::ParsedResponse(AS::DescribeInstancePatchesResult)
      Log.info { "performing 'DescribeInstancePatches' operation" }
      response = post("DescribeInstancePatches", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstancePatchesResult).new(response)
    end

    # Retrieves the high-level patch state of one or more managed nodes.
    def describe_instance_patch_states(input : AS::DescribeInstancePatchStatesRequest) : Core::ParsedResponse(AS::DescribeInstancePatchStatesResult)
      Log.info { "performing 'DescribeInstancePatchStates' operation" }
      response = post("DescribeInstancePatchStates", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstancePatchStatesResult).new(response)
    end

    # Retrieves the high-level patch state for the managed nodes in the specified patch group.
    def describe_instance_patch_states_for_patch_group(input : AS::DescribeInstancePatchStatesForPatchGroupRequest) : Core::ParsedResponse(AS::DescribeInstancePatchStatesForPatchGroupResult)
      Log.info { "performing 'DescribeInstancePatchStatesForPatchGroup' operation" }
      response = post("DescribeInstancePatchStatesForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstancePatchStatesForPatchGroupResult).new(response)
    end

    # An API operation used by the Systems Manager console to display information about Systems
    # Manager managed nodes.
    def describe_instance_properties(input : AS::DescribeInstancePropertiesRequest) : Core::ParsedResponse(AS::DescribeInstancePropertiesResult)
      Log.info { "performing 'DescribeInstanceProperties' operation" }
      response = post("DescribeInstanceProperties", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInstancePropertiesResult).new(response)
    end

    # Describes a specific delete inventory operation.
    def describe_inventory_deletions(input : AS::DescribeInventoryDeletionsRequest) : Core::ParsedResponse(AS::DescribeInventoryDeletionsResult)
      Log.info { "performing 'DescribeInventoryDeletions' operation" }
      response = post("DescribeInventoryDeletions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeInventoryDeletionsResult).new(response)
    end

    # Lists the executions of a maintenance window. This includes information about when the
    # maintenance window was scheduled to be active, and information about tasks registered and run
    # with the maintenance window.
    def describe_maintenance_window_executions(input : AS::DescribeMaintenanceWindowExecutionsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionsResult)
      Log.info { "performing 'DescribeMaintenanceWindowExecutions' operation" }
      response = post("DescribeMaintenanceWindowExecutions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionsResult).new(response)
    end

    # Retrieves the individual task executions (one per target) for a particular task run as part of a
    # maintenance window execution.
    def describe_maintenance_window_execution_task_invocations(input : AS::DescribeMaintenanceWindowExecutionTaskInvocationsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTaskInvocationsResult)
      Log.info { "performing 'DescribeMaintenanceWindowExecutionTaskInvocations' operation" }
      response = post("DescribeMaintenanceWindowExecutionTaskInvocations", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTaskInvocationsResult).new(response)
    end

    # For a given maintenance window execution, lists the tasks that were run.
    def describe_maintenance_window_execution_tasks(input : AS::DescribeMaintenanceWindowExecutionTasksRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTasksResult)
      Log.info { "performing 'DescribeMaintenanceWindowExecutionTasks' operation" }
      response = post("DescribeMaintenanceWindowExecutionTasks", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowExecutionTasksResult).new(response)
    end

    # Retrieves the maintenance windows in an Amazon Web Services account.
    def describe_maintenance_windows(input : AS::DescribeMaintenanceWindowsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowsResult)
      Log.info { "performing 'DescribeMaintenanceWindows' operation" }
      response = post("DescribeMaintenanceWindows", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowsResult).new(response)
    end

    # Retrieves information about upcoming executions of a maintenance window.
    def describe_maintenance_window_schedule(input : AS::DescribeMaintenanceWindowScheduleRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowScheduleResult)
      Log.info { "performing 'DescribeMaintenanceWindowSchedule' operation" }
      response = post("DescribeMaintenanceWindowSchedule", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowScheduleResult).new(response)
    end

    # Retrieves information about the maintenance window targets or tasks that a managed node is
    # associated with.
    def describe_maintenance_windows_for_target(input : AS::DescribeMaintenanceWindowsForTargetRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowsForTargetResult)
      Log.info { "performing 'DescribeMaintenanceWindowsForTarget' operation" }
      response = post("DescribeMaintenanceWindowsForTarget", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowsForTargetResult).new(response)
    end

    # Lists the targets registered with the maintenance window.
    def describe_maintenance_window_targets(input : AS::DescribeMaintenanceWindowTargetsRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowTargetsResult)
      Log.info { "performing 'DescribeMaintenanceWindowTargets' operation" }
      response = post("DescribeMaintenanceWindowTargets", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowTargetsResult).new(response)
    end

    # Lists the tasks in a maintenance window.
    #
    # For maintenance window tasks without a specified target, you can't supply values for
    # `--max-errors` and `--max-concurrency`. Instead, the system inserts a placeholder value of `1`,
    # which may be reported in the response to this command. These values don't affect the running of
    # your task and can be ignored.
    def describe_maintenance_window_tasks(input : AS::DescribeMaintenanceWindowTasksRequest) : Core::ParsedResponse(AS::DescribeMaintenanceWindowTasksResult)
      Log.info { "performing 'DescribeMaintenanceWindowTasks' operation" }
      response = post("DescribeMaintenanceWindowTasks", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeMaintenanceWindowTasksResult).new(response)
    end

    # Query a set of OpsItems. You must have permission in Identity and Access Management (IAM) to
    # query a list of OpsItems. For more information, see [Set up
    # OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html) in
    # the *Amazon Web Services Systems Manager User Guide*.
    #
    # Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to
    # view, investigate, and remediate operational issues impacting the performance and health of
    # their Amazon Web Services resources. For more information, see [Amazon Web Services Systems
    # Manager OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    def describe_ops_items(input : AS::DescribeOpsItemsRequest) : Core::ParsedResponse(AS::DescribeOpsItemsResponse)
      Log.info { "performing 'DescribeOpsItems' operation" }
      response = post("DescribeOpsItems", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeOpsItemsResponse).new(response)
    end

    # Lists the parameters in your Amazon Web Services account or the parameters shared with you when
    # you enable the
    # [Shared](https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html#systemsmanager-DescribeParameters-request-Shared)
    # option.
    #
    # Request results are returned on a best-effort basis. If you specify `MaxResults` in the request,
    # the response includes information up to the limit specified. The number of items returned,
    # however, can be between zero and the value of `MaxResults`. If the service reaches an internal
    # limit while processing the results, it stops the operation and returns the matching values up to
    # that point and a `NextToken`. You can specify the `NextToken` in a subsequent call to get the
    # next set of results.
    #
    # Parameter names can't contain spaces. The service removes any spaces specified for the beginning
    # or end of a parameter name. If the specified name for a parameter contains spaces between
    # characters, the request fails with a `ValidationException` error.
    #
    # If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also
    # update the key alias the parameter uses to reference KMS. Otherwise, `DescribeParameters`
    # retrieves whatever the original key alias was referencing.
    def describe_parameters(input : AS::DescribeParametersRequest) : Core::ParsedResponse(AS::DescribeParametersResult)
      Log.info { "performing 'DescribeParameters' operation" }
      response = post("DescribeParameters", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeParametersResult).new(response)
    end

    # Lists the patch baselines in your Amazon Web Services account.
    def describe_patch_baselines(input : AS::DescribePatchBaselinesRequest) : Core::ParsedResponse(AS::DescribePatchBaselinesResult)
      Log.info { "performing 'DescribePatchBaselines' operation" }
      response = post("DescribePatchBaselines", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchBaselinesResult).new(response)
    end

    # Lists all patch groups that have been registered with patch baselines.
    def describe_patch_groups(input : AS::DescribePatchGroupsRequest) : Core::ParsedResponse(AS::DescribePatchGroupsResult)
      Log.info { "performing 'DescribePatchGroups' operation" }
      response = post("DescribePatchGroups", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchGroupsResult).new(response)
    end

    # Returns high-level aggregated patch compliance state information for a patch group.
    def describe_patch_group_state(input : AS::DescribePatchGroupStateRequest) : Core::ParsedResponse(AS::DescribePatchGroupStateResult)
      Log.info { "performing 'DescribePatchGroupState' operation" }
      response = post("DescribePatchGroupState", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchGroupStateResult).new(response)
    end

    # Lists the properties of available patches organized by product, product family, classification,
    # severity, and other properties of available patches. You can use the reported properties in the
    # filters you specify in requests for operations such as CreatePatchBaseline, UpdatePatchBaseline,
    # DescribeAvailablePatches, and DescribePatchBaselines.
    #
    # The following section lists the properties that can be used in filters for each major operating
    # system type:
    #
    # AMAZON_LINUX Valid properties: `PRODUCT` | `CLASSIFICATION` | `SEVERITY`
    #
    # AMAZON_LINUX_2 Valid properties: `PRODUCT` | `CLASSIFICATION` | `SEVERITY`
    #
    # AMAZON_LINUX_2023 Valid properties: `PRODUCT` | `CLASSIFICATION` | `SEVERITY`
    #
    # CENTOS Valid properties: `PRODUCT` | `CLASSIFICATION` | `SEVERITY`
    #
    # DEBIAN Valid properties: `PRODUCT` | `PRIORITY`
    #
    # MACOS Valid properties: `PRODUCT` | `CLASSIFICATION`
    #
    # ORACLE_LINUX Valid properties: `PRODUCT` | `CLASSIFICATION` | `SEVERITY`
    #
    # REDHAT_ENTERPRISE_LINUX Valid properties: `PRODUCT` | `CLASSIFICATION` | `SEVERITY`
    #
    # SUSE Valid properties: `PRODUCT` | `CLASSIFICATION` | `SEVERITY`
    #
    # UBUNTU Valid properties: `PRODUCT` | `PRIORITY`
    #
    # WINDOWS Valid properties: `PRODUCT` | `PRODUCT_FAMILY` | `CLASSIFICATION` | `MSRC_SEVERITY`
    def describe_patch_properties(input : AS::DescribePatchPropertiesRequest) : Core::ParsedResponse(AS::DescribePatchPropertiesResult)
      Log.info { "performing 'DescribePatchProperties' operation" }
      response = post("DescribePatchProperties", "/", input.to_json)
      Core::ParsedResponse(AS::DescribePatchPropertiesResult).new(response)
    end

    # Retrieves a list of all active sessions (both connected and disconnected) or terminated sessions
    # from the past 30 days.
    def describe_sessions(input : AS::DescribeSessionsRequest) : Core::ParsedResponse(AS::DescribeSessionsResponse)
      Log.info { "performing 'DescribeSessions' operation" }
      response = post("DescribeSessions", "/", input.to_json)
      Core::ParsedResponse(AS::DescribeSessionsResponse).new(response)
    end

    # Deletes the association between an OpsItem and a related item. For example, this API operation
    # can delete an Incident Manager incident from an OpsItem. Incident Manager is a tool in Amazon
    # Web Services Systems Manager.
    def disassociate_ops_item_related_item(input : AS::DisassociateOpsItemRelatedItemRequest) : Core::ParsedResponse(AS::DisassociateOpsItemRelatedItemResponse)
      Log.info { "performing 'DisassociateOpsItemRelatedItem' operation" }
      response = post("DisassociateOpsItemRelatedItem", "/", input.to_json)
      Core::ParsedResponse(AS::DisassociateOpsItemRelatedItemResponse).new(response)
    end

    # Returns a credentials set to be used with just-in-time node access.
    def get_access_token(input : AS::GetAccessTokenRequest) : Core::ParsedResponse(AS::GetAccessTokenResponse)
      Log.info { "performing 'GetAccessToken' operation" }
      response = post("GetAccessToken", "/", input.to_json)
      Core::ParsedResponse(AS::GetAccessTokenResponse).new(response)
    end

    # Get detailed information about a particular Automation execution.
    def get_automation_execution(input : AS::GetAutomationExecutionRequest) : Core::ParsedResponse(AS::GetAutomationExecutionResult)
      Log.info { "performing 'GetAutomationExecution' operation" }
      response = post("GetAutomationExecution", "/", input.to_json)
      Core::ParsedResponse(AS::GetAutomationExecutionResult).new(response)
    end

    # Gets the state of a Amazon Web Services Systems Manager change calendar at the current time or a
    # specified time. If you specify a time, `GetCalendarState` returns the state of the calendar at
    # that specific time, and returns the next time that the change calendar state will transition. If
    # you don't specify a time, `GetCalendarState` uses the current time. Change Calendar entries have
    # two possible states: `OPEN` or `CLOSED`.
    #
    # If you specify more than one calendar in a request, the command returns the status of `OPEN`
    # only if all calendars in the request are open. If one or more calendars in the request are
    # closed, the status returned is `CLOSED`.
    #
    # For more information about Change Calendar, a tool in Amazon Web Services Systems Manager, see
    # [Amazon Web Services Systems Manager Change
    # Calendar](https://docs.aws.amazon.com/systems-manager/latest/userguide/systems-manager-change-calendar.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    def get_calendar_state(input : AS::GetCalendarStateRequest) : Core::ParsedResponse(AS::GetCalendarStateResponse)
      Log.info { "performing 'GetCalendarState' operation" }
      response = post("GetCalendarState", "/", input.to_json)
      Core::ParsedResponse(AS::GetCalendarStateResponse).new(response)
    end

    # Returns detailed information about a cloud connector.
    def get_cloud_connector(input : AS::GetCloudConnectorRequest) : Core::ParsedResponse(AS::GetCloudConnectorResult)
      Log.info { "performing 'GetCloudConnector' operation" }
      response = post("GetCloudConnector", "/", input.to_json)
      Core::ParsedResponse(AS::GetCloudConnectorResult).new(response)
    end

    # Returns detailed information about command execution for an invocation or plugin. The Run
    # Command API follows an eventual consistency model, due to the distributed nature of the system
    # supporting the API. This means that the result of an API command you run that affects your
    # resources might not be immediately visible to all subsequent commands you run. You should keep
    # this in mind when you carry out an API command that immediately follows a previous API command.
    #
    # `GetCommandInvocation` only gives the execution status of a plugin in a document. To get the
    # command execution status on a specific managed node, use ListCommandInvocations. To get the
    # command execution status across managed nodes, use ListCommands.
    def get_command_invocation(input : AS::GetCommandInvocationRequest) : Core::ParsedResponse(AS::GetCommandInvocationResult)
      Log.info { "performing 'GetCommandInvocation' operation" }
      response = post("GetCommandInvocation", "/", input.to_json)
      Core::ParsedResponse(AS::GetCommandInvocationResult).new(response)
    end

    # Retrieves the Session Manager connection status for a managed node to determine whether it is
    # running and ready to receive Session Manager connections.
    def get_connection_status(input : AS::GetConnectionStatusRequest) : Core::ParsedResponse(AS::GetConnectionStatusResponse)
      Log.info { "performing 'GetConnectionStatus' operation" }
      response = post("GetConnectionStatus", "/", input.to_json)
      Core::ParsedResponse(AS::GetConnectionStatusResponse).new(response)
    end

    # Retrieves the default patch baseline. Amazon Web Services Systems Manager supports creating
    # multiple default patch baselines. For example, you can create a default patch baseline for each
    # operating system.
    #
    # If you don't specify an operating system value, the default patch baseline for Windows is
    # returned.
    def get_default_patch_baseline(input : AS::GetDefaultPatchBaselineRequest) : Core::ParsedResponse(AS::GetDefaultPatchBaselineResult)
      Log.info { "performing 'GetDefaultPatchBaseline' operation" }
      response = post("GetDefaultPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::GetDefaultPatchBaselineResult).new(response)
    end

    # Retrieves the current snapshot for the patch baseline the managed node uses. This API is
    # primarily used by the `AWS-RunPatchBaseline` Systems Manager document (SSM document).
    #
    # If you run the command locally, such as with the Command Line Interface (CLI), the system
    # attempts to use your local Amazon Web Services credentials and the operation fails. To avoid
    # this, you can run the command in the Amazon Web Services Systems Manager console. Use Run
    # Command, a tool in Amazon Web Services Systems Manager, with an SSM document that enables you to
    # target a managed node with a script or command. For example, run the command using the
    # `AWS-RunShellScript` document or the `AWS-RunPowerShellScript` document.
    def get_deployable_patch_snapshot_for_instance(input : AS::GetDeployablePatchSnapshotForInstanceRequest) : Core::ParsedResponse(AS::GetDeployablePatchSnapshotForInstanceResult)
      Log.info { "performing 'GetDeployablePatchSnapshotForInstance' operation" }
      response = post("GetDeployablePatchSnapshotForInstance", "/", input.to_json)
      Core::ParsedResponse(AS::GetDeployablePatchSnapshotForInstanceResult).new(response)
    end

    # Gets the contents of the specified Amazon Web Services Systems Manager document (SSM document).
    def get_document(input : AS::GetDocumentRequest) : Core::ParsedResponse(AS::GetDocumentResult)
      Log.info { "performing 'GetDocument' operation" }
      response = post("GetDocument", "/", input.to_json)
      Core::ParsedResponse(AS::GetDocumentResult).new(response)
    end

    # Initiates the process of retrieving an existing preview that shows the effects that running a
    # specified Automation runbook would have on the targeted resources.
    def get_execution_preview(input : AS::GetExecutionPreviewRequest) : Core::ParsedResponse(AS::GetExecutionPreviewResponse)
      Log.info { "performing 'GetExecutionPreview' operation" }
      response = post("GetExecutionPreview", "/", input.to_json)
      Core::ParsedResponse(AS::GetExecutionPreviewResponse).new(response)
    end

    # Query inventory information. This includes managed node status, such as `Stopped` or
    # `Terminated`.
    def get_inventory(input : AS::GetInventoryRequest) : Core::ParsedResponse(AS::GetInventoryResult)
      Log.info { "performing 'GetInventory' operation" }
      response = post("GetInventory", "/", input.to_json)
      Core::ParsedResponse(AS::GetInventoryResult).new(response)
    end

    # Return a list of inventory type names for the account, or return a list of attribute names for a
    # specific Inventory item type.
    def get_inventory_schema(input : AS::GetInventorySchemaRequest) : Core::ParsedResponse(AS::GetInventorySchemaResult)
      Log.info { "performing 'GetInventorySchema' operation" }
      response = post("GetInventorySchema", "/", input.to_json)
      Core::ParsedResponse(AS::GetInventorySchemaResult).new(response)
    end

    # Retrieves a maintenance window.
    def get_maintenance_window(input : AS::GetMaintenanceWindowRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowResult)
      Log.info { "performing 'GetMaintenanceWindow' operation" }
      response = post("GetMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowResult).new(response)
    end

    # Retrieves details about a specific a maintenance window execution.
    def get_maintenance_window_execution(input : AS::GetMaintenanceWindowExecutionRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowExecutionResult)
      Log.info { "performing 'GetMaintenanceWindowExecution' operation" }
      response = post("GetMaintenanceWindowExecution", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowExecutionResult).new(response)
    end

    # Retrieves the details about a specific task run as part of a maintenance window execution.
    def get_maintenance_window_execution_task(input : AS::GetMaintenanceWindowExecutionTaskRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskResult)
      Log.info { "performing 'GetMaintenanceWindowExecutionTask' operation" }
      response = post("GetMaintenanceWindowExecutionTask", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskResult).new(response)
    end

    # Retrieves information about a specific task running on a specific target.
    def get_maintenance_window_execution_task_invocation(input : AS::GetMaintenanceWindowExecutionTaskInvocationRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskInvocationResult)
      Log.info { "performing 'GetMaintenanceWindowExecutionTaskInvocation' operation" }
      response = post("GetMaintenanceWindowExecutionTaskInvocation", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowExecutionTaskInvocationResult).new(response)
    end

    # Retrieves the details of a maintenance window task.
    #
    # For maintenance window tasks without a specified target, you can't supply values for
    # `--max-errors` and `--max-concurrency`. Instead, the system inserts a placeholder value of `1`,
    # which may be reported in the response to this command. These values don't affect the running of
    # your task and can be ignored.
    #
    # To retrieve a list of tasks in a maintenance window, instead use the
    # DescribeMaintenanceWindowTasks command.
    def get_maintenance_window_task(input : AS::GetMaintenanceWindowTaskRequest) : Core::ParsedResponse(AS::GetMaintenanceWindowTaskResult)
      Log.info { "performing 'GetMaintenanceWindowTask' operation" }
      response = post("GetMaintenanceWindowTask", "/", input.to_json)
      Core::ParsedResponse(AS::GetMaintenanceWindowTaskResult).new(response)
    end

    # Get information about an OpsItem by using the ID. You must have permission in Identity and
    # Access Management (IAM) to view information about an OpsItem. For more information, see [Set up
    # OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html) in
    # the *Amazon Web Services Systems Manager User Guide*.
    #
    # Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to
    # view, investigate, and remediate operational issues impacting the performance and health of
    # their Amazon Web Services resources. For more information, see [Amazon Web Services Systems
    # Manager OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    def get_ops_item(input : AS::GetOpsItemRequest) : Core::ParsedResponse(AS::GetOpsItemResponse)
      Log.info { "performing 'GetOpsItem' operation" }
      response = post("GetOpsItem", "/", input.to_json)
      Core::ParsedResponse(AS::GetOpsItemResponse).new(response)
    end

    # View operational metadata related to an application in Application Manager.
    def get_ops_metadata(input : AS::GetOpsMetadataRequest) : Core::ParsedResponse(AS::GetOpsMetadataResult)
      Log.info { "performing 'GetOpsMetadata' operation" }
      response = post("GetOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::GetOpsMetadataResult).new(response)
    end

    # View a summary of operations metadata (OpsData) based on specified filters and aggregators.
    # OpsData can include information about Amazon Web Services Systems Manager OpsCenter operational
    # workitems (OpsItems) as well as information about any Amazon Web Services resource or service
    # configured to report OpsData to Amazon Web Services Systems Manager Explorer.
    def get_ops_summary(input : AS::GetOpsSummaryRequest) : Core::ParsedResponse(AS::GetOpsSummaryResult)
      Log.info { "performing 'GetOpsSummary' operation" }
      response = post("GetOpsSummary", "/", input.to_json)
      Core::ParsedResponse(AS::GetOpsSummaryResult).new(response)
    end

    # Get information about a single parameter by specifying the parameter name.
    #
    # Parameter names can't contain spaces. The service removes any spaces specified for the beginning
    # or end of a parameter name. If the specified name for a parameter contains spaces between
    # characters, the request fails with a `ValidationException` error.
    #
    # To get information about more than one parameter at a time, use the GetParameters operation.
    #
    # Parameter Store throughput defines the number of API transactions per second (TPS) that Systems
    # Manager can process. This applies to `GetParameter`, `GetParameters`, and `PutParameter` API
    # calls for your Amazon Web Services account and Amazon Web Services Region. By default, Parameter
    # Store is configured with a standard throughput quota suitable for low- to moderate-volume
    # workloads. Applications that retrieve configuration data infrequently or operate at smaller
    # scale can use this default setting without additional cost.
    #
    # For higher-volume workloads, you can enable higher throughput. This increases the maximum number
    # of supported transactions per second for your account and Region. Increased throughput supports
    # applications and workloads that need concurrent access to multiple parameters. If you experience
    # `ThrottlingException: Rate exceeded` errors, enable higher throughput. For more information, see
    # [Changing Parameter Store
    # throughput](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-throughput.html).
    def get_parameter(input : AS::GetParameterRequest) : Core::ParsedResponse(AS::GetParameterResult)
      Log.info { "performing 'GetParameter' operation" }
      response = post("GetParameter", "/", input.to_json)
      Core::ParsedResponse(AS::GetParameterResult).new(response)
    end

    # Retrieves the history of all changes to a parameter.
    #
    # Parameter names can't contain spaces. The service removes any spaces specified for the beginning
    # or end of a parameter name. If the specified name for a parameter contains spaces between
    # characters, the request fails with a `ValidationException` error.
    #
    # If you change the KMS key alias for the KMS key used to encrypt a parameter, then you must also
    # update the key alias the parameter uses to reference KMS. Otherwise, `GetParameterHistory`
    # retrieves whatever the original key alias was referencing.
    def get_parameter_history(input : AS::GetParameterHistoryRequest) : Core::ParsedResponse(AS::GetParameterHistoryResult)
      Log.info { "performing 'GetParameterHistory' operation" }
      response = post("GetParameterHistory", "/", input.to_json)
      Core::ParsedResponse(AS::GetParameterHistoryResult).new(response)
    end

    # Get information about one or more parameters by specifying multiple parameter names.
    #
    # To get information about a single parameter, you can use the GetParameter operation instead.
    #
    # Parameter names can't contain spaces. The service removes any spaces specified for the beginning
    # or end of a parameter name. If the specified name for a parameter contains spaces between
    # characters, the request fails with a `ValidationException` error.
    #
    # Parameter Store throughput defines the number of API transactions per second (TPS) that Systems
    # Manager can process. This applies to `GetParameter`, `GetParameters`, and `PutParameter` API
    # calls for your Amazon Web Services account and Amazon Web Services Region. By default, Parameter
    # Store is configured with a standard throughput quota suitable for low- to moderate-volume
    # workloads. Applications that retrieve configuration data infrequently or operate at smaller
    # scale can use this default setting without additional cost.
    #
    # For higher-volume workloads, you can enable higher throughput. This increases the maximum number
    # of supported transactions per second for your account and Region. Increased throughput supports
    # applications and workloads that need concurrent access to multiple parameters. If you experience
    # `ThrottlingException: Rate exceeded` errors, enable higher throughput. For more information, see
    # [Changing Parameter Store
    # throughput](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-throughput.html).
    def get_parameters(input : AS::GetParametersRequest) : Core::ParsedResponse(AS::GetParametersResult)
      Log.info { "performing 'GetParameters' operation" }
      response = post("GetParameters", "/", input.to_json)
      Core::ParsedResponse(AS::GetParametersResult).new(response)
    end

    # Retrieve information about one or more parameters under a specified level in a hierarchy.
    #
    # Request results are returned on a best-effort basis. If you specify `MaxResults` in the request,
    # the response includes information up to the limit specified. The number of items returned,
    # however, can be between zero and the value of `MaxResults`. If the service reaches an internal
    # limit while processing the results, it stops the operation and returns the matching values up to
    # that point and a `NextToken`. You can specify the `NextToken` in a subsequent call to get the
    # next set of results.
    #
    # Parameter names can't contain spaces. The service removes any spaces specified for the beginning
    # or end of a parameter name. If the specified name for a parameter contains spaces between
    # characters, the request fails with a `ValidationException` error.
    def get_parameters_by_path(input : AS::GetParametersByPathRequest) : Core::ParsedResponse(AS::GetParametersByPathResult)
      Log.info { "performing 'GetParametersByPath' operation" }
      response = post("GetParametersByPath", "/", input.to_json)
      Core::ParsedResponse(AS::GetParametersByPathResult).new(response)
    end

    # Retrieves information about a patch baseline.
    def get_patch_baseline(input : AS::GetPatchBaselineRequest) : Core::ParsedResponse(AS::GetPatchBaselineResult)
      Log.info { "performing 'GetPatchBaseline' operation" }
      response = post("GetPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::GetPatchBaselineResult).new(response)
    end

    # Retrieves the patch baseline that should be used for the specified patch group.
    def get_patch_baseline_for_patch_group(input : AS::GetPatchBaselineForPatchGroupRequest) : Core::ParsedResponse(AS::GetPatchBaselineForPatchGroupResult)
      Log.info { "performing 'GetPatchBaselineForPatchGroup' operation" }
      response = post("GetPatchBaselineForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::GetPatchBaselineForPatchGroupResult).new(response)
    end

    # Returns an array of the `Policy` object.
    def get_resource_policies(input : AS::GetResourcePoliciesRequest) : Core::ParsedResponse(AS::GetResourcePoliciesResponse)
      Log.info { "performing 'GetResourcePolicies' operation" }
      response = post("GetResourcePolicies", "/", input.to_json)
      Core::ParsedResponse(AS::GetResourcePoliciesResponse).new(response)
    end

    # `ServiceSetting` is an account-level setting for an Amazon Web Services service. This setting
    # defines how a user interacts with or uses a service or a feature of a service. For example, if
    # an Amazon Web Services service charges money to the account based on feature or service usage,
    # then the Amazon Web Services service team might create a default setting of `false`. This means
    # the user can't use this feature unless they change the setting to `true` and intentionally opt
    # in for a paid feature.
    #
    # Services map a `SettingId` object to a setting value. Amazon Web Services services teams define
    # the default value for a `SettingId`. You can't create a new `SettingId`, but you can overwrite
    # the default value if you have the `ssm:UpdateServiceSetting` permission for the setting. Use the
    # UpdateServiceSetting API operation to change the default setting. Or use the ResetServiceSetting
    # to change the value back to the original value defined by the Amazon Web Services service team.
    #
    # Query the current service setting for the Amazon Web Services account.
    def get_service_setting(input : AS::GetServiceSettingRequest) : Core::ParsedResponse(AS::GetServiceSettingResult)
      Log.info { "performing 'GetServiceSetting' operation" }
      response = post("GetServiceSetting", "/", input.to_json)
      Core::ParsedResponse(AS::GetServiceSettingResult).new(response)
    end

    # A parameter label is a user-defined alias to help you manage different versions of a parameter.
    # When you modify a parameter, Amazon Web Services Systems Manager automatically saves a new
    # version and increments the version number by one. A label can help you remember the purpose of a
    # parameter when there are multiple versions.
    #
    # Parameter labels have the following requirements and restrictions.
    #
    # - A version of a parameter can have a maximum of 10 labels.
    #
    # - You can't attach the same label to different versions of the same parameter. For example, if
    # version 1 has the label Production, then you can't attach Production to version 2.
    #
    # - You can move a label from one version of a parameter to another.
    #
    # - You can't create a label when you create a new parameter. You must attach a label to a
    # specific version of a parameter.
    #
    # - If you no longer want to use a parameter label, then you can either delete it or move it to a
    # different version of a parameter.
    #
    # - A label can have a maximum of 100 characters.
    #
    # - Labels can contain letters (case sensitive), numbers, periods (.), hyphens (-), or underscores
    # (_).
    #
    # - Labels can't begin with a number, "`aws`" or "`ssm`" (not case sensitive). If a label fails to
    # meet these requirements, then the label isn't associated with a parameter and the system
    # displays it in the list of InvalidLabels.
    #
    # - Parameter names can't contain spaces. The service removes any spaces specified for the
    # beginning or end of a parameter name. If the specified name for a parameter contains spaces
    # between characters, the request fails with a `ValidationException` error.
    def label_parameter_version(input : AS::LabelParameterVersionRequest) : Core::ParsedResponse(AS::LabelParameterVersionResult)
      Log.info { "performing 'LabelParameterVersion' operation" }
      response = post("LabelParameterVersion", "/", input.to_json)
      Core::ParsedResponse(AS::LabelParameterVersionResult).new(response)
    end

    # Returns all State Manager associations in the current Amazon Web Services account and Amazon Web
    # Services Region. You can limit the results to a specific State Manager association document or
    # managed node by specifying a filter. State Manager is a tool in Amazon Web Services Systems
    # Manager.
    def list_associations(input : AS::ListAssociationsRequest) : Core::ParsedResponse(AS::ListAssociationsResult)
      Log.info { "performing 'ListAssociations' operation" }
      response = post("ListAssociations", "/", input.to_json)
      Core::ParsedResponse(AS::ListAssociationsResult).new(response)
    end

    # Retrieves all versions of an association for a specific association ID.
    def list_association_versions(input : AS::ListAssociationVersionsRequest) : Core::ParsedResponse(AS::ListAssociationVersionsResult)
      Log.info { "performing 'ListAssociationVersions' operation" }
      response = post("ListAssociationVersions", "/", input.to_json)
      Core::ParsedResponse(AS::ListAssociationVersionsResult).new(response)
    end

    # Returns a list of cloud connectors in the current Amazon Web Services account and Amazon Web
    # Services Region.
    def list_cloud_connectors(input : AS::ListCloudConnectorsRequest) : Core::ParsedResponse(AS::ListCloudConnectorsResult)
      Log.info { "performing 'ListCloudConnectors' operation" }
      response = post("ListCloudConnectors", "/", input.to_json)
      Core::ParsedResponse(AS::ListCloudConnectorsResult).new(response)
    end

    # An invocation is copy of a command sent to a specific managed node. A command can apply to one
    # or more managed nodes. A command invocation applies to one managed node. For example, if a user
    # runs `SendCommand` against three managed nodes, then a command invocation is created for each
    # requested managed node ID. `ListCommandInvocations` provide status about command execution.
    def list_command_invocations(input : AS::ListCommandInvocationsRequest) : Core::ParsedResponse(AS::ListCommandInvocationsResult)
      Log.info { "performing 'ListCommandInvocations' operation" }
      response = post("ListCommandInvocations", "/", input.to_json)
      Core::ParsedResponse(AS::ListCommandInvocationsResult).new(response)
    end

    # Lists the commands requested by users of the Amazon Web Services account.
    def list_commands(input : AS::ListCommandsRequest) : Core::ParsedResponse(AS::ListCommandsResult)
      Log.info { "performing 'ListCommands' operation" }
      response = post("ListCommands", "/", input.to_json)
      Core::ParsedResponse(AS::ListCommandsResult).new(response)
    end

    # For a specified resource ID, this API operation returns a list of compliance statuses for
    # different resource types. Currently, you can only specify one resource ID per call. List results
    # depend on the criteria specified in the filter.
    def list_compliance_items(input : AS::ListComplianceItemsRequest) : Core::ParsedResponse(AS::ListComplianceItemsResult)
      Log.info { "performing 'ListComplianceItems' operation" }
      response = post("ListComplianceItems", "/", input.to_json)
      Core::ParsedResponse(AS::ListComplianceItemsResult).new(response)
    end

    # Returns a summary count of compliant and non-compliant resources for a compliance type. For
    # example, this call can return State Manager associations, patches, or custom compliance types
    # according to the filter criteria that you specify.
    def list_compliance_summaries(input : AS::ListComplianceSummariesRequest) : Core::ParsedResponse(AS::ListComplianceSummariesResult)
      Log.info { "performing 'ListComplianceSummaries' operation" }
      response = post("ListComplianceSummaries", "/", input.to_json)
      Core::ParsedResponse(AS::ListComplianceSummariesResult).new(response)
    end

    # Amazon Web Services Systems Manager Change Manager is no longer open to new customers. Existing
    # customers can continue to use the service as normal. For more information, see [Amazon Web
    # Services Systems Manager Change Manager availability
    # change](https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager-availability-change.html).
    #
    # Information about approval reviews for a version of a change template in Change Manager.
    def list_document_metadata_history(input : AS::ListDocumentMetadataHistoryRequest) : Core::ParsedResponse(AS::ListDocumentMetadataHistoryResponse)
      Log.info { "performing 'ListDocumentMetadataHistory' operation" }
      response = post("ListDocumentMetadataHistory", "/", input.to_json)
      Core::ParsedResponse(AS::ListDocumentMetadataHistoryResponse).new(response)
    end

    # Returns all Systems Manager (SSM) documents in the current Amazon Web Services account and
    # Amazon Web Services Region. You can limit the results of this request by using a filter.
    def list_documents(input : AS::ListDocumentsRequest) : Core::ParsedResponse(AS::ListDocumentsResult)
      Log.info { "performing 'ListDocuments' operation" }
      response = post("ListDocuments", "/", input.to_json)
      Core::ParsedResponse(AS::ListDocumentsResult).new(response)
    end

    # List all versions for a document.
    def list_document_versions(input : AS::ListDocumentVersionsRequest) : Core::ParsedResponse(AS::ListDocumentVersionsResult)
      Log.info { "performing 'ListDocumentVersions' operation" }
      response = post("ListDocumentVersions", "/", input.to_json)
      Core::ParsedResponse(AS::ListDocumentVersionsResult).new(response)
    end

    # A list of inventory items returned by the request.
    def list_inventory_entries(input : AS::ListInventoryEntriesRequest) : Core::ParsedResponse(AS::ListInventoryEntriesResult)
      Log.info { "performing 'ListInventoryEntries' operation" }
      response = post("ListInventoryEntries", "/", input.to_json)
      Core::ParsedResponse(AS::ListInventoryEntriesResult).new(response)
    end

    # Takes in filters and returns a list of managed nodes matching the filter criteria.
    def list_nodes(input : AS::ListNodesRequest) : Core::ParsedResponse(AS::ListNodesResult)
      Log.info { "performing 'ListNodes' operation" }
      response = post("ListNodes", "/", input.to_json)
      Core::ParsedResponse(AS::ListNodesResult).new(response)
    end

    # Generates a summary of managed instance/node metadata based on the filters and aggregators you
    # specify. Results are grouped by the input aggregator you specify.
    def list_nodes_summary(input : AS::ListNodesSummaryRequest) : Core::ParsedResponse(AS::ListNodesSummaryResult)
      Log.info { "performing 'ListNodesSummary' operation" }
      response = post("ListNodesSummary", "/", input.to_json)
      Core::ParsedResponse(AS::ListNodesSummaryResult).new(response)
    end

    # Returns a list of all OpsItem events in the current Amazon Web Services Region and Amazon Web
    # Services account. You can limit the results to events associated with specific OpsItems by
    # specifying a filter.
    def list_ops_item_events(input : AS::ListOpsItemEventsRequest) : Core::ParsedResponse(AS::ListOpsItemEventsResponse)
      Log.info { "performing 'ListOpsItemEvents' operation" }
      response = post("ListOpsItemEvents", "/", input.to_json)
      Core::ParsedResponse(AS::ListOpsItemEventsResponse).new(response)
    end

    # Lists all related-item resources associated with a Systems Manager OpsCenter OpsItem. OpsCenter
    # is a tool in Amazon Web Services Systems Manager.
    def list_ops_item_related_items(input : AS::ListOpsItemRelatedItemsRequest) : Core::ParsedResponse(AS::ListOpsItemRelatedItemsResponse)
      Log.info { "performing 'ListOpsItemRelatedItems' operation" }
      response = post("ListOpsItemRelatedItems", "/", input.to_json)
      Core::ParsedResponse(AS::ListOpsItemRelatedItemsResponse).new(response)
    end

    # Amazon Web Services Systems Manager calls this API operation when displaying all Application
    # Manager OpsMetadata objects or blobs.
    def list_ops_metadata(input : AS::ListOpsMetadataRequest) : Core::ParsedResponse(AS::ListOpsMetadataResult)
      Log.info { "performing 'ListOpsMetadata' operation" }
      response = post("ListOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::ListOpsMetadataResult).new(response)
    end

    # Returns a resource-level summary count. The summary includes information about compliant and
    # non-compliant statuses and detailed compliance-item severity counts, according to the filter
    # criteria you specify.
    def list_resource_compliance_summaries(input : AS::ListResourceComplianceSummariesRequest) : Core::ParsedResponse(AS::ListResourceComplianceSummariesResult)
      Log.info { "performing 'ListResourceComplianceSummaries' operation" }
      response = post("ListResourceComplianceSummaries", "/", input.to_json)
      Core::ParsedResponse(AS::ListResourceComplianceSummariesResult).new(response)
    end

    # Lists your resource data sync configurations. Includes information about the last time a sync
    # attempted to start, the last sync status, and the last time a sync successfully completed.
    #
    # The number of sync configurations might be too large to return using a single call to
    # `ListResourceDataSync`. You can limit the number of sync configurations returned by using the
    # `MaxResults` parameter. To determine whether there are more sync configurations to list, check
    # the value of `NextToken` in the output. If there are more sync configurations to list, you can
    # request them by specifying the `NextToken` returned in the call to the parameter of a subsequent
    # call.
    def list_resource_data_sync(input : AS::ListResourceDataSyncRequest) : Core::ParsedResponse(AS::ListResourceDataSyncResult)
      Log.info { "performing 'ListResourceDataSync' operation" }
      response = post("ListResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::ListResourceDataSyncResult).new(response)
    end

    # Returns a list of the tags assigned to the specified resource.
    #
    # For information about the ID format for each supported resource type, see AddTagsToResource.
    def list_tags_for_resource(input : AS::ListTagsForResourceRequest) : Core::ParsedResponse(AS::ListTagsForResourceResult)
      Log.info { "performing 'ListTagsForResource' operation" }
      response = post("ListTagsForResource", "/", input.to_json)
      Core::ParsedResponse(AS::ListTagsForResourceResult).new(response)
    end

    # Shares a Amazon Web Services Systems Manager document (SSM document)publicly or privately. If
    # you share a document privately, you must specify the Amazon Web Services user IDs for those
    # people who can use the document. If you share a document publicly, you must specify *All* as the
    # account ID.
    def modify_document_permission(input : AS::ModifyDocumentPermissionRequest) : Core::ParsedResponse(AS::ModifyDocumentPermissionResponse)
      Log.info { "performing 'ModifyDocumentPermission' operation" }
      response = post("ModifyDocumentPermission", "/", input.to_json)
      Core::ParsedResponse(AS::ModifyDocumentPermissionResponse).new(response)
    end

    # Registers a compliance type and other compliance details on a designated resource. This
    # operation lets you register custom compliance details with a resource. This call overwrites
    # existing compliance information on the resource, so you must provide a full list of compliance
    # items each time that you send the request.
    #
    # ComplianceType can be one of the following:
    #
    # - ExecutionId: The execution ID when the patch, association, or custom compliance item was
    # applied.
    #
    # - ExecutionType: Specify patch, association, or Custom:`string`.
    #
    # - ExecutionTime. The time the patch, association, or custom compliance item was applied to the
    # managed node.
    #
    # For State Manager associations, this represents the time when compliance status was captured by
    # the Systems Manager service during its internal compliance aggregation workflow, not necessarily
    # when the association was executed on the managed node. State Manager updates compliance
    # information for all associations on an instance whenever any association executes, which may
    # result in multiple associations showing the same execution time.
    #
    # - Id: The patch, association, or custom compliance ID.
    #
    # - Title: A title.
    #
    # - Status: The status of the compliance item. For example, `approved` for patches, or `Failed`
    # for associations.
    #
    # - Severity: A patch severity. For example, `Critical`.
    #
    # - DocumentName: An SSM document name. For example, `AWS-RunPatchBaseline`.
    #
    # - DocumentVersion: An SSM document version number. For example, 4.
    #
    # - Classification: A patch classification. For example, `security updates`.
    #
    # - PatchBaselineId: A patch baseline ID.
    #
    # - PatchSeverity: A patch severity. For example, `Critical`.
    #
    # - PatchState: A patch state. For example, `InstancesWithFailedPatches`.
    #
    # - PatchGroup: The name of a patch group.
    #
    # - InstalledTime: The time the association, patch, or custom compliance item was applied to the
    # resource. Specify the time by using the following format: `yyyy-MM-dd'T'HH:mm:ss'Z'`
    def put_compliance_items(input : AS::PutComplianceItemsRequest) : Core::ParsedResponse(AS::PutComplianceItemsResult)
      Log.info { "performing 'PutComplianceItems' operation" }
      response = post("PutComplianceItems", "/", input.to_json)
      Core::ParsedResponse(AS::PutComplianceItemsResult).new(response)
    end

    # Bulk update custom inventory items on one or more managed nodes. The request adds an inventory
    # item, if it doesn't already exist, or updates an inventory item, if it does exist.
    def put_inventory(input : AS::PutInventoryRequest) : Core::ParsedResponse(AS::PutInventoryResult)
      Log.info { "performing 'PutInventory' operation" }
      response = post("PutInventory", "/", input.to_json)
      Core::ParsedResponse(AS::PutInventoryResult).new(response)
    end

    # Create or update a parameter in Parameter Store.
    #
    # Parameter Store throughput defines the number of API transactions per second (TPS) that Systems
    # Manager can process. This applies to `GetParameter`, `GetParameters`, and `PutParameter` API
    # calls for your Amazon Web Services account and Amazon Web Services Region. By default, Parameter
    # Store is configured with a standard throughput quota suitable for low- to moderate-volume
    # workloads. Applications that retrieve configuration data infrequently or operate at smaller
    # scale can use this default setting without additional cost.
    #
    # For higher-volume workloads, you can enable higher throughput. This increases the maximum number
    # of supported transactions per second for your account and Region. Increased throughput supports
    # applications and workloads that need concurrent access to multiple parameters. If you experience
    # `ThrottlingException: Rate exceeded` errors, enable higher throughput. For more information, see
    # [Changing Parameter Store
    # throughput](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-throughput.html).
    def put_parameter(input : AS::PutParameterRequest) : Core::ParsedResponse(AS::PutParameterResult)
      Log.info { "performing 'PutParameter' operation" }
      response = post("PutParameter", "/", input.to_json)
      Core::ParsedResponse(AS::PutParameterResult).new(response)
    end

    # Creates or updates a Systems Manager resource policy. A resource policy helps you to define the
    # IAM entity (for example, an Amazon Web Services account) that can manage your Systems Manager
    # resources. The following resources support Systems Manager resource policies.
    #
    # - `OpsItemGroup` - The resource policy for `OpsItemGroup` enables Amazon Web Services accounts
    # to view and interact with OpsCenter operational work items (OpsItems).
    #
    # - `Parameter` - The resource policy is used to share a parameter with other accounts using
    # Resource Access Manager (RAM).
    #
    # To share a parameter, it must be in the advanced parameter tier. For information about parameter
    # tiers, see [Managing parameter
    # tiers](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html).
    # For information about changing an existing standard parameter to an advanced parameter, see
    # [Changing a standard parameter to an advanced
    # parameter](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-advanced-parameters.html#parameter-store-advanced-parameters-enabling).
    #
    # To share a `SecureString` parameter, it must be encrypted with a customer managed key, and you
    # must share the key separately through Key Management Service. Amazon Web Services managed keys
    # cannot be shared. Parameters encrypted with the default Amazon Web Services managed key can be
    # updated to use a customer managed key instead. For KMS key definitions, see [KMS
    # concepts](https://docs.aws.amazon.com/kms/latest/developerguide/concepts.html) in the *Key
    # Management Service Developer Guide*.
    #
    # While you can share a parameter using the Systems Manager `PutResourcePolicy` operation, we
    # recommend using Resource Access Manager (RAM) instead. This is because using `PutResourcePolicy`
    # requires the extra step of promoting the parameter to a standard RAM Resource Share using the
    # RAM
    # [PromoteResourceShareCreatedFromPolicy](https://docs.aws.amazon.com/ram/latest/APIReference/API_PromoteResourceShareCreatedFromPolicy.html)
    # API operation. Otherwise, the parameter won't be returned by the Systems Manager
    # [DescribeParameters](https://docs.aws.amazon.com/systems-manager/latest/APIReference/API_DescribeParameters.html)
    # API operation using the `--shared` option.
    #
    # For more information, see [Sharing a
    # parameter](https://docs.aws.amazon.com/systems-manager/latest/userguide/parameter-store-shared-parameters.html#share)
    # in the *Amazon Web Services Systems Manager User Guide*
    def put_resource_policy(input : AS::PutResourcePolicyRequest) : Core::ParsedResponse(AS::PutResourcePolicyResponse)
      Log.info { "performing 'PutResourcePolicy' operation" }
      response = post("PutResourcePolicy", "/", input.to_json)
      Core::ParsedResponse(AS::PutResourcePolicyResponse).new(response)
    end

    # Defines the default patch baseline for the relevant operating system.
    #
    # To reset the Amazon Web Services-predefined patch baseline as the default, specify the full
    # patch baseline Amazon Resource Name (ARN) as the baseline ID value. For example, for CentOS,
    # specify `arn:aws:ssm:us-east-2:733109147000:patchbaseline/pb-0574b43a65ea646ed` instead of
    # `pb-0574b43a65ea646ed`.
    def register_default_patch_baseline(input : AS::RegisterDefaultPatchBaselineRequest) : Core::ParsedResponse(AS::RegisterDefaultPatchBaselineResult)
      Log.info { "performing 'RegisterDefaultPatchBaseline' operation" }
      response = post("RegisterDefaultPatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterDefaultPatchBaselineResult).new(response)
    end

    # Registers a patch baseline for a patch group.
    def register_patch_baseline_for_patch_group(input : AS::RegisterPatchBaselineForPatchGroupRequest) : Core::ParsedResponse(AS::RegisterPatchBaselineForPatchGroupResult)
      Log.info { "performing 'RegisterPatchBaselineForPatchGroup' operation" }
      response = post("RegisterPatchBaselineForPatchGroup", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterPatchBaselineForPatchGroupResult).new(response)
    end

    # Registers a target with a maintenance window.
    def register_target_with_maintenance_window(input : AS::RegisterTargetWithMaintenanceWindowRequest) : Core::ParsedResponse(AS::RegisterTargetWithMaintenanceWindowResult)
      Log.info { "performing 'RegisterTargetWithMaintenanceWindow' operation" }
      response = post("RegisterTargetWithMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterTargetWithMaintenanceWindowResult).new(response)
    end

    # Adds a new task to a maintenance window.
    def register_task_with_maintenance_window(input : AS::RegisterTaskWithMaintenanceWindowRequest) : Core::ParsedResponse(AS::RegisterTaskWithMaintenanceWindowResult)
      Log.info { "performing 'RegisterTaskWithMaintenanceWindow' operation" }
      response = post("RegisterTaskWithMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::RegisterTaskWithMaintenanceWindowResult).new(response)
    end

    # Removes tag keys from the specified resource.
    def remove_tags_from_resource(input : AS::RemoveTagsFromResourceRequest) : Core::ParsedResponse(AS::RemoveTagsFromResourceResult)
      Log.info { "performing 'RemoveTagsFromResource' operation" }
      response = post("RemoveTagsFromResource", "/", input.to_json)
      Core::ParsedResponse(AS::RemoveTagsFromResourceResult).new(response)
    end

    # `ServiceSetting` is an account-level setting for an Amazon Web Services service. This setting
    # defines how a user interacts with or uses a service or a feature of a service. For example, if
    # an Amazon Web Services service charges money to the account based on feature or service usage,
    # then the Amazon Web Services service team might create a default setting of "false". This means
    # the user can't use this feature unless they change the setting to "true" and intentionally opt
    # in for a paid feature.
    #
    # Services map a `SettingId` object to a setting value. Amazon Web Services services teams define
    # the default value for a `SettingId`. You can't create a new `SettingId`, but you can overwrite
    # the default value if you have the `ssm:UpdateServiceSetting` permission for the setting. Use the
    # GetServiceSetting API operation to view the current value. Use the UpdateServiceSetting API
    # operation to change the default setting.
    #
    # Reset the service setting for the account to the default value as provisioned by the Amazon Web
    # Services service team.
    def reset_service_setting(input : AS::ResetServiceSettingRequest) : Core::ParsedResponse(AS::ResetServiceSettingResult)
      Log.info { "performing 'ResetServiceSetting' operation" }
      response = post("ResetServiceSetting", "/", input.to_json)
      Core::ParsedResponse(AS::ResetServiceSettingResult).new(response)
    end

    # Reconnects a session to a managed node after it has been disconnected. Connections can be
    # resumed for disconnected sessions, but not terminated sessions.
    #
    # This command is primarily for use by client machines to automatically reconnect during
    # intermittent network issues. It isn't intended for any other use.
    def resume_session(input : AS::ResumeSessionRequest) : Core::ParsedResponse(AS::ResumeSessionResponse)
      Log.info { "performing 'ResumeSession' operation" }
      response = post("ResumeSession", "/", input.to_json)
      Core::ParsedResponse(AS::ResumeSessionResponse).new(response)
    end

    # Sends a signal to an Automation execution to change the current behavior or status of the
    # execution.
    def send_automation_signal(input : AS::SendAutomationSignalRequest) : Core::ParsedResponse(AS::SendAutomationSignalResult)
      Log.info { "performing 'SendAutomationSignal' operation" }
      response = post("SendAutomationSignal", "/", input.to_json)
      Core::ParsedResponse(AS::SendAutomationSignalResult).new(response)
    end

    # Runs commands on one or more managed nodes.
    def send_command(input : AS::SendCommandRequest) : Core::ParsedResponse(AS::SendCommandResult)
      Log.info { "performing 'SendCommand' operation" }
      response = post("SendCommand", "/", input.to_json)
      Core::ParsedResponse(AS::SendCommandResult).new(response)
    end

    # Starts the workflow for just-in-time node access sessions.
    def start_access_request(input : AS::StartAccessRequestRequest) : Core::ParsedResponse(AS::StartAccessRequestResponse)
      Log.info { "performing 'StartAccessRequest' operation" }
      response = post("StartAccessRequest", "/", input.to_json)
      Core::ParsedResponse(AS::StartAccessRequestResponse).new(response)
    end

    # Runs an association immediately and only one time. This operation can be helpful when
    # troubleshooting associations.
    def start_associations_once(input : AS::StartAssociationsOnceRequest) : Core::ParsedResponse(AS::StartAssociationsOnceResult)
      Log.info { "performing 'StartAssociationsOnce' operation" }
      response = post("StartAssociationsOnce", "/", input.to_json)
      Core::ParsedResponse(AS::StartAssociationsOnceResult).new(response)
    end

    # Initiates execution of an Automation runbook.
    def start_automation_execution(input : AS::StartAutomationExecutionRequest) : Core::ParsedResponse(AS::StartAutomationExecutionResult)
      Log.info { "performing 'StartAutomationExecution' operation" }
      response = post("StartAutomationExecution", "/", input.to_json)
      Core::ParsedResponse(AS::StartAutomationExecutionResult).new(response)
    end

    # Amazon Web Services Systems Manager Change Manager is no longer open to new customers. Existing
    # customers can continue to use the service as normal. For more information, see [Amazon Web
    # Services Systems Manager Change Manager availability
    # change](https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager-availability-change.html).
    #
    # Creates a change request for Change Manager. The Automation runbooks specified in the change
    # request run only after all required approvals for the change request have been received.
    def start_change_request_execution(input : AS::StartChangeRequestExecutionRequest) : Core::ParsedResponse(AS::StartChangeRequestExecutionResult)
      Log.info { "performing 'StartChangeRequestExecution' operation" }
      response = post("StartChangeRequestExecution", "/", input.to_json)
      Core::ParsedResponse(AS::StartChangeRequestExecutionResult).new(response)
    end

    # Initiates the process of creating a preview showing the effects that running a specified
    # Automation runbook would have on the targeted resources.
    def start_execution_preview(input : AS::StartExecutionPreviewRequest) : Core::ParsedResponse(AS::StartExecutionPreviewResponse)
      Log.info { "performing 'StartExecutionPreview' operation" }
      response = post("StartExecutionPreview", "/", input.to_json)
      Core::ParsedResponse(AS::StartExecutionPreviewResponse).new(response)
    end

    # Initiates a connection to a target (for example, a managed node) for a Session Manager session.
    # Returns a URL and token that can be used to open a WebSocket connection for sending input and
    # receiving outputs.
    #
    # Amazon Web Services CLI usage: `start-session` is an interactive command that requires the
    # Session Manager plugin to be installed on the client machine making the call. For information,
    # see [Install the Session Manager plugin for the Amazon Web Services
    # CLI](https://docs.aws.amazon.com/systems-manager/latest/userguide/session-manager-working-with-install-plugin.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # Amazon Web Services Tools for PowerShell usage: Start-SSMSession isn't currently supported by
    # Amazon Web Services Tools for PowerShell on Windows local machines.
    def start_session(input : AS::StartSessionRequest) : Core::ParsedResponse(AS::StartSessionResponse)
      Log.info { "performing 'StartSession' operation" }
      response = post("StartSession", "/", input.to_json)
      Core::ParsedResponse(AS::StartSessionResponse).new(response)
    end

    # Stop an Automation that is currently running.
    def stop_automation_execution(input : AS::StopAutomationExecutionRequest) : Core::ParsedResponse(AS::StopAutomationExecutionResult)
      Log.info { "performing 'StopAutomationExecution' operation" }
      response = post("StopAutomationExecution", "/", input.to_json)
      Core::ParsedResponse(AS::StopAutomationExecutionResult).new(response)
    end

    # Permanently ends a session and closes the data connection between the Session Manager client and
    # SSM Agent on the managed node. A terminated session can't be resumed.
    def terminate_session(input : AS::TerminateSessionRequest) : Core::ParsedResponse(AS::TerminateSessionResponse)
      Log.info { "performing 'TerminateSession' operation" }
      response = post("TerminateSession", "/", input.to_json)
      Core::ParsedResponse(AS::TerminateSessionResponse).new(response)
    end

    # Remove a label or labels from a parameter.
    #
    # Parameter names can't contain spaces. The service removes any spaces specified for the beginning
    # or end of a parameter name. If the specified name for a parameter contains spaces between
    # characters, the request fails with a `ValidationException` error.
    def unlabel_parameter_version(input : AS::UnlabelParameterVersionRequest) : Core::ParsedResponse(AS::UnlabelParameterVersionResult)
      Log.info { "performing 'UnlabelParameterVersion' operation" }
      response = post("UnlabelParameterVersion", "/", input.to_json)
      Core::ParsedResponse(AS::UnlabelParameterVersionResult).new(response)
    end

    # Updates an association. You can update the association name and version, the document version,
    # schedule, parameters, and Amazon Simple Storage Service (Amazon S3) output. When you call
    # `UpdateAssociation`, the system removes all optional parameters from the request and overwrites
    # the association with null values for those parameters. This is by design. You must specify all
    # optional parameters in the call, even if you are not changing the parameters. This includes the
    # `Name` parameter. Before calling this API action, we recommend that you call the
    # DescribeAssociation API operation and make a note of all optional parameters required for your
    # `UpdateAssociation` call.
    #
    # In order to call this API operation, a user, group, or role must be granted permission to call
    # the DescribeAssociation API operation. If you don't have permission to call
    # `DescribeAssociation`, then you receive the following error: `An error occurred
    # (AccessDeniedException) when calling the UpdateAssociation operation: User: isn't authorized to
    # perform: ssm:DescribeAssociation on resource: `
    #
    # When you update an association, the association immediately runs against the specified targets.
    # You can add the `ApplyOnlyAtCronInterval` parameter to run the association during the next
    # schedule run.
    def update_association(input : AS::UpdateAssociationRequest) : Core::ParsedResponse(AS::UpdateAssociationResult)
      Log.info { "performing 'UpdateAssociation' operation" }
      response = post("UpdateAssociation", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateAssociationResult).new(response)
    end

    # Updates the status of the Amazon Web Services Systems Manager document (SSM document) associated
    # with the specified managed node.
    #
    # `UpdateAssociationStatus` is primarily used by the Amazon Web Services Systems Manager Agent
    # (SSM Agent) to report status updates about your associations and is only used for associations
    # created with the `InstanceId` legacy parameter.
    def update_association_status(input : AS::UpdateAssociationStatusRequest) : Core::ParsedResponse(AS::UpdateAssociationStatusResult)
      Log.info { "performing 'UpdateAssociationStatus' operation" }
      response = post("UpdateAssociationStatus", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateAssociationStatusResult).new(response)
    end

    # Updates an existing cloud connector with new configuration details.
    def update_cloud_connector(input : AS::UpdateCloudConnectorRequest) : Core::ParsedResponse(AS::UpdateCloudConnectorResult)
      Log.info { "performing 'UpdateCloudConnector' operation" }
      response = post("UpdateCloudConnector", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateCloudConnectorResult).new(response)
    end

    # Updates one or more values for an SSM document.
    def update_document(input : AS::UpdateDocumentRequest) : Core::ParsedResponse(AS::UpdateDocumentResult)
      Log.info { "performing 'UpdateDocument' operation" }
      response = post("UpdateDocument", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateDocumentResult).new(response)
    end

    # Set the default version of a document.
    #
    # If you change a document version for a State Manager association, Systems Manager immediately
    # runs the association unless you previously specifed the `apply-only-at-cron-interval` parameter.
    def update_document_default_version(input : AS::UpdateDocumentDefaultVersionRequest) : Core::ParsedResponse(AS::UpdateDocumentDefaultVersionResult)
      Log.info { "performing 'UpdateDocumentDefaultVersion' operation" }
      response = post("UpdateDocumentDefaultVersion", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateDocumentDefaultVersionResult).new(response)
    end

    # Amazon Web Services Systems Manager Change Manager is no longer open to new customers. Existing
    # customers can continue to use the service as normal. For more information, see [Amazon Web
    # Services Systems Manager Change Manager availability
    # change](https://docs.aws.amazon.com/systems-manager/latest/userguide/change-manager-availability-change.html).
    #
    # Updates information related to approval reviews for a specific version of a change template in
    # Change Manager.
    def update_document_metadata(input : AS::UpdateDocumentMetadataRequest) : Core::ParsedResponse(AS::UpdateDocumentMetadataResponse)
      Log.info { "performing 'UpdateDocumentMetadata' operation" }
      response = post("UpdateDocumentMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateDocumentMetadataResponse).new(response)
    end

    # Updates an existing maintenance window. Only specified parameters are modified.
    #
    # The value you specify for `Duration` determines the specific end time for the maintenance window
    # based on the time it begins. No maintenance window tasks are permitted to start after the
    # resulting endtime minus the number of hours you specify for `Cutoff`. For example, if the
    # maintenance window starts at 3 PM, the duration is three hours, and the value you specify for
    # `Cutoff` is one hour, no maintenance window tasks can start after 5 PM.
    def update_maintenance_window(input : AS::UpdateMaintenanceWindowRequest) : Core::ParsedResponse(AS::UpdateMaintenanceWindowResult)
      Log.info { "performing 'UpdateMaintenanceWindow' operation" }
      response = post("UpdateMaintenanceWindow", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateMaintenanceWindowResult).new(response)
    end

    # Modifies the target of an existing maintenance window. You can change the following:
    #
    # - Name
    #
    # - Description
    #
    # - Owner
    #
    # - IDs for an ID target
    #
    # - Tags for a Tag target
    #
    # - From any supported tag type to another. The three supported tag types are ID target, Tag
    # target, and resource group. For more information, see Target.
    #
    # If a parameter is null, then the corresponding field isn't modified.
    def update_maintenance_window_target(input : AS::UpdateMaintenanceWindowTargetRequest) : Core::ParsedResponse(AS::UpdateMaintenanceWindowTargetResult)
      Log.info { "performing 'UpdateMaintenanceWindowTarget' operation" }
      response = post("UpdateMaintenanceWindowTarget", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateMaintenanceWindowTargetResult).new(response)
    end

    # Modifies a task assigned to a maintenance window. You can't change the task type, but you can
    # change the following values:
    #
    # - `TaskARN`. For example, you can change a `RUN_COMMAND` task from `AWS-RunPowerShellScript` to
    # `AWS-RunShellScript`.
    #
    # - `ServiceRoleArn`
    #
    # - `TaskInvocationParameters`
    #
    # - `Priority`
    #
    # - `MaxConcurrency`
    #
    # - `MaxErrors`
    #
    # One or more targets must be specified for maintenance window Run Command-type tasks. Depending
    # on the task, targets are optional for other maintenance window task types (Automation, Lambda,
    # and Step Functions). For more information about running tasks that don't specify targets, see
    # [Registering maintenance window tasks without
    # targets](https://docs.aws.amazon.com/systems-manager/latest/userguide/maintenance-windows-targetless-tasks.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    #
    # If the value for a parameter in `UpdateMaintenanceWindowTask` is null, then the corresponding
    # field isn't modified. If you set `Replace` to true, then all fields required by the
    # RegisterTaskWithMaintenanceWindow operation are required for this request. Optional fields that
    # aren't specified are set to null.
    #
    # When you update a maintenance window task that has options specified in
    # `TaskInvocationParameters`, you must provide again all the `TaskInvocationParameters` values
    # that you want to retain. The values you don't specify again are removed. For example, suppose
    # that when you registered a Run Command task, you specified `TaskInvocationParameters` values for
    # `Comment`, `NotificationConfig`, and `OutputS3BucketName`. If you update the maintenance window
    # task and specify only a different `OutputS3BucketName` value, the values for `Comment` and
    # `NotificationConfig` are removed.
    def update_maintenance_window_task(input : AS::UpdateMaintenanceWindowTaskRequest) : Core::ParsedResponse(AS::UpdateMaintenanceWindowTaskResult)
      Log.info { "performing 'UpdateMaintenanceWindowTask' operation" }
      response = post("UpdateMaintenanceWindowTask", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateMaintenanceWindowTaskResult).new(response)
    end

    # Changes the Identity and Access Management (IAM) role that is assigned to the on-premises
    # server, edge device, or virtual machines (VM). IAM roles are first assigned to these hybrid
    # nodes during the activation process. For more information, see CreateActivation.
    def update_managed_instance_role(input : AS::UpdateManagedInstanceRoleRequest) : Core::ParsedResponse(AS::UpdateManagedInstanceRoleResult)
      Log.info { "performing 'UpdateManagedInstanceRole' operation" }
      response = post("UpdateManagedInstanceRole", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateManagedInstanceRoleResult).new(response)
    end

    # Edit or change an OpsItem. You must have permission in Identity and Access Management (IAM) to
    # update an OpsItem. For more information, see [Set up
    # OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter-setup.html) in
    # the *Amazon Web Services Systems Manager User Guide*.
    #
    # Operations engineers and IT professionals use Amazon Web Services Systems Manager OpsCenter to
    # view, investigate, and remediate operational issues impacting the performance and health of
    # their Amazon Web Services resources. For more information, see [Amazon Web Services Systems
    # Manager OpsCenter](https://docs.aws.amazon.com/systems-manager/latest/userguide/OpsCenter.html)
    # in the *Amazon Web Services Systems Manager User Guide*.
    def update_ops_item(input : AS::UpdateOpsItemRequest) : Core::ParsedResponse(AS::UpdateOpsItemResponse)
      Log.info { "performing 'UpdateOpsItem' operation" }
      response = post("UpdateOpsItem", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateOpsItemResponse).new(response)
    end

    # Amazon Web Services Systems Manager calls this API operation when you edit OpsMetadata in
    # Application Manager.
    def update_ops_metadata(input : AS::UpdateOpsMetadataRequest) : Core::ParsedResponse(AS::UpdateOpsMetadataResult)
      Log.info { "performing 'UpdateOpsMetadata' operation" }
      response = post("UpdateOpsMetadata", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateOpsMetadataResult).new(response)
    end

    # Modifies an existing patch baseline. Fields not specified in the request are left unchanged.
    #
    # For information about valid key-value pairs in `PatchFilters` for each supported operating
    # system type, see PatchFilter.
    def update_patch_baseline(input : AS::UpdatePatchBaselineRequest) : Core::ParsedResponse(AS::UpdatePatchBaselineResult)
      Log.info { "performing 'UpdatePatchBaseline' operation" }
      response = post("UpdatePatchBaseline", "/", input.to_json)
      Core::ParsedResponse(AS::UpdatePatchBaselineResult).new(response)
    end

    # Update a resource data sync. After you create a resource data sync for a Region, you can't
    # change the account options for that sync. For example, if you create a sync in the us-east-2
    # (Ohio) Region and you choose the `Include only the current account` option, you can't edit that
    # sync later and choose the `Include all accounts from my Organizations configuration` option.
    # Instead, you must delete the first resource data sync, and create a new one.
    #
    # This API operation only supports a resource data sync that was created with a SyncFromSource
    # `SyncType`.
    def update_resource_data_sync(input : AS::UpdateResourceDataSyncRequest) : Core::ParsedResponse(AS::UpdateResourceDataSyncResult)
      Log.info { "performing 'UpdateResourceDataSync' operation" }
      response = post("UpdateResourceDataSync", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateResourceDataSyncResult).new(response)
    end

    # `ServiceSetting` is an account-level setting for an Amazon Web Services service. This setting
    # defines how a user interacts with or uses a service or a feature of a service. For example, if
    # an Amazon Web Services service charges money to the account based on feature or service usage,
    # then the Amazon Web Services service team might create a default setting of "false". This means
    # the user can't use this feature unless they change the setting to "true" and intentionally opt
    # in for a paid feature.
    #
    # Services map a `SettingId` object to a setting value. Amazon Web Services services teams define
    # the default value for a `SettingId`. You can't create a new `SettingId`, but you can overwrite
    # the default value if you have the `ssm:UpdateServiceSetting` permission for the setting. Use the
    # GetServiceSetting API operation to view the current value. Or, use the ResetServiceSetting to
    # change the value back to the original value defined by the Amazon Web Services service team.
    #
    # Update the service setting for the account.
    def update_service_setting(input : AS::UpdateServiceSettingRequest) : Core::ParsedResponse(AS::UpdateServiceSettingResult)
      Log.info { "performing 'UpdateServiceSetting' operation" }
      response = post("UpdateServiceSetting", "/", input.to_json)
      Core::ParsedResponse(AS::UpdateServiceSettingResult).new(response)
    end

    # Validates the configuration and connectivity of a cloud connector.
    def validate_cloud_connector(input : AS::ValidateCloudConnectorRequest) : Core::ParsedResponse(AS::ValidateCloudConnectorResult)
      Log.info { "performing 'ValidateCloudConnector' operation" }
      response = post("ValidateCloudConnector", "/", input.to_json)
      Core::ParsedResponse(AS::ValidateCloudConnectorResult).new(response)
    end
  end
end
