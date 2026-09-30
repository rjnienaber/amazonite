private alias ACF = Amazonite::CloudFormation
private alias Core = Amazonite::Core

module Amazonite::CloudFormation
  class Client < Core::Client
    Log               = ::Log.for("amazonite.cloudformation.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("CloudFormation", "cloudformation", "1.0", EXCEPTION_FACTORY, config)
    end

    # Activate trusted access with Organizations. With trusted access between StackSets and
    # Organizations activated, the management account has permissions to create and manage StackSets
    # for your organization.
    def activate_organizations_access(input : ACF::ActivateOrganizationsAccessInput) : Core::ParsedResponse(ACF::ActivateOrganizationsAccessOutput)
      Log.info { "performing 'ActivateOrganizationsAccess' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ActivateOrganizationsAccess")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ActivateOrganizationsAccess", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ActivateOrganizationsAccessResult']").not_nil!
      result = ACF::ActivateOrganizationsAccessOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ActivateOrganizationsAccessOutput).new(response, result)
    end

    # Activates a public third-party extension, such as a resource or module, to make it available for
    # use in stack templates in your current account and Region. It can also create CloudFormation
    # Hooks, which allow you to evaluate resource configurations before CloudFormation provisions
    # them. Hooks integrate with both CloudFormation and Cloud Control API operations.
    #
    # After you activate an extension, you can use
    # [SetTypeConfiguration](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html)
    # to set specific properties for the extension.
    #
    # To see which extensions have been activated, use
    # [ListTypes](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListTypes.html).
    # To see configuration details for an extension, use
    # [DescribeType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html).
    #
    # For more information, see [Activate a third-party public extension in your
    # account](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-public-activate-extension.html)
    # in the *CloudFormation User Guide*. For information about creating Hooks, see the
    # [CloudFormation Hooks User
    # Guide](https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html).
    def activate_type(input : ACF::ActivateTypeInput) : Core::ParsedResponse(ACF::ActivateTypeOutput)
      Log.info { "performing 'ActivateType' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ActivateType")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ActivateType", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ActivateTypeResult']").not_nil!
      result = ACF::ActivateTypeOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ActivateTypeOutput).new(response, result)
    end

    # Returns configuration data for the specified CloudFormation extensions, from the CloudFormation
    # registry in your current account and Region.
    #
    # For more information, see [Edit configuration data for extensions in your
    # account](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html)
    # in the *CloudFormation User Guide*.
    def batch_describe_type_configurations(input : ACF::BatchDescribeTypeConfigurationsInput) : Core::ParsedResponse(ACF::BatchDescribeTypeConfigurationsOutput)
      Log.info { "performing 'BatchDescribeTypeConfigurations' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "BatchDescribeTypeConfigurations")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("BatchDescribeTypeConfigurations", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='BatchDescribeTypeConfigurationsResult']").not_nil!
      result = ACF::BatchDescribeTypeConfigurationsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::BatchDescribeTypeConfigurationsOutput).new(response, result)
    end

    # Cancels an update on the specified stack. If the call completes successfully, the stack rolls
    # back the update and reverts to the previous stack configuration.
    #
    # You can cancel only stacks that are in the `UPDATE_IN_PROGRESS` state.
    def cancel_update_stack(input : ACF::CancelUpdateStackInput) : Core::Response
      Log.info { "performing 'CancelUpdateStack' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CancelUpdateStack")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CancelUpdateStack", body)
      Core::Response.new(response)
    end

    # Continues rolling back a stack from `UPDATE_ROLLBACK_FAILED` to `UPDATE_ROLLBACK_COMPLETE`
    # state. Depending on the cause of the failure, you can manually fix the error and continue the
    # rollback. By continuing the rollback, you can return your stack to a working state (the
    # `UPDATE_ROLLBACK_COMPLETE` state) and then try to update the stack again.
    #
    # A stack enters the `UPDATE_ROLLBACK_FAILED` state when CloudFormation can't roll back all
    # changes after a failed stack update. For example, this might occur when a stack attempts to roll
    # back to an old database that was deleted outside of CloudFormation. Because CloudFormation
    # doesn't know the instance was deleted, it assumes the instance still exists and attempts to roll
    # back to it, causing the update rollback to fail.
    #
    # For more information, see [Continue rolling back an
    # update](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-continueupdaterollback.html)
    # in the *CloudFormation User Guide*. For information for troubleshooting a failed update
    # rollback, see [Update rollback
    # failed](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/troubleshooting.html#troubleshooting-errors-update-rollback-failed).
    def continue_update_rollback(input : ACF::ContinueUpdateRollbackInput) : Core::ParsedResponse(ACF::ContinueUpdateRollbackOutput)
      Log.info { "performing 'ContinueUpdateRollback' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ContinueUpdateRollback")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ContinueUpdateRollback", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ContinueUpdateRollbackResult']").not_nil!
      result = ACF::ContinueUpdateRollbackOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ContinueUpdateRollbackOutput).new(response, result)
    end

    # Creates a list of changes that will be applied to a stack so that you can review the changes
    # before executing them. You can create a change set for a stack that doesn't exist or an existing
    # stack. If you create a change set for a stack that doesn't exist, the change set shows all of
    # the resources that CloudFormation will create. If you create a change set for an existing stack,
    # CloudFormation compares the stack's information with the information that you submit in the
    # change set and lists the differences. Use change sets to understand which resources
    # CloudFormation will create or change, and how it will change resources in an existing stack,
    # before you create or update a stack.
    #
    # To create a change set for a stack that doesn't exist, for the `ChangeSetType` parameter,
    # specify `CREATE`. To create a change set for an existing stack, specify `UPDATE` for the
    # `ChangeSetType` parameter. To create a change set for an import operation, specify `IMPORT` for
    # the `ChangeSetType` parameter. After the `CreateChangeSet` call successfully completes,
    # CloudFormation starts creating the change set. To check the status of the change set or to
    # review it, use the DescribeChangeSet action.
    #
    # When you are satisfied with the changes the change set will make, execute the change set by
    # using the ExecuteChangeSet action. CloudFormation doesn't make changes until you execute the
    # change set.
    #
    # To create a change set for the entire stack hierarchy, set `IncludeNestedStacks` to `True`.
    def create_change_set(input : ACF::CreateChangeSetInput) : Core::ParsedResponse(ACF::CreateChangeSetOutput)
      Log.info { "performing 'CreateChangeSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateChangeSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateChangeSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateChangeSetResult']").not_nil!
      result = ACF::CreateChangeSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::CreateChangeSetOutput).new(response, result)
    end

    # Creates a template from existing resources that are not already managed with CloudFormation. You
    # can check the status of the template generation using the `DescribeGeneratedTemplate` API
    # action.
    def create_generated_template(input : ACF::CreateGeneratedTemplateInput) : Core::ParsedResponse(ACF::CreateGeneratedTemplateOutput)
      Log.info { "performing 'CreateGeneratedTemplate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateGeneratedTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateGeneratedTemplate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateGeneratedTemplateResult']").not_nil!
      result = ACF::CreateGeneratedTemplateOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::CreateGeneratedTemplateOutput).new(response, result)
    end

    # Creates a stack as specified in the template. After the call completes successfully, the stack
    # creation starts. You can check the status of the stack through the DescribeStacks operation.
    #
    # For more information about creating a stack and monitoring stack progress, see [Managing Amazon
    # Web Services resources as a single unit with CloudFormation
    # stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html) in the
    # *CloudFormation User Guide*.
    def create_stack(input : ACF::CreateStackInput) : Core::ParsedResponse(ACF::CreateStackOutput)
      Log.info { "performing 'CreateStack' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateStack")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateStack", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateStackResult']").not_nil!
      result = ACF::CreateStackOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::CreateStackOutput).new(response, result)
    end

    # Creates stack instances for the specified accounts, within the specified Amazon Web Services
    # Regions. A stack instance refers to a stack in a specific account and Region. You must specify
    # at least one value for either `Accounts` or `DeploymentTargets`, and you must specify at least
    # one value for `Regions`.
    #
    # The maximum number of organizational unit (OUs) supported by a `CreateStackInstances` operation
    # is 50.
    #
    # If you need more than 50, consider the following options:
    #
    # - *Batch processing:* If you don't want to expose your OU hierarchy, split up the operations
    # into multiple calls with less than 50 OUs each.
    #
    # - *Parent OU strategy:* If you don't mind exposing the OU hierarchy, target a parent OU that
    # contains all desired child OUs.
    def create_stack_instances(input : ACF::CreateStackInstancesInput) : Core::ParsedResponse(ACF::CreateStackInstancesOutput)
      Log.info { "performing 'CreateStackInstances' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateStackInstances")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateStackInstances", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateStackInstancesResult']").not_nil!
      result = ACF::CreateStackInstancesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::CreateStackInstancesOutput).new(response, result)
    end

    # Creates a refactor across multiple stacks, with the list of stacks and resources that are
    # affected.
    def create_stack_refactor(input : ACF::CreateStackRefactorInput) : Core::ParsedResponse(ACF::CreateStackRefactorOutput)
      Log.info { "performing 'CreateStackRefactor' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateStackRefactor")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateStackRefactor", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateStackRefactorResult']").not_nil!
      result = ACF::CreateStackRefactorOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::CreateStackRefactorOutput).new(response, result)
    end

    # Creates a StackSet.
    def create_stack_set(input : ACF::CreateStackSetInput) : Core::ParsedResponse(ACF::CreateStackSetOutput)
      Log.info { "performing 'CreateStackSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateStackSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateStackSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateStackSetResult']").not_nil!
      result = ACF::CreateStackSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::CreateStackSetOutput).new(response, result)
    end

    # Deactivates trusted access with Organizations. If trusted access is deactivated, the management
    # account does not have permissions to create and manage service-managed StackSets for your
    # organization.
    def deactivate_organizations_access(input : ACF::DeactivateOrganizationsAccessInput) : Core::ParsedResponse(ACF::DeactivateOrganizationsAccessOutput)
      Log.info { "performing 'DeactivateOrganizationsAccess' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeactivateOrganizationsAccess")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeactivateOrganizationsAccess", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeactivateOrganizationsAccessResult']").not_nil!
      result = ACF::DeactivateOrganizationsAccessOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DeactivateOrganizationsAccessOutput).new(response, result)
    end

    # Deactivates a public third-party extension, such as a resource or module, or a CloudFormation
    # Hook when you no longer use it.
    #
    # Deactivating an extension deletes the configuration details that are associated with it. To
    # temporarily disable a CloudFormation Hook instead, you can use
    # [SetTypeConfiguration](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html).
    #
    # Once deactivated, an extension can't be used in any CloudFormation operation. This includes
    # stack update operations where the stack template includes the extension, even if no updates are
    # being made to the extension. In addition, deactivated extensions aren't automatically updated if
    # a new version of the extension is released.
    #
    # To see which extensions are currently activated, use
    # [ListTypes](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_ListTypes.html).
    def deactivate_type(input : ACF::DeactivateTypeInput) : Core::ParsedResponse(ACF::DeactivateTypeOutput)
      Log.info { "performing 'DeactivateType' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeactivateType")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeactivateType", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeactivateTypeResult']").not_nil!
      result = ACF::DeactivateTypeOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DeactivateTypeOutput).new(response, result)
    end

    # Deletes the specified change set. Deleting change sets ensures that no one executes the wrong
    # change set.
    #
    # If the call successfully completes, CloudFormation successfully deleted the change set.
    #
    # If `IncludeNestedStacks` specifies `True` during the creation of the nested change set, then
    # `DeleteChangeSet` will delete all change sets that belong to the stacks hierarchy and will also
    # delete all change sets for nested stacks with the status of `REVIEW_IN_PROGRESS`.
    def delete_change_set(input : ACF::DeleteChangeSetInput) : Core::ParsedResponse(ACF::DeleteChangeSetOutput)
      Log.info { "performing 'DeleteChangeSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteChangeSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteChangeSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeleteChangeSetResult']").not_nil!
      result = ACF::DeleteChangeSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DeleteChangeSetOutput).new(response, result)
    end

    # Deleted a generated template.
    def delete_generated_template(input : ACF::DeleteGeneratedTemplateInput) : Core::Response
      Log.info { "performing 'DeleteGeneratedTemplate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteGeneratedTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteGeneratedTemplate", body)
      Core::Response.new(response)
    end

    # Deletes a specified stack. Once the call completes successfully, stack deletion starts. Deleted
    # stacks don't show up in the DescribeStacks operation if the deletion has been completed
    # successfully.
    #
    # For more information about deleting a stack, see [Delete a stack from the CloudFormation
    # console](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cfn-console-delete-stack.html)
    # in the *CloudFormation User Guide*.
    def delete_stack(input : ACF::DeleteStackInput) : Core::Response
      Log.info { "performing 'DeleteStack' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteStack")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteStack", body)
      Core::Response.new(response)
    end

    # Deletes stack instances for the specified accounts, in the specified Amazon Web Services
    # Regions.
    #
    # The maximum number of organizational unit (OUs) supported by a `DeleteStackInstances` operation
    # is 50.
    #
    # If you need more than 50, consider the following options:
    #
    # - *Batch processing:* If you don't want to expose your OU hierarchy, split up the operations
    # into multiple calls with less than 50 OUs each.
    #
    # - *Parent OU strategy:* If you don't mind exposing the OU hierarchy, target a parent OU that
    # contains all desired child OUs.
    def delete_stack_instances(input : ACF::DeleteStackInstancesInput) : Core::ParsedResponse(ACF::DeleteStackInstancesOutput)
      Log.info { "performing 'DeleteStackInstances' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteStackInstances")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteStackInstances", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeleteStackInstancesResult']").not_nil!
      result = ACF::DeleteStackInstancesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DeleteStackInstancesOutput).new(response, result)
    end

    # Deletes a StackSet. Before you can delete a StackSet, all its member stack instances must be
    # deleted. For more information about how to complete this, see DeleteStackInstances.
    def delete_stack_set(input : ACF::DeleteStackSetInput) : Core::ParsedResponse(ACF::DeleteStackSetOutput)
      Log.info { "performing 'DeleteStackSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteStackSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteStackSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeleteStackSetResult']").not_nil!
      result = ACF::DeleteStackSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DeleteStackSetOutput).new(response, result)
    end

    # Marks an extension or extension version as `DEPRECATED` in the CloudFormation registry, removing
    # it from active use. Deprecated extensions or extension versions cannot be used in CloudFormation
    # operations.
    #
    # To deregister an entire extension, you must individually deregister all active versions of that
    # extension. If an extension has only a single active version, deregistering that version results
    # in the extension itself being deregistered and marked as deprecated in the registry.
    #
    # You can't deregister the default version of an extension if there are other active version of
    # that extension. If you do deregister the default version of an extension, the extension type
    # itself is deregistered as well and marked as deprecated.
    #
    # To view the deprecation status of an extension or extension version, use
    # [DescribeType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html).
    #
    # For more information, see [Remove third-party private extensions from your
    # account](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-private-deregister-extension.html)
    # in the *CloudFormation User Guide*.
    def deregister_type(input : ACF::DeregisterTypeInput) : Core::ParsedResponse(ACF::DeregisterTypeOutput)
      Log.info { "performing 'DeregisterType' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeregisterType")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeregisterType", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeregisterTypeResult']").not_nil!
      result = ACF::DeregisterTypeOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DeregisterTypeOutput).new(response, result)
    end

    # Retrieves your account's CloudFormation limits, such as the maximum number of stacks that you
    # can create in your account. For more information about account limits, see [Understand
    # CloudFormation
    # quotas](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/cloudformation-limits.html)
    # in the *CloudFormation User Guide*.
    def describe_account_limits(input : ACF::DescribeAccountLimitsInput) : Core::ParsedResponse(ACF::DescribeAccountLimitsOutput)
      Log.info { "performing 'DescribeAccountLimits' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeAccountLimits")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeAccountLimits", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeAccountLimitsResult']").not_nil!
      result = ACF::DescribeAccountLimitsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeAccountLimitsOutput).new(response, result)
    end

    # Returns the inputs for the change set and a list of changes that CloudFormation will make if you
    # execute the change set. For more information, see [Update CloudFormation stacks using change
    # sets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-updating-stacks-changesets.html)
    # in the *CloudFormation User Guide*.
    def describe_change_set(input : ACF::DescribeChangeSetInput) : Core::ParsedResponse(ACF::DescribeChangeSetOutput)
      Log.info { "performing 'DescribeChangeSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeChangeSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeChangeSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeChangeSetResult']").not_nil!
      result = ACF::DescribeChangeSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeChangeSetOutput).new(response, result)
    end

    # Returns Hook-related information for the change set and a list of changes that CloudFormation
    # makes when you run the change set.
    def describe_change_set_hooks(input : ACF::DescribeChangeSetHooksInput) : Core::ParsedResponse(ACF::DescribeChangeSetHooksOutput)
      Log.info { "performing 'DescribeChangeSetHooks' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeChangeSetHooks")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeChangeSetHooks", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeChangeSetHooksResult']").not_nil!
      result = ACF::DescribeChangeSetHooksOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeChangeSetHooksOutput).new(response, result)
    end

    # Returns CloudFormation events based on flexible query criteria. Groups events by operation ID,
    # enabling you to focus on individual stack operations during deployment.
    #
    # An operation is any action performed on a stack, including stack lifecycle actions (Create,
    # Update, Delete, Rollback), change set creation, nested stack creation, and automatic rollbacks
    # triggered by failures. Each operation has a unique identifier (Operation ID) and represents a
    # discrete change attempt on the stack.
    #
    # Returns different types of events including:
    #
    # - **Progress events** - Status updates during stack operation execution.
    #
    # - **Validation errors** - Failures from CloudFormation Early Validations.
    #
    # - **Provisioning errors** - Resource creation and update failures.
    #
    # - **Hook invocation errors** - Failures from CloudFormation Hook during stack operations.
    #
    # One of `ChangeSetName`, `OperationId` or `StackName` must be specified as input.
    def describe_events(input : ACF::DescribeEventsInput) : Core::ParsedResponse(ACF::DescribeEventsOutput)
      Log.info { "performing 'DescribeEvents' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeEvents")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeEvents", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeEventsResult']").not_nil!
      result = ACF::DescribeEventsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeEventsOutput).new(response, result)
    end

    # Describes a generated template. The output includes details about the progress of the creation
    # of a generated template started by a `CreateGeneratedTemplate` API action or the update of a
    # generated template started with an `UpdateGeneratedTemplate` API action.
    def describe_generated_template(input : ACF::DescribeGeneratedTemplateInput) : Core::ParsedResponse(ACF::DescribeGeneratedTemplateOutput)
      Log.info { "performing 'DescribeGeneratedTemplate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeGeneratedTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeGeneratedTemplate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeGeneratedTemplateResult']").not_nil!
      result = ACF::DescribeGeneratedTemplateOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeGeneratedTemplateOutput).new(response, result)
    end

    # Retrieves information about the account's `OrganizationAccess` status. This API can be called
    # either by the management account or the delegated administrator by using the `CallAs` parameter.
    # This API can also be called without the `CallAs` parameter by the management account.
    def describe_organizations_access(input : ACF::DescribeOrganizationsAccessInput) : Core::ParsedResponse(ACF::DescribeOrganizationsAccessOutput)
      Log.info { "performing 'DescribeOrganizationsAccess' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeOrganizationsAccess")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeOrganizationsAccess", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeOrganizationsAccessResult']").not_nil!
      result = ACF::DescribeOrganizationsAccessOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeOrganizationsAccessOutput).new(response, result)
    end

    # Returns information about a CloudFormation extension publisher.
    #
    # If you don't supply a `PublisherId`, and you have registered as an extension publisher,
    # `DescribePublisher` returns information about your own publisher account.
    #
    # For more information about registering as a publisher, see:
    #
    # -
    # [RegisterPublisher](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html)
    #
    # - [Publishing extensions to make them available for public
    # use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html) in
    # the *CloudFormation Command Line Interface (CLI) User Guide*
    def describe_publisher(input : ACF::DescribePublisherInput) : Core::ParsedResponse(ACF::DescribePublisherOutput)
      Log.info { "performing 'DescribePublisher' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribePublisher")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribePublisher", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribePublisherResult']").not_nil!
      result = ACF::DescribePublisherOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribePublisherOutput).new(response, result)
    end

    # Describes details of a resource scan.
    def describe_resource_scan(input : ACF::DescribeResourceScanInput) : Core::ParsedResponse(ACF::DescribeResourceScanOutput)
      Log.info { "performing 'DescribeResourceScan' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeResourceScan")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeResourceScan", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeResourceScanResult']").not_nil!
      result = ACF::DescribeResourceScanOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeResourceScanOutput).new(response, result)
    end

    # Returns information about a stack drift detection operation. A stack drift detection operation
    # detects whether a stack's actual configuration differs, or has *drifted*, from its expected
    # configuration, as defined in the stack template and any values specified as template parameters.
    # A stack is considered to have drifted if one or more of its resources have drifted. For more
    # information about stack and resource drift, see [Detect unmanaged configuration changes to
    # stacks and resources with drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
    #
    # Use DetectStackDrift to initiate a stack drift detection operation. `DetectStackDrift` returns a
    # `StackDriftDetectionId` you can use to monitor the progress of the operation using
    # `DescribeStackDriftDetectionStatus`. Once the drift detection operation has completed, use
    # DescribeStackResourceDrifts to return drift information about the stack and its resources.
    def describe_stack_drift_detection_status(input : ACF::DescribeStackDriftDetectionStatusInput) : Core::ParsedResponse(ACF::DescribeStackDriftDetectionStatusOutput)
      Log.info { "performing 'DescribeStackDriftDetectionStatus' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackDriftDetectionStatus")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackDriftDetectionStatus", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackDriftDetectionStatusResult']").not_nil!
      result = ACF::DescribeStackDriftDetectionStatusOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackDriftDetectionStatusOutput).new(response, result)
    end

    # Returns all stack related events for a specified stack in reverse chronological order. For more
    # information about a stack's event history, see [Understand CloudFormation stack creation
    # events](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html)
    # in the *CloudFormation User Guide*.
    #
    # You can list events for stacks that have failed to create or have been deleted by specifying the
    # unique stack identifier (stack ID).
    def describe_stack_events(input : ACF::DescribeStackEventsInput) : Core::ParsedResponse(ACF::DescribeStackEventsOutput)
      Log.info { "performing 'DescribeStackEvents' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackEvents")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackEvents", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackEventsResult']").not_nil!
      result = ACF::DescribeStackEventsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackEventsOutput).new(response, result)
    end

    # Returns the stack instance that's associated with the specified StackSet, Amazon Web Services
    # account, and Amazon Web Services Region.
    #
    # For a list of stack instances that are associated with a specific StackSet, use
    # ListStackInstances.
    def describe_stack_instance(input : ACF::DescribeStackInstanceInput) : Core::ParsedResponse(ACF::DescribeStackInstanceOutput)
      Log.info { "performing 'DescribeStackInstance' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackInstance")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackInstance", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackInstanceResult']").not_nil!
      result = ACF::DescribeStackInstanceOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackInstanceOutput).new(response, result)
    end

    # Describes the stack refactor status.
    def describe_stack_refactor(input : ACF::DescribeStackRefactorInput) : Core::ParsedResponse(ACF::DescribeStackRefactorOutput)
      Log.info { "performing 'DescribeStackRefactor' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackRefactor")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackRefactor", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackRefactorResult']").not_nil!
      result = ACF::DescribeStackRefactorOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackRefactorOutput).new(response, result)
    end

    # Returns a description of the specified resource in the specified stack.
    #
    # For deleted stacks, DescribeStackResource returns resource information for up to 90 days after
    # the stack has been deleted.
    def describe_stack_resource(input : ACF::DescribeStackResourceInput) : Core::ParsedResponse(ACF::DescribeStackResourceOutput)
      Log.info { "performing 'DescribeStackResource' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackResource")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackResource", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackResourceResult']").not_nil!
      result = ACF::DescribeStackResourceOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackResourceOutput).new(response, result)
    end

    # Returns drift information for the resources that have been checked for drift in the specified
    # stack. This includes actual and expected configuration values for resources where CloudFormation
    # detects configuration drift.
    #
    # For a given stack, there will be one `StackResourceDrift` for each stack resource that has been
    # checked for drift. Resources that haven't yet been checked for drift aren't included. Resources
    # that don't currently support drift detection aren't checked, and so not included. For a list of
    # resources that support drift detection, see [Resource type support for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html).
    #
    # Use DetectStackResourceDrift to detect drift on individual resources, or DetectStackDrift to
    # detect drift on all supported resources for a given stack.
    def describe_stack_resource_drifts(input : ACF::DescribeStackResourceDriftsInput) : Core::ParsedResponse(ACF::DescribeStackResourceDriftsOutput)
      Log.info { "performing 'DescribeStackResourceDrifts' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackResourceDrifts")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackResourceDrifts", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackResourceDriftsResult']").not_nil!
      result = ACF::DescribeStackResourceDriftsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackResourceDriftsOutput).new(response, result)
    end

    # Returns Amazon Web Services resource descriptions for running and deleted stacks. If `StackName`
    # is specified, all the associated resources that are part of the stack are returned. If
    # `PhysicalResourceId` is specified, the associated resources of the stack that the resource
    # belongs to are returned.
    #
    # Only the first 100 resources will be returned. If your stack has more resources than this, you
    # should use `ListStackResources` instead.
    #
    # For deleted stacks, `DescribeStackResources` returns resource information for up to 90 days
    # after the stack has been deleted.
    #
    # You must specify either `StackName` or `PhysicalResourceId`, but not both. In addition, you can
    # specify `LogicalResourceId` to filter the returned result. For more information about resources,
    # the `LogicalResourceId` and `PhysicalResourceId`, see the [CloudFormation User
    # Guide](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/).
    #
    # A `ValidationError` is returned if you specify both `StackName` and `PhysicalResourceId` in the
    # same request.
    def describe_stack_resources(input : ACF::DescribeStackResourcesInput) : Core::ParsedResponse(ACF::DescribeStackResourcesOutput)
      Log.info { "performing 'DescribeStackResources' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackResources")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackResources", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackResourcesResult']").not_nil!
      result = ACF::DescribeStackResourcesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackResourcesOutput).new(response, result)
    end

    # Returns the description for the specified stack; if no stack name was specified, then it returns
    # the description for all the stacks created. For more information about a stack's event history,
    # see [Understand CloudFormation stack creation
    # events](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stack-resource-configuration-complete.html)
    # in the *CloudFormation User Guide*.
    #
    # If the stack doesn't exist, a `ValidationError` is returned.
    def describe_stacks(input : ACF::DescribeStacksInput) : Core::ParsedResponse(ACF::DescribeStacksOutput)
      Log.info { "performing 'DescribeStacks' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStacks")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStacks", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStacksResult']").not_nil!
      result = ACF::DescribeStacksOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStacksOutput).new(response, result)
    end

    # Returns the description of the specified StackSet.
    #
    # This API provides *strongly consistent* reads meaning it will always return the most up-to-date
    # data.
    def describe_stack_set(input : ACF::DescribeStackSetInput) : Core::ParsedResponse(ACF::DescribeStackSetOutput)
      Log.info { "performing 'DescribeStackSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackSetResult']").not_nil!
      result = ACF::DescribeStackSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackSetOutput).new(response, result)
    end

    # Returns the description of the specified StackSet operation.
    #
    # This API provides *strongly consistent* reads meaning it will always return the most up-to-date
    # data.
    def describe_stack_set_operation(input : ACF::DescribeStackSetOperationInput) : Core::ParsedResponse(ACF::DescribeStackSetOperationOutput)
      Log.info { "performing 'DescribeStackSetOperation' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeStackSetOperation")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeStackSetOperation", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeStackSetOperationResult']").not_nil!
      result = ACF::DescribeStackSetOperationOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeStackSetOperationOutput).new(response, result)
    end

    # Returns detailed information about an extension from the CloudFormation registry in your current
    # account and Region.
    #
    # If you specify a `VersionId`, `DescribeType` returns information about that specific extension
    # version. Otherwise, it returns information about the default extension version.
    #
    # For more information, see [Edit configuration data for extensions in your
    # account](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html)
    # in the *CloudFormation User Guide*.
    def describe_type(input : ACF::DescribeTypeInput) : Core::ParsedResponse(ACF::DescribeTypeOutput)
      Log.info { "performing 'DescribeType' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeType")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeType", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeTypeResult']").not_nil!
      result = ACF::DescribeTypeOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeTypeOutput).new(response, result)
    end

    # Returns information about an extension's registration, including its current status and type and
    # version identifiers.
    #
    # When you initiate a registration request using RegisterType, you can then use
    # DescribeTypeRegistration to monitor the progress of that registration request.
    #
    # Once the registration request has completed, use DescribeType to return detailed information
    # about an extension.
    def describe_type_registration(input : ACF::DescribeTypeRegistrationInput) : Core::ParsedResponse(ACF::DescribeTypeRegistrationOutput)
      Log.info { "performing 'DescribeTypeRegistration' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DescribeTypeRegistration")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DescribeTypeRegistration", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DescribeTypeRegistrationResult']").not_nil!
      result = ACF::DescribeTypeRegistrationOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DescribeTypeRegistrationOutput).new(response, result)
    end

    # Detects whether a stack's actual configuration differs, or has *drifted*, from its expected
    # configuration, as defined in the stack template and any values specified as template parameters.
    # For each resource in the stack that supports drift detection, CloudFormation compares the actual
    # configuration of the resource with its expected template configuration. Only resource properties
    # explicitly defined in the stack template are checked for drift. A stack is considered to have
    # drifted if one or more of its resources differ from their expected template configurations. For
    # more information, see [Detect unmanaged configuration changes to stacks and resources with drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
    #
    # Use `DetectStackDrift` to detect drift on all supported resources for a given stack, or
    # DetectStackResourceDrift to detect drift on individual resources.
    #
    # For a list of stack resources that currently support drift detection, see [Resource type support
    # for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html).
    #
    # `DetectStackDrift` can take up to several minutes, depending on the number of resources
    # contained within the stack. Use DescribeStackDriftDetectionStatus to monitor the progress of a
    # detect stack drift operation. Once the drift detection operation has completed, use
    # DescribeStackResourceDrifts to return drift information about the stack and its resources.
    #
    # When detecting drift on a stack, CloudFormation doesn't detect drift on any nested stacks
    # belonging to that stack. Perform `DetectStackDrift` directly on the nested stack itself.
    def detect_stack_drift(input : ACF::DetectStackDriftInput) : Core::ParsedResponse(ACF::DetectStackDriftOutput)
      Log.info { "performing 'DetectStackDrift' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetectStackDrift")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetectStackDrift", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DetectStackDriftResult']").not_nil!
      result = ACF::DetectStackDriftOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DetectStackDriftOutput).new(response, result)
    end

    # Returns information about whether a resource's actual configuration differs, or has *drifted*,
    # from its expected configuration, as defined in the stack template and any values specified as
    # template parameters. This information includes actual and expected property values for resources
    # in which CloudFormation detects drift. Only resource properties explicitly defined in the stack
    # template are checked for drift. For more information about stack and resource drift, see [Detect
    # unmanaged configuration changes to stacks and resources with drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-drift.html).
    #
    # Use `DetectStackResourceDrift` to detect drift on individual resources, or DetectStackDrift to
    # detect drift on all resources in a given stack that support drift detection.
    #
    # Resources that don't currently support drift detection can't be checked. For a list of resources
    # that support drift detection, see [Resource type support for imports and drift
    # detection](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/resource-import-supported-resources.html).
    def detect_stack_resource_drift(input : ACF::DetectStackResourceDriftInput) : Core::ParsedResponse(ACF::DetectStackResourceDriftOutput)
      Log.info { "performing 'DetectStackResourceDrift' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetectStackResourceDrift")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetectStackResourceDrift", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DetectStackResourceDriftResult']").not_nil!
      result = ACF::DetectStackResourceDriftOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DetectStackResourceDriftOutput).new(response, result)
    end

    # Detect drift on a StackSet. When CloudFormation performs drift detection on a StackSet, it
    # performs drift detection on the stack associated with each stack instance in the StackSet. For
    # more information, see [Performing drift detection on CloudFormation
    # StackSets](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacksets-drift.html).
    #
    # `DetectStackSetDrift` returns the `OperationId` of the StackSet drift detection operation. Use
    # this operation id with DescribeStackSetOperation to monitor the progress of the drift detection
    # operation. The drift detection operation may take some time, depending on the number of stack
    # instances included in the StackSet, in addition to the number of resources included in each
    # stack.
    #
    # Once the operation has completed, use the following actions to return drift information:
    #
    # - Use DescribeStackSet to return detailed information about the stack set, including detailed
    # information about the last *completed* drift operation performed on the StackSet. (Information
    # about drift operations that are in progress isn't included.)
    #
    # - Use ListStackInstances to return a list of stack instances belonging to the StackSet,
    # including the drift status and last drift time checked of each instance.
    #
    # - Use DescribeStackInstance to return detailed information about a specific stack instance,
    # including its drift status and last drift time checked.
    #
    # You can only run a single drift detection operation on a given StackSet at one time.
    #
    # To stop a drift detection StackSet operation, use StopStackSetOperation.
    def detect_stack_set_drift(input : ACF::DetectStackSetDriftInput) : Core::ParsedResponse(ACF::DetectStackSetDriftOutput)
      Log.info { "performing 'DetectStackSetDrift' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DetectStackSetDrift")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DetectStackSetDrift", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DetectStackSetDriftResult']").not_nil!
      result = ACF::DetectStackSetDriftOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::DetectStackSetDriftOutput).new(response, result)
    end

    # Returns the estimated monthly cost of a template. The return value is an Amazon Web Services
    # Simple Monthly Calculator URL with a query string that describes the resources required to run
    # the template.
    def estimate_template_cost(input : ACF::EstimateTemplateCostInput) : Core::ParsedResponse(ACF::EstimateTemplateCostOutput)
      Log.info { "performing 'EstimateTemplateCost' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "EstimateTemplateCost")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("EstimateTemplateCost", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='EstimateTemplateCostResult']").not_nil!
      result = ACF::EstimateTemplateCostOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::EstimateTemplateCostOutput).new(response, result)
    end

    # Updates a stack using the input information that was provided when the specified change set was
    # created. After the call successfully completes, CloudFormation starts updating the stack. Use
    # the DescribeStacks action to view the status of the update.
    #
    # When you execute a change set, CloudFormation deletes all other change sets associated with the
    # stack because they aren't valid for the updated stack.
    #
    # If a stack policy is associated with the stack, CloudFormation enforces the policy during the
    # update. You can't specify a temporary stack policy that overrides the current policy.
    #
    # To create a change set for the entire stack hierarchy, `IncludeNestedStacks` must have been set
    # to `True`.
    def execute_change_set(input : ACF::ExecuteChangeSetInput) : Core::ParsedResponse(ACF::ExecuteChangeSetOutput)
      Log.info { "performing 'ExecuteChangeSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ExecuteChangeSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ExecuteChangeSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ExecuteChangeSetResult']").not_nil!
      result = ACF::ExecuteChangeSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ExecuteChangeSetOutput).new(response, result)
    end

    # Executes the stack refactor operation.
    def execute_stack_refactor(input : ACF::ExecuteStackRefactorInput) : Core::Response
      Log.info { "performing 'ExecuteStackRefactor' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ExecuteStackRefactor")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ExecuteStackRefactor", body)
      Core::Response.new(response)
    end

    # Retrieves a generated template. If the template is in an `InProgress` or `Pending` status then
    # the template returned will be the template when the template was last in a `Complete` status. If
    # the template has not yet been in a `Complete` status then an empty template will be returned.
    def get_generated_template(input : ACF::GetGeneratedTemplateInput) : Core::ParsedResponse(ACF::GetGeneratedTemplateOutput)
      Log.info { "performing 'GetGeneratedTemplate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetGeneratedTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetGeneratedTemplate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetGeneratedTemplateResult']").not_nil!
      result = ACF::GetGeneratedTemplateOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::GetGeneratedTemplateOutput).new(response, result)
    end

    # Retrieves detailed information and remediation guidance for a Hook invocation result.
    #
    # If the Hook uses a KMS key to encrypt annotations, callers of the `GetHookResult` operation must
    # have `kms:Decrypt` permissions. For more information, see [KMS key policy and permissions for
    # encrypting CloudFormation Hooks results at
    # rest](https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/hooks-kms-key-policy.html)
    # in the *CloudFormation Hooks User Guide*.
    def get_hook_result(input : ACF::GetHookResultInput) : Core::ParsedResponse(ACF::GetHookResultOutput)
      Log.info { "performing 'GetHookResult' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetHookResult")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetHookResult", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetHookResultResult']").not_nil!
      result = ACF::GetHookResultOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::GetHookResultOutput).new(response, result)
    end

    # Returns the stack policy for a specified stack. If a stack doesn't have a policy, a null value
    # is returned.
    def get_stack_policy(input : ACF::GetStackPolicyInput) : Core::ParsedResponse(ACF::GetStackPolicyOutput)
      Log.info { "performing 'GetStackPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetStackPolicy")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetStackPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetStackPolicyResult']").not_nil!
      result = ACF::GetStackPolicyOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::GetStackPolicyOutput).new(response, result)
    end

    # Returns the template body for a specified stack. You can get the template for running or deleted
    # stacks.
    #
    # For deleted stacks, `GetTemplate` returns the template for up to 90 days after the stack has
    # been deleted.
    #
    # If the template doesn't exist, a `ValidationError` is returned.
    def get_template(input : ACF::GetTemplateInput) : Core::ParsedResponse(ACF::GetTemplateOutput)
      Log.info { "performing 'GetTemplate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetTemplate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetTemplateResult']").not_nil!
      result = ACF::GetTemplateOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::GetTemplateOutput).new(response, result)
    end

    # Returns information about a new or existing template. The `GetTemplateSummary` action is useful
    # for viewing parameter information, such as default parameter values and parameter types, before
    # you create or update a stack or StackSet.
    #
    # You can use the `GetTemplateSummary` action when you submit a template, or you can get template
    # information for a StackSet, or a running or deleted stack.
    #
    # For deleted stacks, `GetTemplateSummary` returns the template information for up to 90 days
    # after the stack has been deleted. If the template doesn't exist, a `ValidationError` is
    # returned.
    def get_template_summary(input : ACF::GetTemplateSummaryInput) : Core::ParsedResponse(ACF::GetTemplateSummaryOutput)
      Log.info { "performing 'GetTemplateSummary' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetTemplateSummary")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetTemplateSummary", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetTemplateSummaryResult']").not_nil!
      result = ACF::GetTemplateSummaryOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::GetTemplateSummaryOutput).new(response, result)
    end

    # Import existing stacks into a new StackSets. Use the stack import operation to import up to 10
    # stacks into a new StackSet in the same account as the source stack or in a different
    # administrator account and Region, by specifying the stack ID of the stack you intend to import.
    def import_stacks_to_stack_set(input : ACF::ImportStacksToStackSetInput) : Core::ParsedResponse(ACF::ImportStacksToStackSetOutput)
      Log.info { "performing 'ImportStacksToStackSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ImportStacksToStackSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ImportStacksToStackSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ImportStacksToStackSetResult']").not_nil!
      result = ACF::ImportStacksToStackSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ImportStacksToStackSetOutput).new(response, result)
    end

    # Returns the ID and status of each active change set for a stack. For example, CloudFormation
    # lists change sets that are in the `CREATE_IN_PROGRESS` or `CREATE_PENDING` state.
    def list_change_sets(input : ACF::ListChangeSetsInput) : Core::ParsedResponse(ACF::ListChangeSetsOutput)
      Log.info { "performing 'ListChangeSets' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListChangeSets")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListChangeSets", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListChangeSetsResult']").not_nil!
      result = ACF::ListChangeSetsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListChangeSetsOutput).new(response, result)
    end

    # Lists all exported output values in the account and Region in which you call this action. Use
    # this action to see the exported output values that you can import into other stacks. To import
    # values, use the [
    # Fn::ImportValue](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/intrinsic-function-reference-importvalue.html)
    # function.
    #
    # For more information, see [Get exported outputs from a deployed CloudFormation
    # stack](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-stack-exports.html).
    def list_exports(input : ACF::ListExportsInput) : Core::ParsedResponse(ACF::ListExportsOutput)
      Log.info { "performing 'ListExports' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListExports")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListExports", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListExportsResult']").not_nil!
      result = ACF::ListExportsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListExportsOutput).new(response, result)
    end

    # Lists your generated templates in this Region.
    def list_generated_templates(input : ACF::ListGeneratedTemplatesInput) : Core::ParsedResponse(ACF::ListGeneratedTemplatesOutput)
      Log.info { "performing 'ListGeneratedTemplates' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListGeneratedTemplates")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListGeneratedTemplates", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListGeneratedTemplatesResult']").not_nil!
      result = ACF::ListGeneratedTemplatesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListGeneratedTemplatesOutput).new(response, result)
    end

    # Returns summaries of invoked Hooks. For more information, see [View invocation summaries for
    # CloudFormation
    # Hooks](https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/hooks-view-invocations.html)
    # in the *CloudFormation Hooks User Guide*.
    #
    # This operation supports the following parameter combinations:
    #
    # - No parameters: Returns all Hook invocation summaries.
    #
    # - `TypeArn` only: Returns summaries for a specific Hook.
    #
    # - `TypeArn` and `Status`: Returns summaries for a specific Hook filtered by status.
    #
    # - `TargetId` and `TargetType`: Returns summaries for a specific Hook invocation target.
    def list_hook_results(input : ACF::ListHookResultsInput) : Core::ParsedResponse(ACF::ListHookResultsOutput)
      Log.info { "performing 'ListHookResults' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListHookResults")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListHookResults", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListHookResultsResult']").not_nil!
      result = ACF::ListHookResultsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListHookResultsOutput).new(response, result)
    end

    # Lists all stacks that are importing an exported output value. To modify or remove an exported
    # output value, first use this action to see which stacks are using it. To see the exported output
    # values in your account, see ListExports.
    #
    # For more information about importing an exported output value, see the
    # [Fn::ImportValue](https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/intrinsic-function-reference-importvalue.html)
    # function.
    def list_imports(input : ACF::ListImportsInput) : Core::ParsedResponse(ACF::ListImportsOutput)
      Log.info { "performing 'ListImports' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListImports")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListImports", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListImportsResult']").not_nil!
      result = ACF::ListImportsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListImportsOutput).new(response, result)
    end

    # Lists the related resources for a list of resources from a resource scan. The response indicates
    # whether each returned resource is already managed by CloudFormation.
    def list_resource_scan_related_resources(input : ACF::ListResourceScanRelatedResourcesInput) : Core::ParsedResponse(ACF::ListResourceScanRelatedResourcesOutput)
      Log.info { "performing 'ListResourceScanRelatedResources' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListResourceScanRelatedResources")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListResourceScanRelatedResources", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListResourceScanRelatedResourcesResult']").not_nil!
      result = ACF::ListResourceScanRelatedResourcesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListResourceScanRelatedResourcesOutput).new(response, result)
    end

    # Lists the resources from a resource scan. The results can be filtered by resource identifier,
    # resource type prefix, tag key, and tag value. Only resources that match all specified filters
    # are returned. The response indicates whether each returned resource is already managed by
    # CloudFormation.
    def list_resource_scan_resources(input : ACF::ListResourceScanResourcesInput) : Core::ParsedResponse(ACF::ListResourceScanResourcesOutput)
      Log.info { "performing 'ListResourceScanResources' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListResourceScanResources")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListResourceScanResources", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListResourceScanResourcesResult']").not_nil!
      result = ACF::ListResourceScanResourcesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListResourceScanResourcesOutput).new(response, result)
    end

    # List the resource scans from newest to oldest. By default it will return up to 10 resource
    # scans.
    def list_resource_scans(input : ACF::ListResourceScansInput) : Core::ParsedResponse(ACF::ListResourceScansOutput)
      Log.info { "performing 'ListResourceScans' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListResourceScans")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListResourceScans", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListResourceScansResult']").not_nil!
      result = ACF::ListResourceScansOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListResourceScansOutput).new(response, result)
    end

    # Returns drift information for resources in a stack instance.
    #
    # `ListStackInstanceResourceDrifts` returns drift information for the most recent drift detection
    # operation. If an operation is in progress, it may only return partial results.
    def list_stack_instance_resource_drifts(input : ACF::ListStackInstanceResourceDriftsInput) : Core::ParsedResponse(ACF::ListStackInstanceResourceDriftsOutput)
      Log.info { "performing 'ListStackInstanceResourceDrifts' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackInstanceResourceDrifts")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackInstanceResourceDrifts", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackInstanceResourceDriftsResult']").not_nil!
      result = ACF::ListStackInstanceResourceDriftsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackInstanceResourceDriftsOutput).new(response, result)
    end

    # Returns summary information about stack instances that are associated with the specified
    # StackSet. You can filter for stack instances that are associated with a specific Amazon Web
    # Services account name or Region, or that have a specific status.
    def list_stack_instances(input : ACF::ListStackInstancesInput) : Core::ParsedResponse(ACF::ListStackInstancesOutput)
      Log.info { "performing 'ListStackInstances' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackInstances")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackInstances", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackInstancesResult']").not_nil!
      result = ACF::ListStackInstancesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackInstancesOutput).new(response, result)
    end

    # Lists the stack refactor actions that will be taken after calling the ExecuteStackRefactor
    # action.
    def list_stack_refactor_actions(input : ACF::ListStackRefactorActionsInput) : Core::ParsedResponse(ACF::ListStackRefactorActionsOutput)
      Log.info { "performing 'ListStackRefactorActions' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackRefactorActions")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackRefactorActions", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackRefactorActionsResult']").not_nil!
      result = ACF::ListStackRefactorActionsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackRefactorActionsOutput).new(response, result)
    end

    # Lists all account stack refactor operations and their statuses.
    def list_stack_refactors(input : ACF::ListStackRefactorsInput) : Core::ParsedResponse(ACF::ListStackRefactorsOutput)
      Log.info { "performing 'ListStackRefactors' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackRefactors")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackRefactors", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackRefactorsResult']").not_nil!
      result = ACF::ListStackRefactorsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackRefactorsOutput).new(response, result)
    end

    # Returns descriptions of all resources of the specified stack.
    #
    # For deleted stacks, ListStackResources returns resource information for up to 90 days after the
    # stack has been deleted.
    def list_stack_resources(input : ACF::ListStackResourcesInput) : Core::ParsedResponse(ACF::ListStackResourcesOutput)
      Log.info { "performing 'ListStackResources' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackResources")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackResources", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackResourcesResult']").not_nil!
      result = ACF::ListStackResourcesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackResourcesOutput).new(response, result)
    end

    # Returns the summary information for stacks whose status matches the specified
    # `StackStatusFilter`. Summary information for stacks that have been deleted is kept for 90 days
    # after the stack is deleted. If no `StackStatusFilter` is specified, summary information for all
    # stacks is returned (including existing stacks and stacks that have been deleted).
    def list_stacks(input : ACF::ListStacksInput) : Core::ParsedResponse(ACF::ListStacksOutput)
      Log.info { "performing 'ListStacks' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStacks")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStacks", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStacksResult']").not_nil!
      result = ACF::ListStacksOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStacksOutput).new(response, result)
    end

    # Returns summary information about deployment targets for a StackSet.
    def list_stack_set_auto_deployment_targets(input : ACF::ListStackSetAutoDeploymentTargetsInput) : Core::ParsedResponse(ACF::ListStackSetAutoDeploymentTargetsOutput)
      Log.info { "performing 'ListStackSetAutoDeploymentTargets' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackSetAutoDeploymentTargets")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackSetAutoDeploymentTargets", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackSetAutoDeploymentTargetsResult']").not_nil!
      result = ACF::ListStackSetAutoDeploymentTargetsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackSetAutoDeploymentTargetsOutput).new(response, result)
    end

    # Returns summary information about the results of a StackSet operation.
    #
    # This API provides *eventually consistent* reads meaning it may take some time but will
    # eventually return the most up-to-date data.
    def list_stack_set_operation_results(input : ACF::ListStackSetOperationResultsInput) : Core::ParsedResponse(ACF::ListStackSetOperationResultsOutput)
      Log.info { "performing 'ListStackSetOperationResults' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackSetOperationResults")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackSetOperationResults", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackSetOperationResultsResult']").not_nil!
      result = ACF::ListStackSetOperationResultsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackSetOperationResultsOutput).new(response, result)
    end

    # Returns summary information about operations performed on a StackSet.
    #
    # This API provides *eventually consistent* reads meaning it may take some time but will
    # eventually return the most up-to-date data.
    def list_stack_set_operations(input : ACF::ListStackSetOperationsInput) : Core::ParsedResponse(ACF::ListStackSetOperationsOutput)
      Log.info { "performing 'ListStackSetOperations' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackSetOperations")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackSetOperations", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackSetOperationsResult']").not_nil!
      result = ACF::ListStackSetOperationsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackSetOperationsOutput).new(response, result)
    end

    # Returns summary information about StackSets that are associated with the user.
    #
    # This API provides *strongly consistent* reads meaning it will always return the most up-to-date
    # data.
    #
    # - [Self-managed permissions] If you set the `CallAs` parameter to `SELF` while signed in to your
    # Amazon Web Services account, `ListStackSets` returns all self-managed StackSets in your Amazon
    # Web Services account.
    #
    # - [Service-managed permissions] If you set the `CallAs` parameter to `SELF` while signed in to
    # the organization's management account, `ListStackSets` returns all StackSets in the management
    # account.
    #
    # - [Service-managed permissions] If you set the `CallAs` parameter to `DELEGATED_ADMIN` while
    # signed in to your member account, `ListStackSets` returns all StackSets with service-managed
    # permissions in the management account.
    def list_stack_sets(input : ACF::ListStackSetsInput) : Core::ParsedResponse(ACF::ListStackSetsOutput)
      Log.info { "performing 'ListStackSets' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListStackSets")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListStackSets", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListStackSetsResult']").not_nil!
      result = ACF::ListStackSetsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListStackSetsOutput).new(response, result)
    end

    # Returns a list of registration tokens for the specified extension(s).
    def list_type_registrations(input : ACF::ListTypeRegistrationsInput) : Core::ParsedResponse(ACF::ListTypeRegistrationsOutput)
      Log.info { "performing 'ListTypeRegistrations' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListTypeRegistrations")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListTypeRegistrations", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListTypeRegistrationsResult']").not_nil!
      result = ACF::ListTypeRegistrationsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListTypeRegistrationsOutput).new(response, result)
    end

    # Returns summary information about all extensions, including your private resource types,
    # modules, and Hooks as well as all public extensions from Amazon Web Services and third-party
    # publishers.
    def list_types(input : ACF::ListTypesInput) : Core::ParsedResponse(ACF::ListTypesOutput)
      Log.info { "performing 'ListTypes' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListTypes")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListTypes", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListTypesResult']").not_nil!
      result = ACF::ListTypesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListTypesOutput).new(response, result)
    end

    # Returns summary information about the versions of an extension.
    def list_type_versions(input : ACF::ListTypeVersionsInput) : Core::ParsedResponse(ACF::ListTypeVersionsOutput)
      Log.info { "performing 'ListTypeVersions' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListTypeVersions")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListTypeVersions", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListTypeVersionsResult']").not_nil!
      result = ACF::ListTypeVersionsOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ListTypeVersionsOutput).new(response, result)
    end

    # Publishes the specified extension to the CloudFormation registry as a public extension in this
    # Region. Public extensions are available for use by all CloudFormation users. For more
    # information about publishing extensions, see [Publishing extensions to make them available for
    # public
    # use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html) in
    # the *CloudFormation Command Line Interface (CLI) User Guide*.
    #
    # To publish an extension, you must be registered as a publisher with CloudFormation. For more
    # information, see
    # [RegisterPublisher](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterPublisher.html).
    def publish_type(input : ACF::PublishTypeInput) : Core::ParsedResponse(ACF::PublishTypeOutput)
      Log.info { "performing 'PublishType' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PublishType")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PublishType", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='PublishTypeResult']").not_nil!
      result = ACF::PublishTypeOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::PublishTypeOutput).new(response, result)
    end

    # Reports progress of a resource handler to CloudFormation.
    #
    # Reserved for use by the [CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/what-is-cloudformation-cli.html).
    # Don't use this API in your code.
    def record_handler_progress(input : ACF::RecordHandlerProgressInput) : Core::ParsedResponse(ACF::RecordHandlerProgressOutput)
      Log.info { "performing 'RecordHandlerProgress' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RecordHandlerProgress")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RecordHandlerProgress", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='RecordHandlerProgressResult']").not_nil!
      result = ACF::RecordHandlerProgressOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::RecordHandlerProgressOutput).new(response, result)
    end

    # Registers your account as a publisher of public extensions in the CloudFormation registry.
    # Public extensions are available for use by all CloudFormation users. This publisher ID applies
    # to your account in all Amazon Web Services Regions.
    #
    # For information about requirements for registering as a public extension publisher, see
    # [Prerequisite: Registering your account to publish CloudFormation
    # extensions](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-prereqs)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    def register_publisher(input : ACF::RegisterPublisherInput) : Core::ParsedResponse(ACF::RegisterPublisherOutput)
      Log.info { "performing 'RegisterPublisher' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RegisterPublisher")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RegisterPublisher", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='RegisterPublisherResult']").not_nil!
      result = ACF::RegisterPublisherOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::RegisterPublisherOutput).new(response, result)
    end

    # Registers an extension with the CloudFormation service. Registering an extension makes it
    # available for use in CloudFormation templates in your Amazon Web Services account, and includes:
    #
    # - Validating the extension schema.
    #
    # - Determining which handlers, if any, have been specified for the extension.
    #
    # - Making the extension available for use in your account.
    #
    # For more information about how to develop extensions and ready them for registration, see
    # [Creating resource types using the CloudFormation
    # CLI](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-types.html) in the
    # *CloudFormation Command Line Interface (CLI) User Guide*.
    #
    # You can have a maximum of 50 resource extension versions registered at a time. This maximum is
    # per account and per Region. Use
    # [DeregisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DeregisterType.html)
    # to deregister specific extension versions if necessary.
    #
    # Once you have initiated a registration request using RegisterType, you can use
    # DescribeTypeRegistration to monitor the progress of the registration request.
    #
    # Once you have registered a private extension in your account and Region, use
    # [SetTypeConfiguration](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_SetTypeConfiguration.html)
    # to specify configuration properties for the extension. For more information, see [Edit
    # configuration data for extensions in your
    # account](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html)
    # in the *CloudFormation User Guide*.
    def register_type(input : ACF::RegisterTypeInput) : Core::ParsedResponse(ACF::RegisterTypeOutput)
      Log.info { "performing 'RegisterType' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RegisterType")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RegisterType", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='RegisterTypeResult']").not_nil!
      result = ACF::RegisterTypeOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::RegisterTypeOutput).new(response, result)
    end

    # When specifying `RollbackStack`, you preserve the state of previously provisioned resources when
    # an operation fails. You can check the status of the stack through the DescribeStacks operation.
    #
    # Rolls back the specified stack to the last known stable state from `CREATE_FAILED` or
    # `UPDATE_FAILED` stack statuses.
    #
    # This operation will delete a stack if it doesn't contain a last known stable state. A last known
    # stable state includes any status in a `*_COMPLETE`. This includes the following stack statuses.
    #
    # - `CREATE_COMPLETE`
    #
    # - `UPDATE_COMPLETE`
    #
    # - `UPDATE_ROLLBACK_COMPLETE`
    #
    # - `IMPORT_COMPLETE`
    #
    # - `IMPORT_ROLLBACK_COMPLETE`
    def rollback_stack(input : ACF::RollbackStackInput) : Core::ParsedResponse(ACF::RollbackStackOutput)
      Log.info { "performing 'RollbackStack' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RollbackStack")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RollbackStack", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='RollbackStackResult']").not_nil!
      result = ACF::RollbackStackOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::RollbackStackOutput).new(response, result)
    end

    # Sets a stack policy for a specified stack.
    def set_stack_policy(input : ACF::SetStackPolicyInput) : Core::Response
      Log.info { "performing 'SetStackPolicy' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetStackPolicy")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetStackPolicy", body)
      Core::Response.new(response)
    end

    # Specifies the configuration data for a CloudFormation extension, such as a resource or Hook, in
    # the given account and Region.
    #
    # For more information, see [Edit configuration data for extensions in your
    # account](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/registry-set-configuration.html)
    # in the *CloudFormation User Guide*.
    #
    # To view the current configuration data for an extension, refer to the `ConfigurationSchema`
    # element of
    # [DescribeType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html).
    #
    # It's strongly recommended that you use dynamic references to restrict sensitive configuration
    # definitions, such as third-party credentials. For more information, see [Specify values stored
    # in other services using dynamic
    # references](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/dynamic-references.html)
    # in the *CloudFormation User Guide*.
    #
    # For more information about setting the configuration data for resource types, see [Defining the
    # account-level configuration of an
    # extension](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-model.html#resource-type-howto-configuration)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*. For more information about
    # setting the configuration data for Hooks, see the [CloudFormation Hooks User
    # Guide](https://docs.aws.amazon.com/cloudformation-cli/latest/hooks-userguide/what-is-cloudformation-hooks.html).
    def set_type_configuration(input : ACF::SetTypeConfigurationInput) : Core::ParsedResponse(ACF::SetTypeConfigurationOutput)
      Log.info { "performing 'SetTypeConfiguration' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetTypeConfiguration")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetTypeConfiguration", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='SetTypeConfigurationResult']").not_nil!
      result = ACF::SetTypeConfigurationOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::SetTypeConfigurationOutput).new(response, result)
    end

    # Specify the default version of an extension. The default version of an extension will be used in
    # CloudFormation operations.
    def set_type_default_version(input : ACF::SetTypeDefaultVersionInput) : Core::ParsedResponse(ACF::SetTypeDefaultVersionOutput)
      Log.info { "performing 'SetTypeDefaultVersion' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetTypeDefaultVersion")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetTypeDefaultVersion", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='SetTypeDefaultVersionResult']").not_nil!
      result = ACF::SetTypeDefaultVersionOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::SetTypeDefaultVersionOutput).new(response, result)
    end

    # Sends a signal to the specified resource with a success or failure status. You can use the
    # `SignalResource` operation in conjunction with a creation policy or update policy.
    # CloudFormation doesn't proceed with a stack creation or update until resources receive the
    # required number of signals or the timeout period is exceeded. The `SignalResource` operation is
    # useful in cases where you want to send signals from anywhere other than an Amazon EC2 instance.
    def signal_resource(input : ACF::SignalResourceInput) : Core::Response
      Log.info { "performing 'SignalResource' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SignalResource")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SignalResource", body)
      Core::Response.new(response)
    end

    # Starts a scan of the resources in this account in this Region. You can the status of a scan
    # using the `ListResourceScans` API action.
    def start_resource_scan(input : ACF::StartResourceScanInput) : Core::ParsedResponse(ACF::StartResourceScanOutput)
      Log.info { "performing 'StartResourceScan' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "StartResourceScan")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("StartResourceScan", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='StartResourceScanResult']").not_nil!
      result = ACF::StartResourceScanOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::StartResourceScanOutput).new(response, result)
    end

    # Stops an in-progress operation on a StackSet and its associated stack instances. StackSets will
    # cancel all the unstarted stack instance deployments and wait for those are in-progress to
    # complete.
    def stop_stack_set_operation(input : ACF::StopStackSetOperationInput) : Core::ParsedResponse(ACF::StopStackSetOperationOutput)
      Log.info { "performing 'StopStackSetOperation' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "StopStackSetOperation")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("StopStackSetOperation", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='StopStackSetOperationResult']").not_nil!
      result = ACF::StopStackSetOperationOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::StopStackSetOperationOutput).new(response, result)
    end

    # Tests a registered extension to make sure it meets all necessary requirements for being
    # published in the CloudFormation registry.
    #
    # - For resource types, this includes passing all contracts tests defined for the type.
    #
    # - For modules, this includes determining if the module's model meets all necessary requirements.
    #
    # For more information, see [Testing your public extension before
    # publishing](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/publish-extension.html#publish-extension-testing)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    #
    # If you don't specify a version, CloudFormation uses the default version of the extension in your
    # account and Region for testing.
    #
    # To perform testing, CloudFormation assumes the execution role specified when the type was
    # registered. For more information, see
    # [RegisterType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_RegisterType.html).
    #
    # Once you've initiated testing on an extension using `TestType`, you can pass the returned
    # `TypeVersionArn` into
    # [DescribeType](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_DescribeType.html)
    # to monitor the current test status and test status description for the extension.
    #
    # An extension must have a test status of `PASSED` before it can be published. For more
    # information, see [Publishing extensions to make them available for public
    # use](https://docs.aws.amazon.com/cloudformation-cli/latest/userguide/resource-type-publish.html)
    # in the *CloudFormation Command Line Interface (CLI) User Guide*.
    def test_type(input : ACF::TestTypeInput) : Core::ParsedResponse(ACF::TestTypeOutput)
      Log.info { "performing 'TestType' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TestType")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TestType", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='TestTypeResult']").not_nil!
      result = ACF::TestTypeOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::TestTypeOutput).new(response, result)
    end

    # Updates a generated template. This can be used to change the name, add and remove resources,
    # refresh resources, and change the `DeletionPolicy` and `UpdateReplacePolicy` settings. You can
    # check the status of the update to the generated template using the `DescribeGeneratedTemplate`
    # API action.
    def update_generated_template(input : ACF::UpdateGeneratedTemplateInput) : Core::ParsedResponse(ACF::UpdateGeneratedTemplateOutput)
      Log.info { "performing 'UpdateGeneratedTemplate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateGeneratedTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateGeneratedTemplate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateGeneratedTemplateResult']").not_nil!
      result = ACF::UpdateGeneratedTemplateOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::UpdateGeneratedTemplateOutput).new(response, result)
    end

    # Updates a stack as specified in the template. After the call completes successfully, the stack
    # update starts. You can check the status of the stack through the DescribeStacks action.
    #
    # To get a copy of the template for an existing stack, you can use the GetTemplate action.
    #
    # For more information about updating a stack and monitoring the progress of the update, see
    # [Managing Amazon Web Services resources as a single unit with CloudFormation
    # stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/stacks.html) in the
    # *CloudFormation User Guide*.
    def update_stack(input : ACF::UpdateStackInput) : Core::ParsedResponse(ACF::UpdateStackOutput)
      Log.info { "performing 'UpdateStack' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateStack")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateStack", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateStackResult']").not_nil!
      result = ACF::UpdateStackOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::UpdateStackOutput).new(response, result)
    end

    # Updates the parameter values for stack instances for the specified accounts, within the
    # specified Amazon Web Services Regions. A stack instance refers to a stack in a specific account
    # and Region.
    #
    # You can only update stack instances in Amazon Web Services Regions and accounts where they
    # already exist; to create additional stack instances, use
    # [CreateStackInstances](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_CreateStackInstances.html).
    #
    # During StackSet updates, any parameters overridden for a stack instance aren't updated, but
    # retain their overridden value.
    #
    # You can only update the parameter *values* that are specified in the StackSet. To add or delete
    # a parameter itself, use
    # [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html)
    # to update the StackSet template. If you add a parameter to a template, before you can override
    # the parameter value specified in the StackSet you must first use
    # [UpdateStackSet](https://docs.aws.amazon.com/AWSCloudFormation/latest/APIReference/API_UpdateStackSet.html)
    # to update all stack instances with the updated template and parameter value specified in the
    # StackSet. Once a stack instance has been updated with the new parameter, you can then override
    # the parameter value using `UpdateStackInstances`.
    #
    # The maximum number of organizational unit (OUs) supported by a `UpdateStackInstances` operation
    # is 50.
    #
    # If you need more than 50, consider the following options:
    #
    # - *Batch processing:* If you don't want to expose your OU hierarchy, split up the operations
    # into multiple calls with less than 50 OUs each.
    #
    # - *Parent OU strategy:* If you don't mind exposing the OU hierarchy, target a parent OU that
    # contains all desired child OUs.
    def update_stack_instances(input : ACF::UpdateStackInstancesInput) : Core::ParsedResponse(ACF::UpdateStackInstancesOutput)
      Log.info { "performing 'UpdateStackInstances' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateStackInstances")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateStackInstances", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateStackInstancesResult']").not_nil!
      result = ACF::UpdateStackInstancesOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::UpdateStackInstancesOutput).new(response, result)
    end

    # Updates the StackSet and associated stack instances in the specified accounts and Amazon Web
    # Services Regions.
    #
    # Even if the StackSet operation created by updating the StackSet fails (completely or partially,
    # below or above a specified failure tolerance), the StackSet is updated with your changes.
    # Subsequent CreateStackInstances calls on the specified StackSet use the updated StackSet.
    #
    # The maximum number of organizational unit (OUs) supported by a `UpdateStackSet` operation is 50.
    #
    # If you need more than 50, consider the following options:
    #
    # - *Batch processing:* If you don't want to expose your OU hierarchy, split up the operations
    # into multiple calls with less than 50 OUs each.
    #
    # - *Parent OU strategy:* If you don't mind exposing the OU hierarchy, target a parent OU that
    # contains all desired child OUs.
    def update_stack_set(input : ACF::UpdateStackSetInput) : Core::ParsedResponse(ACF::UpdateStackSetOutput)
      Log.info { "performing 'UpdateStackSet' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateStackSet")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateStackSet", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateStackSetResult']").not_nil!
      result = ACF::UpdateStackSetOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::UpdateStackSetOutput).new(response, result)
    end

    # Updates termination protection for the specified stack. If a user attempts to delete a stack
    # with termination protection enabled, the operation fails and the stack remains unchanged. For
    # more information, see [Protect a CloudFormation stack from being
    # deleted](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-protect-stacks.html)
    # in the *CloudFormation User Guide*.
    #
    # For [nested
    # stacks](https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/using-cfn-nested-stacks.html),
    # termination protection is set on the root stack and can't be changed directly on the nested
    # stack.
    def update_termination_protection(input : ACF::UpdateTerminationProtectionInput) : Core::ParsedResponse(ACF::UpdateTerminationProtectionOutput)
      Log.info { "performing 'UpdateTerminationProtection' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UpdateTerminationProtection")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UpdateTerminationProtection", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UpdateTerminationProtectionResult']").not_nil!
      result = ACF::UpdateTerminationProtectionOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::UpdateTerminationProtectionOutput).new(response, result)
    end

    # Validates a specified template. CloudFormation first checks if the template is valid JSON. If it
    # isn't, CloudFormation checks if the template is valid YAML. If both these checks fail,
    # CloudFormation returns a template validation error.
    def validate_template(input : ACF::ValidateTemplateInput) : Core::ParsedResponse(ACF::ValidateTemplateOutput)
      Log.info { "performing 'ValidateTemplate' operation" }
      input.validate! if config.validate_input?
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ValidateTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ValidateTemplate", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ValidateTemplateResult']").not_nil!
      result = ACF::ValidateTemplateOutput.from_xml(result_node)
      Core::ParsedResponse(ACF::ValidateTemplateOutput).new(response, result)
    end
  end
end
