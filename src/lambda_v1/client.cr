private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.lambda_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AWSGirApiService", "lambda", "1.0", EXCEPTION_FACTORY, config)
    end

    def delete_function(input : AL::DeleteFunctionRequest) : Core::ParsedResponse(AL::DeleteFunctionResponse)
      Log.info { "performing 'DeleteFunction' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("DeleteFunction", "DELETE", path, headers, nil)
      result = AL::DeleteFunctionResponse.new(
        status_code: response.status_code,
      )
      Core::ParsedResponse(AL::DeleteFunctionResponse).new(response, result)
    end

    def delete_function_event_invoke_config(input : AL::DeleteFunctionEventInvokeConfigRequest) : Core::Response
      Log.info { "performing 'DeleteFunctionEventInvokeConfig' operation" }
      path = "/2019-09-25/functions/#{URI.encode_path_segment(input.function_name)}/event-invoke-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("DeleteFunctionEventInvokeConfig", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def delete_resource_policy(input : AL::DeleteResourcePolicyRequest) : Core::Response
      Log.info { "performing 'DeleteResourcePolicy' operation" }
      path = "/2026-07-09/resource-policy/#{URI.encode_path_segment(input.resource_arn)}"
      query = URI::Params.build do |form|
        if value = input.revision_id
          form.add("RevisionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("DeleteResourcePolicy", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def get_account_settings(input : AL::GetAccountSettingsRequest) : Core::ParsedResponse(AL::GetAccountSettingsResponse)
      Log.info { "performing 'GetAccountSettings' operation" }
      path = "/2016-08-19/account-settings"
      headers = HTTP::Headers.new
      response = rest_request("GetAccountSettings", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetAccountSettingsResponse).new(response)
    end

    def get_function_event_invoke_config(input : AL::GetFunctionEventInvokeConfigRequest) : Core::ParsedResponse(AL::FunctionEventInvokeConfig)
      Log.info { "performing 'GetFunctionEventInvokeConfig' operation" }
      path = "/2019-09-25/functions/#{URI.encode_path_segment(input.function_name)}/event-invoke-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionEventInvokeConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::FunctionEventInvokeConfig).new(response)
    end

    def get_resource_policy(input : AL::GetResourcePolicyRequest) : Core::ParsedResponse(AL::GetResourcePolicyResponse)
      Log.info { "performing 'GetResourcePolicy' operation" }
      path = "/2026-07-09/resource-policy/#{URI.encode_path_segment(input.resource_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("GetResourcePolicy", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetResourcePolicyResponse).new(response)
    end

    def list_function_event_invoke_configs(input : AL::ListFunctionEventInvokeConfigsRequest) : Core::ParsedResponse(AL::ListFunctionEventInvokeConfigsResponse)
      Log.info { "performing 'ListFunctionEventInvokeConfigs' operation" }
      path = "/2019-09-25/functions/#{URI.encode_path_segment(input.function_name)}/event-invoke-config/list"
      query = URI::Params.build do |form|
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListFunctionEventInvokeConfigs", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListFunctionEventInvokeConfigsResponse).new(response)
    end

    def list_tags(input : AL::ListTagsRequest) : Core::ParsedResponse(AL::ListTagsResponse)
      Log.info { "performing 'ListTags' operation" }
      path = "/2017-03-31/tags/#{URI.encode_path_segment(input.resource)}"
      headers = HTTP::Headers.new
      response = rest_request("ListTags", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListTagsResponse).new(response)
    end

    def put_function_event_invoke_config(input : AL::PutFunctionEventInvokeConfigRequest) : Core::ParsedResponse(AL::FunctionEventInvokeConfig)
      Log.info { "performing 'PutFunctionEventInvokeConfig' operation" }
      path = "/2019-09-25/functions/#{URI.encode_path_segment(input.function_name)}/event-invoke-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionEventInvokeConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionEventInvokeConfig).new(response)
    end

    def put_resource_policy(input : AL::PutResourcePolicyRequest) : Core::ParsedResponse(AL::PutResourcePolicyResponse)
      Log.info { "performing 'PutResourcePolicy' operation" }
      path = "/2026-07-09/resource-policy/#{URI.encode_path_segment(input.resource_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("PutResourcePolicy", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutResourcePolicyResponse).new(response)
    end

    def send_durable_execution_callback_failure(input : AL::SendDurableExecutionCallbackFailureRequest) : Core::ParsedResponse(AL::SendDurableExecutionCallbackFailureResponse)
      Log.info { "performing 'SendDurableExecutionCallbackFailure' operation" }
      path = "/2025-12-01/durable-execution-callbacks/#{URI.encode_path_segment(input.callback_id)}/fail"
      headers = HTTP::Headers.new
      response = rest_request("SendDurableExecutionCallbackFailure", "POST", path, headers, input.error.try(&.to_json))
      Core::ParsedResponse(AL::SendDurableExecutionCallbackFailureResponse).new(response)
    end

    def send_durable_execution_callback_heartbeat(input : AL::SendDurableExecutionCallbackHeartbeatRequest) : Core::ParsedResponse(AL::SendDurableExecutionCallbackHeartbeatResponse)
      Log.info { "performing 'SendDurableExecutionCallbackHeartbeat' operation" }
      path = "/2025-12-01/durable-execution-callbacks/#{URI.encode_path_segment(input.callback_id)}/heartbeat"
      headers = HTTP::Headers.new
      response = rest_request("SendDurableExecutionCallbackHeartbeat", "POST", path, headers, nil)
      Core::ParsedResponse(AL::SendDurableExecutionCallbackHeartbeatResponse).new(response)
    end

    def send_durable_execution_callback_success(input : AL::SendDurableExecutionCallbackSuccessRequest) : Core::ParsedResponse(AL::SendDurableExecutionCallbackSuccessResponse)
      Log.info { "performing 'SendDurableExecutionCallbackSuccess' operation" }
      path = "/2025-12-01/durable-execution-callbacks/#{URI.encode_path_segment(input.callback_id)}/succeed"
      headers = HTTP::Headers.new
      response = rest_request("SendDurableExecutionCallbackSuccess", "POST", path, headers, input.result)
      Core::ParsedResponse(AL::SendDurableExecutionCallbackSuccessResponse).new(response)
    end

    def tag_resource(input : AL::TagResourceRequest) : Core::Response
      Log.info { "performing 'TagResource' operation" }
      path = "/2017-03-31/tags/#{URI.encode_path_segment(input.resource)}"
      headers = HTTP::Headers.new
      response = rest_request("TagResource", "POST", path, headers, input.to_json)
      Core::Response.new(response)
    end

    def untag_resource(input : AL::UntagResourceRequest) : Core::Response
      Log.info { "performing 'UntagResource' operation" }
      path = "/2017-03-31/tags/#{URI.encode_path_segment(input.resource)}"
      query = URI::Params.build do |form|
        (input.tag_keys || [] of String).each do |value|
          form.add("tagKeys", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("UntagResource", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def update_function_event_invoke_config(input : AL::UpdateFunctionEventInvokeConfigRequest) : Core::ParsedResponse(AL::FunctionEventInvokeConfig)
      Log.info { "performing 'UpdateFunctionEventInvokeConfig' operation" }
      path = "/2019-09-25/functions/#{URI.encode_path_segment(input.function_name)}/event-invoke-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("UpdateFunctionEventInvokeConfig", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionEventInvokeConfig).new(response)
    end

    def list_function_versions_by_capacity_provider(input : AL::ListFunctionVersionsByCapacityProviderRequest) : Core::ParsedResponse(AL::ListFunctionVersionsByCapacityProviderResponse)
      Log.info { "performing 'ListFunctionVersionsByCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers/#{URI.encode_path_segment(input.capacity_provider_name)}/function-versions"
      query = URI::Params.build do |form|
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListFunctionVersionsByCapacityProvider", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListFunctionVersionsByCapacityProviderResponse).new(response)
    end

    def create_capacity_provider(input : AL::CreateCapacityProviderRequest) : Core::ParsedResponse(AL::CreateCapacityProviderResponse)
      Log.info { "performing 'CreateCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers"
      headers = HTTP::Headers.new
      response = rest_request("CreateCapacityProvider", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::CreateCapacityProviderResponse).new(response)
    end

    def get_capacity_provider(input : AL::GetCapacityProviderRequest) : Core::ParsedResponse(AL::GetCapacityProviderResponse)
      Log.info { "performing 'GetCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers/#{URI.encode_path_segment(input.capacity_provider_name)}"
      headers = HTTP::Headers.new
      response = rest_request("GetCapacityProvider", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetCapacityProviderResponse).new(response)
    end

    def update_capacity_provider(input : AL::UpdateCapacityProviderRequest) : Core::ParsedResponse(AL::UpdateCapacityProviderResponse)
      Log.info { "performing 'UpdateCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers/#{URI.encode_path_segment(input.capacity_provider_name)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateCapacityProvider", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::UpdateCapacityProviderResponse).new(response)
    end

    def delete_capacity_provider(input : AL::DeleteCapacityProviderRequest) : Core::ParsedResponse(AL::DeleteCapacityProviderResponse)
      Log.info { "performing 'DeleteCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers/#{URI.encode_path_segment(input.capacity_provider_name)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteCapacityProvider", "DELETE", path, headers, nil)
      Core::ParsedResponse(AL::DeleteCapacityProviderResponse).new(response)
    end

    def list_capacity_providers(input : AL::ListCapacityProvidersRequest) : Core::ParsedResponse(AL::ListCapacityProvidersResponse)
      Log.info { "performing 'ListCapacityProviders' operation" }
      path = "/2025-11-30/capacity-providers"
      query = URI::Params.build do |form|
        if value = input.state.try(&.to_json_object_key)
          form.add("State", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListCapacityProviders", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListCapacityProvidersResponse).new(response)
    end

    def delete_code_signing_config(input : AL::DeleteCodeSigningConfigRequest) : Core::Response
      Log.info { "performing 'DeleteCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs/#{URI.encode_path_segment(input.code_signing_config_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteCodeSigningConfig", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def get_code_signing_config(input : AL::GetCodeSigningConfigRequest) : Core::ParsedResponse(AL::GetCodeSigningConfigResponse)
      Log.info { "performing 'GetCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs/#{URI.encode_path_segment(input.code_signing_config_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("GetCodeSigningConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetCodeSigningConfigResponse).new(response)
    end

    def list_functions_by_code_signing_config(input : AL::ListFunctionsByCodeSigningConfigRequest) : Core::ParsedResponse(AL::ListFunctionsByCodeSigningConfigResponse)
      Log.info { "performing 'ListFunctionsByCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs/#{URI.encode_path_segment(input.code_signing_config_arn)}/functions"
      query = URI::Params.build do |form|
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListFunctionsByCodeSigningConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListFunctionsByCodeSigningConfigResponse).new(response)
    end

    def update_code_signing_config(input : AL::UpdateCodeSigningConfigRequest) : Core::ParsedResponse(AL::UpdateCodeSigningConfigResponse)
      Log.info { "performing 'UpdateCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs/#{URI.encode_path_segment(input.code_signing_config_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateCodeSigningConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::UpdateCodeSigningConfigResponse).new(response)
    end

    def create_code_signing_config(input : AL::CreateCodeSigningConfigRequest) : Core::ParsedResponse(AL::CreateCodeSigningConfigResponse)
      Log.info { "performing 'CreateCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs"
      headers = HTTP::Headers.new
      response = rest_request("CreateCodeSigningConfig", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::CreateCodeSigningConfigResponse).new(response)
    end

    def list_code_signing_configs(input : AL::ListCodeSigningConfigsRequest) : Core::ParsedResponse(AL::ListCodeSigningConfigsResponse)
      Log.info { "performing 'ListCodeSigningConfigs' operation" }
      path = "/2020-04-22/code-signing-configs"
      query = URI::Params.build do |form|
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListCodeSigningConfigs", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListCodeSigningConfigsResponse).new(response)
    end

    def checkpoint_durable_execution(input : AL::CheckpointDurableExecutionRequest) : Core::ParsedResponse(AL::CheckpointDurableExecutionResponse)
      Log.info { "performing 'CheckpointDurableExecution' operation" }
      path = "/2025-12-01/durable-executions/#{URI.encode_path_segment(input.durable_execution_arn)}/checkpoint"
      headers = HTTP::Headers.new
      response = rest_request("CheckpointDurableExecution", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::CheckpointDurableExecutionResponse).new(response)
    end

    def get_durable_execution_history(input : AL::GetDurableExecutionHistoryRequest) : Core::ParsedResponse(AL::GetDurableExecutionHistoryResponse)
      Log.info { "performing 'GetDurableExecutionHistory' operation" }
      path = "/2025-12-01/durable-executions/#{URI.encode_path_segment(input.durable_execution_arn)}/history"
      query = URI::Params.build do |form|
        if value = input.include_execution_data.try(&.to_s)
          form.add("IncludeExecutionData", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.reverse_order.try(&.to_s)
          form.add("ReverseOrder", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDurableExecutionHistory", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetDurableExecutionHistoryResponse).new(response)
    end

    def get_durable_execution_state(input : AL::GetDurableExecutionStateRequest) : Core::ParsedResponse(AL::GetDurableExecutionStateResponse)
      Log.info { "performing 'GetDurableExecutionState' operation" }
      path = "/2025-12-01/durable-executions/#{URI.encode_path_segment(input.durable_execution_arn)}/state"
      query = URI::Params.build do |form|
        if value = input.checkpoint_token
          form.add("CheckpointToken", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDurableExecutionState", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetDurableExecutionStateResponse).new(response)
    end

    def stop_durable_execution(input : AL::StopDurableExecutionRequest) : Core::ParsedResponse(AL::StopDurableExecutionResponse)
      Log.info { "performing 'StopDurableExecution' operation" }
      path = "/2025-12-01/durable-executions/#{URI.encode_path_segment(input.durable_execution_arn)}/stop"
      headers = HTTP::Headers.new
      response = rest_request("StopDurableExecution", "POST", path, headers, input.error.try(&.to_json))
      Core::ParsedResponse(AL::StopDurableExecutionResponse).new(response)
    end

    def get_durable_execution(input : AL::GetDurableExecutionRequest) : Core::ParsedResponse(AL::GetDurableExecutionResponse)
      Log.info { "performing 'GetDurableExecution' operation" }
      path = "/2025-12-01/durable-executions/#{URI.encode_path_segment(input.durable_execution_arn)}"
      query = URI::Params.build do |form|
        if value = input.include_execution_data.try(&.to_s)
          form.add("IncludeExecutionData", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetDurableExecution", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetDurableExecutionResponse).new(response)
    end

    def create_event_source_mapping(input : AL::CreateEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'CreateEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings"
      headers = HTTP::Headers.new
      response = rest_request("CreateEventSourceMapping", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    def get_event_source_mapping(input : AL::GetEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'GetEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings/#{URI.encode_path_segment(input.uuid)}"
      headers = HTTP::Headers.new
      response = rest_request("GetEventSourceMapping", "GET", path, headers, nil)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    def update_event_source_mapping(input : AL::UpdateEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'UpdateEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings/#{URI.encode_path_segment(input.uuid)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateEventSourceMapping", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    def delete_event_source_mapping(input : AL::DeleteEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'DeleteEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings/#{URI.encode_path_segment(input.uuid)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteEventSourceMapping", "DELETE", path, headers, nil)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    def list_event_source_mappings(input : AL::ListEventSourceMappingsRequest) : Core::ParsedResponse(AL::ListEventSourceMappingsResponse)
      Log.info { "performing 'ListEventSourceMappings' operation" }
      path = "/2015-03-31/event-source-mappings"
      query = URI::Params.build do |form|
        if value = input.event_source_arn
          form.add("EventSourceArn", value)
        end
        if value = input.function_name
          form.add("FunctionName", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListEventSourceMappings", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListEventSourceMappingsResponse).new(response)
    end

    def delete_function_concurrency(input : AL::DeleteFunctionConcurrencyRequest) : Core::Response
      Log.info { "performing 'DeleteFunctionConcurrency' operation" }
      path = "/2017-10-31/functions/#{URI.encode_path_segment(input.function_name)}/concurrency"
      headers = HTTP::Headers.new
      response = rest_request("DeleteFunctionConcurrency", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def get_function_concurrency(input : AL::GetFunctionConcurrencyRequest) : Core::ParsedResponse(AL::GetFunctionConcurrencyResponse)
      Log.info { "performing 'GetFunctionConcurrency' operation" }
      path = "/2019-09-30/functions/#{URI.encode_path_segment(input.function_name)}/concurrency"
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionConcurrency", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionConcurrencyResponse).new(response)
    end

    def list_provisioned_concurrency_configs(input : AL::ListProvisionedConcurrencyConfigsRequest) : Core::ParsedResponse(AL::ListProvisionedConcurrencyConfigsResponse)
      Log.info { "performing 'ListProvisionedConcurrencyConfigs' operation" }
      path = "/2019-09-30/functions/#{URI.encode_path_segment(input.function_name)}/provisioned-concurrency?List=ALL"
      query = URI::Params.build do |form|
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListProvisionedConcurrencyConfigs", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListProvisionedConcurrencyConfigsResponse).new(response)
    end

    def put_function_concurrency(input : AL::PutFunctionConcurrencyRequest) : Core::ParsedResponse(AL::Concurrency)
      Log.info { "performing 'PutFunctionConcurrency' operation" }
      path = "/2017-10-31/functions/#{URI.encode_path_segment(input.function_name)}/concurrency"
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionConcurrency", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::Concurrency).new(response)
    end

    def update_function_code(input : AL::UpdateFunctionCodeRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'UpdateFunctionCode' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/code"
      headers = HTTP::Headers.new
      response = rest_request("UpdateFunctionCode", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    def update_function_configuration(input : AL::UpdateFunctionConfigurationRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'UpdateFunctionConfiguration' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/configuration"
      headers = HTTP::Headers.new
      response = rest_request("UpdateFunctionConfiguration", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    def create_function_url_config(input : AL::CreateFunctionUrlConfigRequest) : Core::ParsedResponse(AL::CreateFunctionUrlConfigResponse)
      Log.info { "performing 'CreateFunctionUrlConfig' operation" }
      path = "/2021-10-31/functions/#{URI.encode_path_segment(input.function_name)}/url"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("CreateFunctionUrlConfig", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::CreateFunctionUrlConfigResponse).new(response)
    end

    def delete_function_code_signing_config(input : AL::DeleteFunctionCodeSigningConfigRequest) : Core::Response
      Log.info { "performing 'DeleteFunctionCodeSigningConfig' operation" }
      path = "/2020-06-30/functions/#{URI.encode_path_segment(input.function_name)}/code-signing-config"
      headers = HTTP::Headers.new
      response = rest_request("DeleteFunctionCodeSigningConfig", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def delete_function_url_config(input : AL::DeleteFunctionUrlConfigRequest) : Core::Response
      Log.info { "performing 'DeleteFunctionUrlConfig' operation" }
      path = "/2021-10-31/functions/#{URI.encode_path_segment(input.function_name)}/url"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("DeleteFunctionUrlConfig", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def get_function(input : AL::GetFunctionRequest) : Core::ParsedResponse(AL::GetFunctionResponse)
      Log.info { "performing 'GetFunction' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetFunction", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionResponse).new(response)
    end

    def get_function_code_signing_config(input : AL::GetFunctionCodeSigningConfigRequest) : Core::ParsedResponse(AL::GetFunctionCodeSigningConfigResponse)
      Log.info { "performing 'GetFunctionCodeSigningConfig' operation" }
      path = "/2020-06-30/functions/#{URI.encode_path_segment(input.function_name)}/code-signing-config"
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionCodeSigningConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionCodeSigningConfigResponse).new(response)
    end

    def get_function_configuration(input : AL::GetFunctionConfigurationRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'GetFunctionConfiguration' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/configuration"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionConfiguration", "GET", path, headers, nil)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    def get_function_recursion_config(input : AL::GetFunctionRecursionConfigRequest) : Core::ParsedResponse(AL::GetFunctionRecursionConfigResponse)
      Log.info { "performing 'GetFunctionRecursionConfig' operation" }
      path = "/2024-08-31/functions/#{URI.encode_path_segment(input.function_name)}/recursion-config"
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionRecursionConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionRecursionConfigResponse).new(response)
    end

    def get_function_scaling_config(input : AL::GetFunctionScalingConfigRequest) : Core::ParsedResponse(AL::GetFunctionScalingConfigResponse)
      Log.info { "performing 'GetFunctionScalingConfig' operation" }
      path = "/2025-11-30/functions/#{URI.encode_path_segment(input.function_name)}/function-scaling-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionScalingConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionScalingConfigResponse).new(response)
    end

    def get_function_url_config(input : AL::GetFunctionUrlConfigRequest) : Core::ParsedResponse(AL::GetFunctionUrlConfigResponse)
      Log.info { "performing 'GetFunctionUrlConfig' operation" }
      path = "/2021-10-31/functions/#{URI.encode_path_segment(input.function_name)}/url"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionUrlConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionUrlConfigResponse).new(response)
    end

    def get_policy(input : AL::GetPolicyRequest) : Core::ParsedResponse(AL::GetPolicyResponse)
      Log.info { "performing 'GetPolicy' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/policy"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetPolicy", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetPolicyResponse).new(response)
    end

    def get_runtime_management_config(input : AL::GetRuntimeManagementConfigRequest) : Core::ParsedResponse(AL::GetRuntimeManagementConfigResponse)
      Log.info { "performing 'GetRuntimeManagementConfig' operation" }
      path = "/2021-07-20/functions/#{URI.encode_path_segment(input.function_name)}/runtime-management-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetRuntimeManagementConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetRuntimeManagementConfigResponse).new(response)
    end

    def invoke(input : AL::InvocationRequest) : Core::ParsedResponse(AL::InvocationResponse)
      Log.info { "performing 'Invoke' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/invocations"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      if value = input.invocation_type.try(&.to_json_object_key)
        headers["X-Amz-Invocation-Type"] = value
      end
      if value = input.log_type.try(&.to_json_object_key)
        headers["X-Amz-Log-Type"] = value
      end
      if value = input.client_context
        headers["X-Amz-Client-Context"] = value
      end
      if value = input.durable_execution_name
        headers["X-Amz-Durable-Execution-Name"] = value
      end
      if value = input.tenant_id
        headers["X-Amz-Tenant-Id"] = value
      end
      response = rest_request("Invoke", "POST", path, headers, input.payload)
      result = AL::InvocationResponse.new(
        function_error: response.headers["X-Amz-Function-Error"]?,
        log_result: response.headers["X-Amz-Log-Result"]?,
        executed_version: response.headers["X-Amz-Executed-Version"]?,
        durable_execution_arn: response.headers["X-Amz-Durable-Execution-Arn"]?,
        status_code: response.status_code,
        payload: response.body,
      )
      Core::ParsedResponse(AL::InvocationResponse).new(response, result)
    end

    def invoke_async(input : AL::InvokeAsyncRequest) : Core::ParsedResponse(AL::InvokeAsyncResponse)
      Log.info { "performing 'InvokeAsync' operation" }
      path = "/2014-11-13/functions/#{URI.encode_path_segment(input.function_name)}/invoke-async"
      headers = HTTP::Headers.new
      response = rest_request("InvokeAsync", "POST", path, headers, input.invoke_args)
      result = AL::InvokeAsyncResponse.new(
        status: response.status_code,
      )
      Core::ParsedResponse(AL::InvokeAsyncResponse).new(response, result)
    end

    def list_durable_executions_by_function(input : AL::ListDurableExecutionsByFunctionRequest) : Core::ParsedResponse(AL::ListDurableExecutionsByFunctionResponse)
      Log.info { "performing 'ListDurableExecutionsByFunction' operation" }
      path = "/2025-12-01/functions/#{URI.encode_path_segment(input.function_name)}/durable-executions"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
        if value = input.durable_execution_name
          form.add("DurableExecutionName", value)
        end
        (input.statuses || [] of ExecutionStatus).each do |value|
          form.add("Statuses", value.to_json_object_key)
        end
        if value = input.started_after.try(&.to_s)
          form.add("StartedAfter", value)
        end
        if value = input.started_before.try(&.to_s)
          form.add("StartedBefore", value)
        end
        if value = input.reverse_order.try(&.to_s)
          form.add("ReverseOrder", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListDurableExecutionsByFunction", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListDurableExecutionsByFunctionResponse).new(response)
    end

    def list_function_url_configs(input : AL::ListFunctionUrlConfigsRequest) : Core::ParsedResponse(AL::ListFunctionUrlConfigsResponse)
      Log.info { "performing 'ListFunctionUrlConfigs' operation" }
      path = "/2021-10-31/functions/#{URI.encode_path_segment(input.function_name)}/urls"
      query = URI::Params.build do |form|
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListFunctionUrlConfigs", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListFunctionUrlConfigsResponse).new(response)
    end

    def put_function_code_signing_config(input : AL::PutFunctionCodeSigningConfigRequest) : Core::ParsedResponse(AL::PutFunctionCodeSigningConfigResponse)
      Log.info { "performing 'PutFunctionCodeSigningConfig' operation" }
      path = "/2020-06-30/functions/#{URI.encode_path_segment(input.function_name)}/code-signing-config"
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionCodeSigningConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutFunctionCodeSigningConfigResponse).new(response)
    end

    def put_function_recursion_config(input : AL::PutFunctionRecursionConfigRequest) : Core::ParsedResponse(AL::PutFunctionRecursionConfigResponse)
      Log.info { "performing 'PutFunctionRecursionConfig' operation" }
      path = "/2024-08-31/functions/#{URI.encode_path_segment(input.function_name)}/recursion-config"
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionRecursionConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutFunctionRecursionConfigResponse).new(response)
    end

    def put_function_scaling_config(input : AL::PutFunctionScalingConfigRequest) : Core::ParsedResponse(AL::PutFunctionScalingConfigResponse)
      Log.info { "performing 'PutFunctionScalingConfig' operation" }
      path = "/2025-11-30/functions/#{URI.encode_path_segment(input.function_name)}/function-scaling-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionScalingConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutFunctionScalingConfigResponse).new(response)
    end

    def put_runtime_management_config(input : AL::PutRuntimeManagementConfigRequest) : Core::ParsedResponse(AL::PutRuntimeManagementConfigResponse)
      Log.info { "performing 'PutRuntimeManagementConfig' operation" }
      path = "/2021-07-20/functions/#{URI.encode_path_segment(input.function_name)}/runtime-management-config"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("PutRuntimeManagementConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutRuntimeManagementConfigResponse).new(response)
    end

    def update_function_url_config(input : AL::UpdateFunctionUrlConfigRequest) : Core::ParsedResponse(AL::UpdateFunctionUrlConfigResponse)
      Log.info { "performing 'UpdateFunctionUrlConfig' operation" }
      path = "/2021-10-31/functions/#{URI.encode_path_segment(input.function_name)}/url"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("UpdateFunctionUrlConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::UpdateFunctionUrlConfigResponse).new(response)
    end

    def create_function(input : AL::CreateFunctionRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'CreateFunction' operation" }
      path = "/2015-03-31/functions"
      headers = HTTP::Headers.new
      response = rest_request("CreateFunction", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    def list_functions(input : AL::ListFunctionsRequest) : Core::ParsedResponse(AL::ListFunctionsResponse)
      Log.info { "performing 'ListFunctions' operation" }
      path = "/2015-03-31/functions"
      query = URI::Params.build do |form|
        if value = input.master_region
          form.add("MasterRegion", value)
        end
        if value = input.function_version.try(&.to_json_object_key)
          form.add("FunctionVersion", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListFunctions", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListFunctionsResponse).new(response)
    end

    def create_alias(input : AL::CreateAliasRequest) : Core::ParsedResponse(AL::AliasConfiguration)
      Log.info { "performing 'CreateAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases"
      headers = HTTP::Headers.new
      response = rest_request("CreateAlias", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::AliasConfiguration).new(response)
    end

    def get_alias(input : AL::GetAliasRequest) : Core::ParsedResponse(AL::AliasConfiguration)
      Log.info { "performing 'GetAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases/#{URI.encode_path_segment(input.name)}"
      headers = HTTP::Headers.new
      response = rest_request("GetAlias", "GET", path, headers, nil)
      Core::ParsedResponse(AL::AliasConfiguration).new(response)
    end

    def update_alias(input : AL::UpdateAliasRequest) : Core::ParsedResponse(AL::AliasConfiguration)
      Log.info { "performing 'UpdateAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases/#{URI.encode_path_segment(input.name)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateAlias", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::AliasConfiguration).new(response)
    end

    def delete_alias(input : AL::DeleteAliasRequest) : Core::Response
      Log.info { "performing 'DeleteAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases/#{URI.encode_path_segment(input.name)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteAlias", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def list_aliases(input : AL::ListAliasesRequest) : Core::ParsedResponse(AL::ListAliasesResponse)
      Log.info { "performing 'ListAliases' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases"
      query = URI::Params.build do |form|
        if value = input.function_version
          form.add("FunctionVersion", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListAliases", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListAliasesResponse).new(response)
    end

    def list_versions_by_function(input : AL::ListVersionsByFunctionRequest) : Core::ParsedResponse(AL::ListVersionsByFunctionResponse)
      Log.info { "performing 'ListVersionsByFunction' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/versions"
      query = URI::Params.build do |form|
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListVersionsByFunction", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListVersionsByFunctionResponse).new(response)
    end

    def publish_version(input : AL::PublishVersionRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'PublishVersion' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/versions"
      headers = HTTP::Headers.new
      response = rest_request("PublishVersion", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    def list_layers(input : AL::ListLayersRequest) : Core::ParsedResponse(AL::ListLayersResponse)
      Log.info { "performing 'ListLayers' operation" }
      path = "/2018-10-31/layers"
      query = URI::Params.build do |form|
        if value = input.compatible_architecture.try(&.to_json_object_key)
          form.add("CompatibleArchitecture", value)
        end
        if value = input.compatible_runtime.try(&.to_json_object_key)
          form.add("CompatibleRuntime", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListLayers", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListLayersResponse).new(response)
    end

    def add_layer_version_permission(input : AL::AddLayerVersionPermissionRequest) : Core::ParsedResponse(AL::AddLayerVersionPermissionResponse)
      Log.info { "performing 'AddLayerVersionPermission' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}/policy"
      query = URI::Params.build do |form|
        if value = input.revision_id
          form.add("RevisionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("AddLayerVersionPermission", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::AddLayerVersionPermissionResponse).new(response)
    end

    def delete_layer_version(input : AL::DeleteLayerVersionRequest) : Core::Response
      Log.info { "performing 'DeleteLayerVersion' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteLayerVersion", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def get_layer_version(input : AL::GetLayerVersionRequest) : Core::ParsedResponse(AL::GetLayerVersionResponse)
      Log.info { "performing 'GetLayerVersion' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}"
      headers = HTTP::Headers.new
      response = rest_request("GetLayerVersion", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetLayerVersionResponse).new(response)
    end

    def get_layer_version_by_arn(input : AL::GetLayerVersionByArnRequest) : Core::ParsedResponse(AL::GetLayerVersionResponse)
      Log.info { "performing 'GetLayerVersionByArn' operation" }
      path = "/2018-10-31/layers?find=LayerVersion"
      query = URI::Params.build do |form|
        if value = input.arn
          form.add("Arn", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetLayerVersionByArn", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetLayerVersionResponse).new(response)
    end

    def get_layer_version_policy(input : AL::GetLayerVersionPolicyRequest) : Core::ParsedResponse(AL::GetLayerVersionPolicyResponse)
      Log.info { "performing 'GetLayerVersionPolicy' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}/policy"
      headers = HTTP::Headers.new
      response = rest_request("GetLayerVersionPolicy", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetLayerVersionPolicyResponse).new(response)
    end

    def publish_layer_version(input : AL::PublishLayerVersionRequest) : Core::ParsedResponse(AL::PublishLayerVersionResponse)
      Log.info { "performing 'PublishLayerVersion' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions"
      headers = HTTP::Headers.new
      response = rest_request("PublishLayerVersion", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::PublishLayerVersionResponse).new(response)
    end

    def remove_layer_version_permission(input : AL::RemoveLayerVersionPermissionRequest) : Core::Response
      Log.info { "performing 'RemoveLayerVersionPermission' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}/policy/#{URI.encode_path_segment(input.statement_id)}"
      query = URI::Params.build do |form|
        if value = input.revision_id
          form.add("RevisionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("RemoveLayerVersionPermission", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def list_layer_versions(input : AL::ListLayerVersionsRequest) : Core::ParsedResponse(AL::ListLayerVersionsResponse)
      Log.info { "performing 'ListLayerVersions' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions"
      query = URI::Params.build do |form|
        if value = input.compatible_architecture.try(&.to_json_object_key)
          form.add("CompatibleArchitecture", value)
        end
        if value = input.compatible_runtime.try(&.to_json_object_key)
          form.add("CompatibleRuntime", value)
        end
        if value = input.marker
          form.add("Marker", value)
        end
        if value = input.max_items.try(&.to_s)
          form.add("MaxItems", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("ListLayerVersions", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListLayerVersionsResponse).new(response)
    end

    def add_permission(input : AL::AddPermissionRequest) : Core::ParsedResponse(AL::AddPermissionResponse)
      Log.info { "performing 'AddPermission' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/policy"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("AddPermission", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::AddPermissionResponse).new(response)
    end

    def remove_permission(input : AL::RemovePermissionRequest) : Core::Response
      Log.info { "performing 'RemovePermission' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/policy/#{URI.encode_path_segment(input.statement_id)}"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
        if value = input.revision_id
          form.add("RevisionId", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("RemovePermission", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    def put_provisioned_concurrency_config(input : AL::PutProvisionedConcurrencyConfigRequest) : Core::ParsedResponse(AL::PutProvisionedConcurrencyConfigResponse)
      Log.info { "performing 'PutProvisionedConcurrencyConfig' operation" }
      path = "/2019-09-30/functions/#{URI.encode_path_segment(input.function_name)}/provisioned-concurrency"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("PutProvisionedConcurrencyConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutProvisionedConcurrencyConfigResponse).new(response)
    end

    def get_provisioned_concurrency_config(input : AL::GetProvisionedConcurrencyConfigRequest) : Core::ParsedResponse(AL::GetProvisionedConcurrencyConfigResponse)
      Log.info { "performing 'GetProvisionedConcurrencyConfig' operation" }
      path = "/2019-09-30/functions/#{URI.encode_path_segment(input.function_name)}/provisioned-concurrency"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("GetProvisionedConcurrencyConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetProvisionedConcurrencyConfigResponse).new(response)
    end

    def delete_provisioned_concurrency_config(input : AL::DeleteProvisionedConcurrencyConfigRequest) : Core::Response
      Log.info { "performing 'DeleteProvisionedConcurrencyConfig' operation" }
      path = "/2019-09-30/functions/#{URI.encode_path_segment(input.function_name)}/provisioned-concurrency"
      query = URI::Params.build do |form|
        if value = input.qualifier
          form.add("Qualifier", value)
        end
      end
      path = "#{path}?#{query}" unless query.empty?
      headers = HTTP::Headers.new
      response = rest_request("DeleteProvisionedConcurrencyConfig", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end
  end
end
