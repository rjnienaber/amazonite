private alias ACF = Amazonite::CloudFormationV1
private alias Core = Amazonite::Core

module Amazonite::CloudFormationV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.cloudformation_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("CloudFormation", "cloudformation", "1.0", EXCEPTION_FACTORY, config)
    end

    def activate_organizations_access(input : ACF::ActivateOrganizationsAccessInput) : Core::ParsedResponse(ACF::ActivateOrganizationsAccessOutput)
      Log.info { "performing 'ActivateOrganizationsAccess' operation" }
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

    def activate_type(input : ACF::ActivateTypeInput) : Core::ParsedResponse(ACF::ActivateTypeOutput)
      Log.info { "performing 'ActivateType' operation" }
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

    def batch_describe_type_configurations(input : ACF::BatchDescribeTypeConfigurationsInput) : Core::ParsedResponse(ACF::BatchDescribeTypeConfigurationsOutput)
      Log.info { "performing 'BatchDescribeTypeConfigurations' operation" }
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

    def cancel_update_stack(input : ACF::CancelUpdateStackInput) : Core::Response
      Log.info { "performing 'CancelUpdateStack' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CancelUpdateStack")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CancelUpdateStack", body)
      Core::Response.new(response)
    end

    def continue_update_rollback(input : ACF::ContinueUpdateRollbackInput) : Core::ParsedResponse(ACF::ContinueUpdateRollbackOutput)
      Log.info { "performing 'ContinueUpdateRollback' operation" }
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

    def create_change_set(input : ACF::CreateChangeSetInput) : Core::ParsedResponse(ACF::CreateChangeSetOutput)
      Log.info { "performing 'CreateChangeSet' operation" }
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

    def create_generated_template(input : ACF::CreateGeneratedTemplateInput) : Core::ParsedResponse(ACF::CreateGeneratedTemplateOutput)
      Log.info { "performing 'CreateGeneratedTemplate' operation" }
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

    def create_stack(input : ACF::CreateStackInput) : Core::ParsedResponse(ACF::CreateStackOutput)
      Log.info { "performing 'CreateStack' operation" }
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

    def create_stack_instances(input : ACF::CreateStackInstancesInput) : Core::ParsedResponse(ACF::CreateStackInstancesOutput)
      Log.info { "performing 'CreateStackInstances' operation" }
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

    def create_stack_refactor(input : ACF::CreateStackRefactorInput) : Core::ParsedResponse(ACF::CreateStackRefactorOutput)
      Log.info { "performing 'CreateStackRefactor' operation" }
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

    def create_stack_set(input : ACF::CreateStackSetInput) : Core::ParsedResponse(ACF::CreateStackSetOutput)
      Log.info { "performing 'CreateStackSet' operation" }
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

    def deactivate_organizations_access(input : ACF::DeactivateOrganizationsAccessInput) : Core::ParsedResponse(ACF::DeactivateOrganizationsAccessOutput)
      Log.info { "performing 'DeactivateOrganizationsAccess' operation" }
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

    def deactivate_type(input : ACF::DeactivateTypeInput) : Core::ParsedResponse(ACF::DeactivateTypeOutput)
      Log.info { "performing 'DeactivateType' operation" }
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

    def delete_change_set(input : ACF::DeleteChangeSetInput) : Core::ParsedResponse(ACF::DeleteChangeSetOutput)
      Log.info { "performing 'DeleteChangeSet' operation" }
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

    def delete_generated_template(input : ACF::DeleteGeneratedTemplateInput) : Core::Response
      Log.info { "performing 'DeleteGeneratedTemplate' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteGeneratedTemplate")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteGeneratedTemplate", body)
      Core::Response.new(response)
    end

    def delete_stack(input : ACF::DeleteStackInput) : Core::Response
      Log.info { "performing 'DeleteStack' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteStack")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteStack", body)
      Core::Response.new(response)
    end

    def delete_stack_instances(input : ACF::DeleteStackInstancesInput) : Core::ParsedResponse(ACF::DeleteStackInstancesOutput)
      Log.info { "performing 'DeleteStackInstances' operation" }
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

    def delete_stack_set(input : ACF::DeleteStackSetInput) : Core::ParsedResponse(ACF::DeleteStackSetOutput)
      Log.info { "performing 'DeleteStackSet' operation" }
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

    def deregister_type(input : ACF::DeregisterTypeInput) : Core::ParsedResponse(ACF::DeregisterTypeOutput)
      Log.info { "performing 'DeregisterType' operation" }
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

    def describe_account_limits(input : ACF::DescribeAccountLimitsInput) : Core::ParsedResponse(ACF::DescribeAccountLimitsOutput)
      Log.info { "performing 'DescribeAccountLimits' operation" }
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

    def describe_change_set(input : ACF::DescribeChangeSetInput) : Core::ParsedResponse(ACF::DescribeChangeSetOutput)
      Log.info { "performing 'DescribeChangeSet' operation" }
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

    def describe_change_set_hooks(input : ACF::DescribeChangeSetHooksInput) : Core::ParsedResponse(ACF::DescribeChangeSetHooksOutput)
      Log.info { "performing 'DescribeChangeSetHooks' operation" }
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

    def describe_events(input : ACF::DescribeEventsInput) : Core::ParsedResponse(ACF::DescribeEventsOutput)
      Log.info { "performing 'DescribeEvents' operation" }
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

    def describe_generated_template(input : ACF::DescribeGeneratedTemplateInput) : Core::ParsedResponse(ACF::DescribeGeneratedTemplateOutput)
      Log.info { "performing 'DescribeGeneratedTemplate' operation" }
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

    def describe_organizations_access(input : ACF::DescribeOrganizationsAccessInput) : Core::ParsedResponse(ACF::DescribeOrganizationsAccessOutput)
      Log.info { "performing 'DescribeOrganizationsAccess' operation" }
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

    def describe_publisher(input : ACF::DescribePublisherInput) : Core::ParsedResponse(ACF::DescribePublisherOutput)
      Log.info { "performing 'DescribePublisher' operation" }
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

    def describe_resource_scan(input : ACF::DescribeResourceScanInput) : Core::ParsedResponse(ACF::DescribeResourceScanOutput)
      Log.info { "performing 'DescribeResourceScan' operation" }
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

    def describe_stack_drift_detection_status(input : ACF::DescribeStackDriftDetectionStatusInput) : Core::ParsedResponse(ACF::DescribeStackDriftDetectionStatusOutput)
      Log.info { "performing 'DescribeStackDriftDetectionStatus' operation" }
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

    def describe_stack_events(input : ACF::DescribeStackEventsInput) : Core::ParsedResponse(ACF::DescribeStackEventsOutput)
      Log.info { "performing 'DescribeStackEvents' operation" }
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

    def describe_stack_instance(input : ACF::DescribeStackInstanceInput) : Core::ParsedResponse(ACF::DescribeStackInstanceOutput)
      Log.info { "performing 'DescribeStackInstance' operation" }
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

    def describe_stack_refactor(input : ACF::DescribeStackRefactorInput) : Core::ParsedResponse(ACF::DescribeStackRefactorOutput)
      Log.info { "performing 'DescribeStackRefactor' operation" }
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

    def describe_stack_resource(input : ACF::DescribeStackResourceInput) : Core::ParsedResponse(ACF::DescribeStackResourceOutput)
      Log.info { "performing 'DescribeStackResource' operation" }
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

    def describe_stack_resource_drifts(input : ACF::DescribeStackResourceDriftsInput) : Core::ParsedResponse(ACF::DescribeStackResourceDriftsOutput)
      Log.info { "performing 'DescribeStackResourceDrifts' operation" }
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

    def describe_stack_resources(input : ACF::DescribeStackResourcesInput) : Core::ParsedResponse(ACF::DescribeStackResourcesOutput)
      Log.info { "performing 'DescribeStackResources' operation" }
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

    def describe_stacks(input : ACF::DescribeStacksInput) : Core::ParsedResponse(ACF::DescribeStacksOutput)
      Log.info { "performing 'DescribeStacks' operation" }
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

    def describe_stack_set(input : ACF::DescribeStackSetInput) : Core::ParsedResponse(ACF::DescribeStackSetOutput)
      Log.info { "performing 'DescribeStackSet' operation" }
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

    def describe_stack_set_operation(input : ACF::DescribeStackSetOperationInput) : Core::ParsedResponse(ACF::DescribeStackSetOperationOutput)
      Log.info { "performing 'DescribeStackSetOperation' operation" }
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

    def describe_type(input : ACF::DescribeTypeInput) : Core::ParsedResponse(ACF::DescribeTypeOutput)
      Log.info { "performing 'DescribeType' operation" }
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

    def describe_type_registration(input : ACF::DescribeTypeRegistrationInput) : Core::ParsedResponse(ACF::DescribeTypeRegistrationOutput)
      Log.info { "performing 'DescribeTypeRegistration' operation" }
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

    def detect_stack_drift(input : ACF::DetectStackDriftInput) : Core::ParsedResponse(ACF::DetectStackDriftOutput)
      Log.info { "performing 'DetectStackDrift' operation" }
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

    def detect_stack_resource_drift(input : ACF::DetectStackResourceDriftInput) : Core::ParsedResponse(ACF::DetectStackResourceDriftOutput)
      Log.info { "performing 'DetectStackResourceDrift' operation" }
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

    def detect_stack_set_drift(input : ACF::DetectStackSetDriftInput) : Core::ParsedResponse(ACF::DetectStackSetDriftOutput)
      Log.info { "performing 'DetectStackSetDrift' operation" }
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

    def estimate_template_cost(input : ACF::EstimateTemplateCostInput) : Core::ParsedResponse(ACF::EstimateTemplateCostOutput)
      Log.info { "performing 'EstimateTemplateCost' operation" }
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

    def execute_change_set(input : ACF::ExecuteChangeSetInput) : Core::ParsedResponse(ACF::ExecuteChangeSetOutput)
      Log.info { "performing 'ExecuteChangeSet' operation" }
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

    def execute_stack_refactor(input : ACF::ExecuteStackRefactorInput) : Core::Response
      Log.info { "performing 'ExecuteStackRefactor' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ExecuteStackRefactor")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ExecuteStackRefactor", body)
      Core::Response.new(response)
    end

    def get_generated_template(input : ACF::GetGeneratedTemplateInput) : Core::ParsedResponse(ACF::GetGeneratedTemplateOutput)
      Log.info { "performing 'GetGeneratedTemplate' operation" }
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

    def get_hook_result(input : ACF::GetHookResultInput) : Core::ParsedResponse(ACF::GetHookResultOutput)
      Log.info { "performing 'GetHookResult' operation" }
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

    def get_stack_policy(input : ACF::GetStackPolicyInput) : Core::ParsedResponse(ACF::GetStackPolicyOutput)
      Log.info { "performing 'GetStackPolicy' operation" }
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

    def get_template(input : ACF::GetTemplateInput) : Core::ParsedResponse(ACF::GetTemplateOutput)
      Log.info { "performing 'GetTemplate' operation" }
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

    def get_template_summary(input : ACF::GetTemplateSummaryInput) : Core::ParsedResponse(ACF::GetTemplateSummaryOutput)
      Log.info { "performing 'GetTemplateSummary' operation" }
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

    def import_stacks_to_stack_set(input : ACF::ImportStacksToStackSetInput) : Core::ParsedResponse(ACF::ImportStacksToStackSetOutput)
      Log.info { "performing 'ImportStacksToStackSet' operation" }
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

    def list_change_sets(input : ACF::ListChangeSetsInput) : Core::ParsedResponse(ACF::ListChangeSetsOutput)
      Log.info { "performing 'ListChangeSets' operation" }
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

    def list_exports(input : ACF::ListExportsInput) : Core::ParsedResponse(ACF::ListExportsOutput)
      Log.info { "performing 'ListExports' operation" }
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

    def list_generated_templates(input : ACF::ListGeneratedTemplatesInput) : Core::ParsedResponse(ACF::ListGeneratedTemplatesOutput)
      Log.info { "performing 'ListGeneratedTemplates' operation" }
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

    def list_hook_results(input : ACF::ListHookResultsInput) : Core::ParsedResponse(ACF::ListHookResultsOutput)
      Log.info { "performing 'ListHookResults' operation" }
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

    def list_imports(input : ACF::ListImportsInput) : Core::ParsedResponse(ACF::ListImportsOutput)
      Log.info { "performing 'ListImports' operation" }
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

    def list_resource_scan_related_resources(input : ACF::ListResourceScanRelatedResourcesInput) : Core::ParsedResponse(ACF::ListResourceScanRelatedResourcesOutput)
      Log.info { "performing 'ListResourceScanRelatedResources' operation" }
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

    def list_resource_scan_resources(input : ACF::ListResourceScanResourcesInput) : Core::ParsedResponse(ACF::ListResourceScanResourcesOutput)
      Log.info { "performing 'ListResourceScanResources' operation" }
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

    def list_resource_scans(input : ACF::ListResourceScansInput) : Core::ParsedResponse(ACF::ListResourceScansOutput)
      Log.info { "performing 'ListResourceScans' operation" }
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

    def list_stack_instance_resource_drifts(input : ACF::ListStackInstanceResourceDriftsInput) : Core::ParsedResponse(ACF::ListStackInstanceResourceDriftsOutput)
      Log.info { "performing 'ListStackInstanceResourceDrifts' operation" }
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

    def list_stack_instances(input : ACF::ListStackInstancesInput) : Core::ParsedResponse(ACF::ListStackInstancesOutput)
      Log.info { "performing 'ListStackInstances' operation" }
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

    def list_stack_refactor_actions(input : ACF::ListStackRefactorActionsInput) : Core::ParsedResponse(ACF::ListStackRefactorActionsOutput)
      Log.info { "performing 'ListStackRefactorActions' operation" }
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

    def list_stack_refactors(input : ACF::ListStackRefactorsInput) : Core::ParsedResponse(ACF::ListStackRefactorsOutput)
      Log.info { "performing 'ListStackRefactors' operation" }
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

    def list_stack_resources(input : ACF::ListStackResourcesInput) : Core::ParsedResponse(ACF::ListStackResourcesOutput)
      Log.info { "performing 'ListStackResources' operation" }
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

    def list_stacks(input : ACF::ListStacksInput) : Core::ParsedResponse(ACF::ListStacksOutput)
      Log.info { "performing 'ListStacks' operation" }
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

    def list_stack_set_auto_deployment_targets(input : ACF::ListStackSetAutoDeploymentTargetsInput) : Core::ParsedResponse(ACF::ListStackSetAutoDeploymentTargetsOutput)
      Log.info { "performing 'ListStackSetAutoDeploymentTargets' operation" }
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

    def list_stack_set_operation_results(input : ACF::ListStackSetOperationResultsInput) : Core::ParsedResponse(ACF::ListStackSetOperationResultsOutput)
      Log.info { "performing 'ListStackSetOperationResults' operation" }
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

    def list_stack_set_operations(input : ACF::ListStackSetOperationsInput) : Core::ParsedResponse(ACF::ListStackSetOperationsOutput)
      Log.info { "performing 'ListStackSetOperations' operation" }
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

    def list_stack_sets(input : ACF::ListStackSetsInput) : Core::ParsedResponse(ACF::ListStackSetsOutput)
      Log.info { "performing 'ListStackSets' operation" }
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

    def list_type_registrations(input : ACF::ListTypeRegistrationsInput) : Core::ParsedResponse(ACF::ListTypeRegistrationsOutput)
      Log.info { "performing 'ListTypeRegistrations' operation" }
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

    def list_types(input : ACF::ListTypesInput) : Core::ParsedResponse(ACF::ListTypesOutput)
      Log.info { "performing 'ListTypes' operation" }
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

    def list_type_versions(input : ACF::ListTypeVersionsInput) : Core::ParsedResponse(ACF::ListTypeVersionsOutput)
      Log.info { "performing 'ListTypeVersions' operation" }
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

    def publish_type(input : ACF::PublishTypeInput) : Core::ParsedResponse(ACF::PublishTypeOutput)
      Log.info { "performing 'PublishType' operation" }
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

    def record_handler_progress(input : ACF::RecordHandlerProgressInput) : Core::ParsedResponse(ACF::RecordHandlerProgressOutput)
      Log.info { "performing 'RecordHandlerProgress' operation" }
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

    def register_publisher(input : ACF::RegisterPublisherInput) : Core::ParsedResponse(ACF::RegisterPublisherOutput)
      Log.info { "performing 'RegisterPublisher' operation" }
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

    def register_type(input : ACF::RegisterTypeInput) : Core::ParsedResponse(ACF::RegisterTypeOutput)
      Log.info { "performing 'RegisterType' operation" }
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

    def rollback_stack(input : ACF::RollbackStackInput) : Core::ParsedResponse(ACF::RollbackStackOutput)
      Log.info { "performing 'RollbackStack' operation" }
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

    def set_stack_policy(input : ACF::SetStackPolicyInput) : Core::Response
      Log.info { "performing 'SetStackPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetStackPolicy")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetStackPolicy", body)
      Core::Response.new(response)
    end

    def set_type_configuration(input : ACF::SetTypeConfigurationInput) : Core::ParsedResponse(ACF::SetTypeConfigurationOutput)
      Log.info { "performing 'SetTypeConfiguration' operation" }
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

    def set_type_default_version(input : ACF::SetTypeDefaultVersionInput) : Core::ParsedResponse(ACF::SetTypeDefaultVersionOutput)
      Log.info { "performing 'SetTypeDefaultVersion' operation" }
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

    def signal_resource(input : ACF::SignalResourceInput) : Core::Response
      Log.info { "performing 'SignalResource' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SignalResource")
        form.add("Version", "2010-05-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SignalResource", body)
      Core::Response.new(response)
    end

    def start_resource_scan(input : ACF::StartResourceScanInput) : Core::ParsedResponse(ACF::StartResourceScanOutput)
      Log.info { "performing 'StartResourceScan' operation" }
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

    def stop_stack_set_operation(input : ACF::StopStackSetOperationInput) : Core::ParsedResponse(ACF::StopStackSetOperationOutput)
      Log.info { "performing 'StopStackSetOperation' operation" }
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

    def test_type(input : ACF::TestTypeInput) : Core::ParsedResponse(ACF::TestTypeOutput)
      Log.info { "performing 'TestType' operation" }
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

    def update_generated_template(input : ACF::UpdateGeneratedTemplateInput) : Core::ParsedResponse(ACF::UpdateGeneratedTemplateOutput)
      Log.info { "performing 'UpdateGeneratedTemplate' operation" }
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

    def update_stack(input : ACF::UpdateStackInput) : Core::ParsedResponse(ACF::UpdateStackOutput)
      Log.info { "performing 'UpdateStack' operation" }
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

    def update_stack_instances(input : ACF::UpdateStackInstancesInput) : Core::ParsedResponse(ACF::UpdateStackInstancesOutput)
      Log.info { "performing 'UpdateStackInstances' operation" }
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

    def update_stack_set(input : ACF::UpdateStackSetInput) : Core::ParsedResponse(ACF::UpdateStackSetOutput)
      Log.info { "performing 'UpdateStackSet' operation" }
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

    def update_termination_protection(input : ACF::UpdateTerminationProtectionInput) : Core::ParsedResponse(ACF::UpdateTerminationProtectionOutput)
      Log.info { "performing 'UpdateTerminationProtection' operation" }
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

    def validate_template(input : ACF::ValidateTemplateInput) : Core::ParsedResponse(ACF::ValidateTemplateOutput)
      Log.info { "performing 'ValidateTemplate' operation" }
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
