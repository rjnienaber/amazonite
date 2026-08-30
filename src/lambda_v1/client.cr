private alias AL = Amazonite::LambdaV1
private alias Core = Amazonite::Core

module Amazonite::LambdaV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.lambda_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AWSGirApiService", "lambda", "1.0", EXCEPTION_FACTORY, config)
    end

    # Deletes a Lambda function. To delete a specific function version, use the `Qualifier` parameter.
    # Otherwise, all versions and aliases are deleted. This doesn't require the user to have explicit
    # permissions for DeleteAlias.
    #
    # A deleted Lambda function cannot be recovered. Ensure that you specify the correct function name
    # and version before deleting.
    #
    # To delete Lambda event source mappings that invoke a function, use DeleteEventSourceMapping. For
    # Amazon Web Services services and resources that invoke your function directly, delete the
    # trigger in the service where you originally configured it.
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

    # Deletes the configuration for asynchronous invocation for a function, version, or alias.
    #
    # To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.
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

    # Deletes a [resource-based
    # policy](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html) from a
    # Lambda resource.
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

    # Retrieves details about your account's
    # [limits](https://docs.aws.amazon.com/lambda/latest/dg/limits.html) and usage in an Amazon Web
    # Services Region.
    def get_account_settings(input : AL::GetAccountSettingsRequest) : Core::ParsedResponse(AL::GetAccountSettingsResponse)
      Log.info { "performing 'GetAccountSettings' operation" }
      path = "/2016-08-19/account-settings"
      headers = HTTP::Headers.new
      response = rest_request("GetAccountSettings", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetAccountSettingsResponse).new(response)
    end

    # Retrieves the configuration for asynchronous invocation for a function, version, or alias.
    #
    # To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.
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

    # Retrieves the [resource-based
    # policy](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html)
    # attached to a Lambda resource.
    def get_resource_policy(input : AL::GetResourcePolicyRequest) : Core::ParsedResponse(AL::GetResourcePolicyResponse)
      Log.info { "performing 'GetResourcePolicy' operation" }
      path = "/2026-07-09/resource-policy/#{URI.encode_path_segment(input.resource_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("GetResourcePolicy", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetResourcePolicyResponse).new(response)
    end

    # Retrieves a list of configurations for asynchronous invocation for a function.
    #
    # To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.
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

    # Returns a function, event source mapping, or code signing configuration's
    # [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html). You can also view function
    # tags with GetFunction.
    def list_tags(input : AL::ListTagsRequest) : Core::ParsedResponse(AL::ListTagsResponse)
      Log.info { "performing 'ListTags' operation" }
      path = "/2017-03-31/tags/#{URI.encode_path_segment(input.resource)}"
      headers = HTTP::Headers.new
      response = rest_request("ListTags", "GET", path, headers, nil)
      Core::ParsedResponse(AL::ListTagsResponse).new(response)
    end

    # Configures options for [asynchronous
    # invocation](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html) on a function,
    # version, or alias. If a configuration already exists for a function, version, or alias, this
    # operation overwrites it. If you exclude any settings, they are removed. To set one option
    # without affecting existing settings for other options, use UpdateFunctionEventInvokeConfig.
    #
    # By default, Lambda retries an asynchronous invocation twice if the function returns an error. It
    # retains events in a queue for up to six hours. When an event fails all processing attempts or
    # stays in the asynchronous invocation queue for too long, Lambda discards it. To retain discarded
    # events, configure a dead-letter queue with UpdateFunctionConfiguration.
    #
    # To send an invocation record to a queue, topic, S3 bucket, function, or event bus, specify a
    # [destination](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-async-destinations).
    # You can configure separate destinations for successful invocations (on-success) and events that
    # fail all processing attempts (on-failure). You can configure destinations in addition to or
    # instead of a dead-letter queue.
    #
    # S3 buckets are supported only for on-failure destinations. To retain records of successful
    # invocations, use another destination type.
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

    # Adds a [resource-based
    # policy](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html) to a
    # Lambda resource. Resource-based policies grant access to other [Amazon Web Services
    # accounts](https://docs.aws.amazon.com/lambda/latest/dg/permissions-function-cross-account.html),
    # [organizations](https://docs.aws.amazon.com/lambda/latest/dg/permissions-function-organization.html),
    # or [services](https://docs.aws.amazon.com/lambda/latest/dg/permissions-function-services.html).
    # Resource-based policies apply to a single Lambda resource (for example, a function, function
    # version, or function alias).
    #
    # This operation replaces any existing policy on the Lambda resource. If you previously added
    # permissions using the AddPermission operation, the new policy overwrites those permissions.
    def put_resource_policy(input : AL::PutResourcePolicyRequest) : Core::ParsedResponse(AL::PutResourcePolicyResponse)
      Log.info { "performing 'PutResourcePolicy' operation" }
      path = "/2026-07-09/resource-policy/#{URI.encode_path_segment(input.resource_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("PutResourcePolicy", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutResourcePolicyResponse).new(response)
    end

    # Sends a failure response for a callback operation in a durable execution. Use this API when an
    # external system cannot complete a callback operation successfully.
    def send_durable_execution_callback_failure(input : AL::SendDurableExecutionCallbackFailureRequest) : Core::ParsedResponse(AL::SendDurableExecutionCallbackFailureResponse)
      Log.info { "performing 'SendDurableExecutionCallbackFailure' operation" }
      path = "/2025-12-01/durable-execution-callbacks/#{URI.encode_path_segment(input.callback_id)}/fail"
      headers = HTTP::Headers.new
      response = rest_request("SendDurableExecutionCallbackFailure", "POST", path, headers, input.error.try(&.to_json))
      Core::ParsedResponse(AL::SendDurableExecutionCallbackFailureResponse).new(response)
    end

    # Sends a heartbeat signal for a long-running callback operation to prevent timeout. Use this API
    # to extend the callback timeout period while the external operation is still in progress.
    def send_durable_execution_callback_heartbeat(input : AL::SendDurableExecutionCallbackHeartbeatRequest) : Core::ParsedResponse(AL::SendDurableExecutionCallbackHeartbeatResponse)
      Log.info { "performing 'SendDurableExecutionCallbackHeartbeat' operation" }
      path = "/2025-12-01/durable-execution-callbacks/#{URI.encode_path_segment(input.callback_id)}/heartbeat"
      headers = HTTP::Headers.new
      response = rest_request("SendDurableExecutionCallbackHeartbeat", "POST", path, headers, nil)
      Core::ParsedResponse(AL::SendDurableExecutionCallbackHeartbeatResponse).new(response)
    end

    # Sends a successful completion response for a callback operation in a durable execution. Use this
    # API when an external system has successfully completed a callback operation.
    def send_durable_execution_callback_success(input : AL::SendDurableExecutionCallbackSuccessRequest) : Core::ParsedResponse(AL::SendDurableExecutionCallbackSuccessResponse)
      Log.info { "performing 'SendDurableExecutionCallbackSuccess' operation" }
      path = "/2025-12-01/durable-execution-callbacks/#{URI.encode_path_segment(input.callback_id)}/succeed"
      headers = HTTP::Headers.new
      response = rest_request("SendDurableExecutionCallbackSuccess", "POST", path, headers, input.result)
      Core::ParsedResponse(AL::SendDurableExecutionCallbackSuccessResponse).new(response)
    end

    # Adds [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html) to a function, event
    # source mapping, or code signing configuration.
    def tag_resource(input : AL::TagResourceRequest) : Core::Response
      Log.info { "performing 'TagResource' operation" }
      path = "/2017-03-31/tags/#{URI.encode_path_segment(input.resource)}"
      headers = HTTP::Headers.new
      response = rest_request("TagResource", "POST", path, headers, input.to_json)
      Core::Response.new(response)
    end

    # Removes [tags](https://docs.aws.amazon.com/lambda/latest/dg/tagging.html) from a function, event
    # source mapping, or code signing configuration.
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

    # Updates the configuration for asynchronous invocation for a function, version, or alias.
    #
    # To configure options for asynchronous invocation, use PutFunctionEventInvokeConfig.
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

    # Returns a list of function versions that are configured to use a specific capacity provider.
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

    # Creates a capacity provider that manages compute resources for Lambda functions
    def create_capacity_provider(input : AL::CreateCapacityProviderRequest) : Core::ParsedResponse(AL::CreateCapacityProviderResponse)
      Log.info { "performing 'CreateCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers"
      headers = HTTP::Headers.new
      response = rest_request("CreateCapacityProvider", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::CreateCapacityProviderResponse).new(response)
    end

    # Retrieves information about a specific capacity provider, including its configuration, state,
    # and associated resources.
    def get_capacity_provider(input : AL::GetCapacityProviderRequest) : Core::ParsedResponse(AL::GetCapacityProviderResponse)
      Log.info { "performing 'GetCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers/#{URI.encode_path_segment(input.capacity_provider_name)}"
      headers = HTTP::Headers.new
      response = rest_request("GetCapacityProvider", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetCapacityProviderResponse).new(response)
    end

    # Updates the configuration of an existing capacity provider.
    def update_capacity_provider(input : AL::UpdateCapacityProviderRequest) : Core::ParsedResponse(AL::UpdateCapacityProviderResponse)
      Log.info { "performing 'UpdateCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers/#{URI.encode_path_segment(input.capacity_provider_name)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateCapacityProvider", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::UpdateCapacityProviderResponse).new(response)
    end

    # Deletes a capacity provider. You cannot delete a capacity provider that is currently being used
    # by Lambda functions.
    def delete_capacity_provider(input : AL::DeleteCapacityProviderRequest) : Core::ParsedResponse(AL::DeleteCapacityProviderResponse)
      Log.info { "performing 'DeleteCapacityProvider' operation" }
      path = "/2025-11-30/capacity-providers/#{URI.encode_path_segment(input.capacity_provider_name)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteCapacityProvider", "DELETE", path, headers, nil)
      Core::ParsedResponse(AL::DeleteCapacityProviderResponse).new(response)
    end

    # Returns a list of capacity providers in your account.
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

    # Deletes the code signing configuration. You can delete the code signing configuration only if no
    # function is using it.
    def delete_code_signing_config(input : AL::DeleteCodeSigningConfigRequest) : Core::Response
      Log.info { "performing 'DeleteCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs/#{URI.encode_path_segment(input.code_signing_config_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteCodeSigningConfig", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Returns information about the specified code signing configuration.
    def get_code_signing_config(input : AL::GetCodeSigningConfigRequest) : Core::ParsedResponse(AL::GetCodeSigningConfigResponse)
      Log.info { "performing 'GetCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs/#{URI.encode_path_segment(input.code_signing_config_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("GetCodeSigningConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetCodeSigningConfigResponse).new(response)
    end

    # List the functions that use the specified code signing configuration. You can use this method
    # prior to deleting a code signing configuration, to verify that no functions are using it.
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

    # Update the code signing configuration. Changes to the code signing configuration take effect the
    # next time a user tries to deploy a code package to the function.
    def update_code_signing_config(input : AL::UpdateCodeSigningConfigRequest) : Core::ParsedResponse(AL::UpdateCodeSigningConfigResponse)
      Log.info { "performing 'UpdateCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs/#{URI.encode_path_segment(input.code_signing_config_arn)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateCodeSigningConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::UpdateCodeSigningConfigResponse).new(response)
    end

    # Creates a code signing configuration. A [code signing
    # configuration](https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html)
    # defines a list of allowed signing profiles and defines the code-signing validation policy
    # (action to be taken if deployment validation checks fail).
    def create_code_signing_config(input : AL::CreateCodeSigningConfigRequest) : Core::ParsedResponse(AL::CreateCodeSigningConfigResponse)
      Log.info { "performing 'CreateCodeSigningConfig' operation" }
      path = "/2020-04-22/code-signing-configs"
      headers = HTTP::Headers.new
      response = rest_request("CreateCodeSigningConfig", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::CreateCodeSigningConfigResponse).new(response)
    end

    # Returns a list of [code signing
    # configurations](https://docs.aws.amazon.com/lambda/latest/dg/configuring-codesigning.html). A
    # request returns up to 10,000 configurations per call. You can use the `MaxItems` parameter to
    # return fewer configurations per call.
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

    # Saves the progress of a [durable
    # function](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) execution during
    # runtime. This API is used by the Lambda durable functions SDK to checkpoint completed steps and
    # schedule asynchronous operations. You typically don't need to call this API directly as the SDK
    # handles checkpointing automatically.
    #
    # Each checkpoint operation consumes the current checkpoint token and returns a new one for the
    # next checkpoint. This ensures that checkpoints are applied in the correct order and prevents
    # duplicate or out-of-order state updates.
    def checkpoint_durable_execution(input : AL::CheckpointDurableExecutionRequest) : Core::ParsedResponse(AL::CheckpointDurableExecutionResponse)
      Log.info { "performing 'CheckpointDurableExecution' operation" }
      path = "/2025-12-01/durable-executions/#{URI.encode_path_segment(input.durable_execution_arn)}/checkpoint"
      headers = HTTP::Headers.new
      response = rest_request("CheckpointDurableExecution", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::CheckpointDurableExecutionResponse).new(response)
    end

    # Retrieves the execution history for a [durable
    # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html), showing all the
    # steps, callbacks, and events that occurred during the execution. This provides a detailed audit
    # trail of the execution's progress over time.
    #
    # The history is available while the execution is running and for a retention period after it
    # completes (1-90 days, default 30 days). You can control whether to include execution data such
    # as step results and callback payloads.
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

    # Retrieves the current execution state required for the replay process during [durable
    # function](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) execution. This
    # API is used by the Lambda durable functions SDK to get state information needed for replay. You
    # typically don't need to call this API directly as the SDK handles state management
    # automatically.
    #
    # The response contains operations ordered by start sequence number in ascending order. Completed
    # operations with children don't include child operation details since they don't need to be
    # replayed.
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

    # Stops a running [durable
    # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html). The execution
    # transitions to STOPPED status and cannot be resumed. Any in-progress operations are terminated.
    def stop_durable_execution(input : AL::StopDurableExecutionRequest) : Core::ParsedResponse(AL::StopDurableExecutionResponse)
      Log.info { "performing 'StopDurableExecution' operation" }
      path = "/2025-12-01/durable-executions/#{URI.encode_path_segment(input.durable_execution_arn)}/stop"
      headers = HTTP::Headers.new
      response = rest_request("StopDurableExecution", "POST", path, headers, input.error.try(&.to_json))
      Core::ParsedResponse(AL::StopDurableExecutionResponse).new(response)
    end

    # Retrieves detailed information about a specific [durable
    # execution](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html), including its
    # current status, input payload, result or error information, and execution metadata such as start
    # time and usage statistics.
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

    # Creates a mapping between an event source and an Lambda function. Lambda reads items from the
    # event source and invokes the function.
    #
    # For details about how to configure different event sources, see the following topics.
    #
    # - [ Amazon DynamoDB
    # Streams](https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-dynamodb-eventsourcemapping)
    #
    # - [ Amazon
    # Kinesis](https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-eventsourcemapping)
    #
    # - [ Amazon
    # SQS](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-eventsource)
    #
    # - [ Amazon MQ and
    # RabbitMQ](https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-eventsourcemapping)
    #
    # - [ Amazon MSK](https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html)
    #
    # - [ Apache Kafka](https://docs.aws.amazon.com/lambda/latest/dg/kafka-smaa.html)
    #
    # - [ Amazon DocumentDB](https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html)
    #
    # The following error handling options are available for stream sources (DynamoDB, Kinesis, Amazon
    # MSK, and self-managed Apache Kafka):
    #
    # - `BisectBatchOnFunctionError` – If the function returns an error, split the batch in two and
    # retry.
    #
    # - `MaximumRecordAgeInSeconds` – Discard records older than the specified age. The default value
    # is infinite (-1). When set to infinite (-1), failed records are retried until the record expires
    #
    # - `MaximumRetryAttempts` – Discard records after the specified number of retries. The default
    # value is infinite (-1). When set to infinite (-1), failed records are retried until the record
    # expires.
    #
    # - `OnFailure` – Send discarded records to an Amazon SQS queue, Amazon SNS topic, Kafka topic, or
    # Amazon S3 bucket. For more information, see [Adding a
    # destination](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-async-destinations).
    #
    # The following option is available only for DynamoDB and Kinesis event sources:
    #
    # - `ParallelizationFactor` – Process multiple batches from each shard concurrently.
    #
    # For information about which configuration parameters apply to each event source, see the
    # following topics.
    #
    # - [ Amazon DynamoDB
    # Streams](https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-ddb-params)
    #
    # - [ Amazon
    # Kinesis](https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-params)
    #
    # - [ Amazon SQS](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#services-sqs-params)
    #
    # - [ Amazon MQ and
    # RabbitMQ](https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-params)
    #
    # - [ Amazon MSK](https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-parms)
    #
    # - [ Apache
    # Kafka](https://docs.aws.amazon.com/lambda/latest/dg/with-kafka.html#services-kafka-parms)
    #
    # - [ Amazon
    # DocumentDB](https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html#docdb-configuration)
    def create_event_source_mapping(input : AL::CreateEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'CreateEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings"
      headers = HTTP::Headers.new
      response = rest_request("CreateEventSourceMapping", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    # Returns details about an event source mapping. You can get the identifier of a mapping from the
    # output of ListEventSourceMappings.
    def get_event_source_mapping(input : AL::GetEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'GetEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings/#{URI.encode_path_segment(input.uuid)}"
      headers = HTTP::Headers.new
      response = rest_request("GetEventSourceMapping", "GET", path, headers, nil)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    # Updates an event source mapping. You can change the function that Lambda invokes, or pause
    # invocation and resume later from the same location.
    #
    # For details about how to configure different event sources, see the following topics.
    #
    # - [ Amazon DynamoDB
    # Streams](https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-dynamodb-eventsourcemapping)
    #
    # - [ Amazon
    # Kinesis](https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-eventsourcemapping)
    #
    # - [ Amazon
    # SQS](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#events-sqs-eventsource)
    #
    # - [ Amazon MQ and
    # RabbitMQ](https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-eventsourcemapping)
    #
    # - [ Amazon MSK](https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html)
    #
    # - [ Apache Kafka](https://docs.aws.amazon.com/lambda/latest/dg/kafka-smaa.html)
    #
    # - [ Amazon DocumentDB](https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html)
    #
    # The following error handling options are available for stream sources (DynamoDB, Kinesis, Amazon
    # MSK, and self-managed Apache Kafka):
    #
    # - `BisectBatchOnFunctionError` – If the function returns an error, split the batch in two and
    # retry.
    #
    # - `MaximumRecordAgeInSeconds` – Discard records older than the specified age. The default value
    # is infinite (-1). When set to infinite (-1), failed records are retried until the record expires
    #
    # - `MaximumRetryAttempts` – Discard records after the specified number of retries. The default
    # value is infinite (-1). When set to infinite (-1), failed records are retried until the record
    # expires.
    #
    # - `OnFailure` – Send discarded records to an Amazon SQS queue, Amazon SNS topic, Kafka topic, or
    # Amazon S3 bucket. For more information, see [Adding a
    # destination](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async-retain-records.html#invocation-async-destinations).
    #
    # The following option is available only for DynamoDB and Kinesis event sources:
    #
    # - `ParallelizationFactor` – Process multiple batches from each shard concurrently.
    #
    # For information about which configuration parameters apply to each event source, see the
    # following topics.
    #
    # - [ Amazon DynamoDB
    # Streams](https://docs.aws.amazon.com/lambda/latest/dg/with-ddb.html#services-ddb-params)
    #
    # - [ Amazon
    # Kinesis](https://docs.aws.amazon.com/lambda/latest/dg/with-kinesis.html#services-kinesis-params)
    #
    # - [ Amazon SQS](https://docs.aws.amazon.com/lambda/latest/dg/with-sqs.html#services-sqs-params)
    #
    # - [ Amazon MQ and
    # RabbitMQ](https://docs.aws.amazon.com/lambda/latest/dg/with-mq.html#services-mq-params)
    #
    # - [ Amazon MSK](https://docs.aws.amazon.com/lambda/latest/dg/with-msk.html#services-msk-parms)
    #
    # - [ Apache
    # Kafka](https://docs.aws.amazon.com/lambda/latest/dg/with-kafka.html#services-kafka-parms)
    #
    # - [ Amazon
    # DocumentDB](https://docs.aws.amazon.com/lambda/latest/dg/with-documentdb.html#docdb-configuration)
    def update_event_source_mapping(input : AL::UpdateEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'UpdateEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings/#{URI.encode_path_segment(input.uuid)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateEventSourceMapping", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    # Deletes an [event source
    # mapping](https://docs.aws.amazon.com/lambda/latest/dg/intro-invocation-modes.html). You can get
    # the identifier of a mapping from the output of ListEventSourceMappings.
    #
    # When you delete an event source mapping, it enters a `Deleting` state and might not be
    # completely deleted for several seconds.
    def delete_event_source_mapping(input : AL::DeleteEventSourceMappingRequest) : Core::ParsedResponse(AL::EventSourceMappingConfiguration)
      Log.info { "performing 'DeleteEventSourceMapping' operation" }
      path = "/2015-03-31/event-source-mappings/#{URI.encode_path_segment(input.uuid)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteEventSourceMapping", "DELETE", path, headers, nil)
      Core::ParsedResponse(AL::EventSourceMappingConfiguration).new(response)
    end

    # Lists event source mappings. Specify an `EventSourceArn` to show only event source mappings for
    # a single event source.
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

    # Removes a concurrent execution limit from a function.
    def delete_function_concurrency(input : AL::DeleteFunctionConcurrencyRequest) : Core::Response
      Log.info { "performing 'DeleteFunctionConcurrency' operation" }
      path = "/2017-10-31/functions/#{URI.encode_path_segment(input.function_name)}/concurrency"
      headers = HTTP::Headers.new
      response = rest_request("DeleteFunctionConcurrency", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Returns details about the reserved concurrency configuration for a function. To set a
    # concurrency limit for a function, use PutFunctionConcurrency.
    def get_function_concurrency(input : AL::GetFunctionConcurrencyRequest) : Core::ParsedResponse(AL::GetFunctionConcurrencyResponse)
      Log.info { "performing 'GetFunctionConcurrency' operation" }
      path = "/2019-09-30/functions/#{URI.encode_path_segment(input.function_name)}/concurrency"
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionConcurrency", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionConcurrencyResponse).new(response)
    end

    # Retrieves a list of provisioned concurrency configurations for a function.
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

    # Sets the maximum number of simultaneous executions for a function, and reserves capacity for
    # that concurrency level.
    #
    # Concurrency settings apply to the function as a whole, including all published versions and the
    # unpublished version. Reserving concurrency both ensures that your function has capacity to
    # process the specified number of events simultaneously, and prevents it from scaling beyond that
    # level. Use GetFunction to see the current setting for a function.
    #
    # Use GetAccountSettings to see your Regional concurrency limit. You can reserve concurrency for
    # as many functions as you like, as long as you leave at least 100 simultaneous executions
    # unreserved for functions that aren't configured with a per-function limit. For more information,
    # see [Lambda function
    # scaling](https://docs.aws.amazon.com/lambda/latest/dg/invocation-scaling.html).
    def put_function_concurrency(input : AL::PutFunctionConcurrencyRequest) : Core::ParsedResponse(AL::Concurrency)
      Log.info { "performing 'PutFunctionConcurrency' operation" }
      path = "/2017-10-31/functions/#{URI.encode_path_segment(input.function_name)}/concurrency"
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionConcurrency", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::Concurrency).new(response)
    end

    # Updates a Lambda function's code. If code signing is enabled for the function, the code package
    # must be signed by a trusted publisher. For more information, see [Configuring code signing for
    # Lambda](https://docs.aws.amazon.com/lambda/latest/dg/configuration-codesigning.html).
    #
    # If the function's package type is `Image`, then you must specify the code package in `ImageUri`
    # as the URI of a [container
    # image](https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html) in the Amazon ECR
    # registry.
    #
    # If the function's package type is `Zip`, then you must specify the deployment package as a [.zip
    # file
    # archive](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html#gettingstarted-package-zip).
    # Enter the Amazon S3 bucket and key of the code .zip file location. You can also provide the
    # function code inline using the `ZipFile` field.
    #
    # The code in the deployment package must be compatible with the target instruction set
    # architecture of the function (`x86-64` or `arm64`).
    #
    # The function's code is locked when you publish a version. You can't modify the code of a
    # published version, only the unpublished version.
    #
    # For a function defined as a container image, Lambda resolves the image tag to an image digest.
    # In Amazon ECR, if you update the image tag to a new image, Lambda does not automatically update
    # the function.
    def update_function_code(input : AL::UpdateFunctionCodeRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'UpdateFunctionCode' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/code"
      headers = HTTP::Headers.new
      response = rest_request("UpdateFunctionCode", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    # Modify the version-specific settings of a Lambda function.
    #
    # When you update a function, Lambda provisions an instance of the function and its supporting
    # resources. If your function connects to a VPC, this process can take a minute. During this time,
    # you can't modify the function, but you can still invoke it. The `LastUpdateStatus`,
    # `LastUpdateStatusReason`, and `LastUpdateStatusReasonCode` fields in the response from
    # GetFunctionConfiguration indicate when the update is complete and the function is processing
    # events with the new configuration. For more information, see [Lambda function
    # states](https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html).
    #
    # These settings can vary between versions of a function and are locked when you publish a
    # version. You can't modify the configuration of a published version, only the unpublished
    # version.
    #
    # To configure function concurrency, use PutFunctionConcurrency. To grant invoke permissions to an
    # Amazon Web Services account or Amazon Web Services service, use AddPermission.
    def update_function_configuration(input : AL::UpdateFunctionConfigurationRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'UpdateFunctionConfiguration' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/configuration"
      headers = HTTP::Headers.new
      response = rest_request("UpdateFunctionConfiguration", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    # Creates a Lambda function URL with the specified configuration parameters. A function URL is a
    # dedicated HTTP(S) endpoint that you can use to invoke your function.
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

    # Removes the code signing configuration from the function.
    def delete_function_code_signing_config(input : AL::DeleteFunctionCodeSigningConfigRequest) : Core::Response
      Log.info { "performing 'DeleteFunctionCodeSigningConfig' operation" }
      path = "/2020-06-30/functions/#{URI.encode_path_segment(input.function_name)}/code-signing-config"
      headers = HTTP::Headers.new
      response = rest_request("DeleteFunctionCodeSigningConfig", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Deletes a Lambda function URL. When you delete a function URL, you can't recover it. Creating a
    # new function URL results in a different URL address.
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

    # Returns information about the function or function version, with a link to download the
    # deployment package that's valid for 10 minutes. If you specify a function version, only details
    # that are specific to that version are returned.
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

    # Returns the code signing configuration for the specified function.
    def get_function_code_signing_config(input : AL::GetFunctionCodeSigningConfigRequest) : Core::ParsedResponse(AL::GetFunctionCodeSigningConfigResponse)
      Log.info { "performing 'GetFunctionCodeSigningConfig' operation" }
      path = "/2020-06-30/functions/#{URI.encode_path_segment(input.function_name)}/code-signing-config"
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionCodeSigningConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionCodeSigningConfigResponse).new(response)
    end

    # Returns the version-specific settings of a Lambda function or version. The output includes only
    # options that can vary between versions of a function. To modify these settings, use
    # UpdateFunctionConfiguration.
    #
    # To get all of a function's details, including function-level settings, use GetFunction.
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

    # Returns your function's [recursive loop
    # detection](https://docs.aws.amazon.com/lambda/latest/dg/invocation-recursion.html)
    # configuration.
    def get_function_recursion_config(input : AL::GetFunctionRecursionConfigRequest) : Core::ParsedResponse(AL::GetFunctionRecursionConfigResponse)
      Log.info { "performing 'GetFunctionRecursionConfig' operation" }
      path = "/2024-08-31/functions/#{URI.encode_path_segment(input.function_name)}/recursion-config"
      headers = HTTP::Headers.new
      response = rest_request("GetFunctionRecursionConfig", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetFunctionRecursionConfigResponse).new(response)
    end

    # Retrieves the scaling configuration for a Lambda Managed Instances function.
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

    # Returns details about a Lambda function URL.
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

    # Returns the [resource-based IAM
    # policy](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html) for a
    # function, version, or alias.
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

    # Retrieves the runtime management configuration for a function's version. If the runtime update
    # mode is **Manual**, this includes the ARN of the runtime version and the runtime update mode. If
    # the runtime update mode is **Auto** or **Function update**, this includes the runtime update
    # mode and `null` is returned for the ARN. For more information, see [Runtime
    # updates](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html).
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

    # Invokes a Lambda function. You can invoke a function synchronously (and wait for the response),
    # or asynchronously. By default, Lambda invokes your function synchronously (i.e.
    # the`InvocationType` is `RequestResponse`). To invoke a function asynchronously, set
    # `InvocationType` to `Event`. Lambda passes the `ClientContext` object to your function for
    # synchronous invocations only.
    #
    # For synchronous invocations, the maximum payload size is 6 MB. For asynchronous invocations, the
    # maximum payload size is 1 MB.
    #
    # For [synchronous invocation](https://docs.aws.amazon.com/lambda/latest/dg/invocation-sync.html),
    # details about the function response, including errors, are included in the response body and
    # headers. For either invocation type, you can find more information in the [execution
    # log](https://docs.aws.amazon.com/lambda/latest/dg/monitoring-functions.html) and
    # [trace](https://docs.aws.amazon.com/lambda/latest/dg/lambda-x-ray.html).
    #
    # When an error occurs, your function may be invoked multiple times. Retry behavior varies by
    # error type, client, event source, and invocation type. For example, if you invoke a function
    # asynchronously and it returns an error, Lambda executes the function up to two more times. For
    # more information, see [Error handling and automatic retries in
    # Lambda](https://docs.aws.amazon.com/lambda/latest/dg/invocation-retries.html).
    #
    # For [asynchronous
    # invocation](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html), Lambda adds
    # events to a queue before sending them to your function. If your function does not have enough
    # capacity to keep up with the queue, events may be lost. Occasionally, your function may receive
    # the same event multiple times, even if no error occurs. To retain events that were not
    # processed, configure your function with a [dead-letter
    # queue](https://docs.aws.amazon.com/lambda/latest/dg/invocation-async.html#invocation-dlq).
    #
    # The status code in the API response doesn't reflect function errors. Error codes are reserved
    # for errors that prevent your function from executing, such as permissions errors,
    # [quota](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-limits.html) errors, or
    # issues with your function's code and configuration. For example, Lambda returns
    # `TooManyRequestsException` if running the function would cause you to exceed a concurrency limit
    # at either the account level (`ConcurrentInvocationLimitExceeded`) or function level
    # (`ReservedFunctionConcurrentInvocationLimitExceeded`).
    #
    # For functions with a long timeout, your client might disconnect during synchronous invocation
    # while it waits for a response. Configure your HTTP client, SDK, firewall, proxy, or operating
    # system to allow for long connections with timeout or keep-alive settings.
    #
    # This operation requires permission for the
    # [lambda:InvokeFunction](https://docs.aws.amazon.com/IAM/latest/UserGuide/list_awslambda.html)
    # action. For details on how to set up permissions for cross-account invocations, see [Granting
    # function access to other
    # accounts](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html#permissions-resource-xaccountinvoke).
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

    # For asynchronous function invocation, use Invoke.
    #
    # Invokes a function asynchronously.
    #
    # The payload limit is 256KB. For larger payloads, for up to 1MB, use Invoke.
    #
    # If you do use the InvokeAsync action, note that it doesn't support the use of X-Ray active
    # tracing. Trace ID is not propagated to the function, even if X-Ray active tracing is turned on.
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

    # Returns a list of [durable
    # executions](https://docs.aws.amazon.com/lambda/latest/dg/durable-functions.html) for a specified
    # Lambda function. You can filter the results by execution name, status, and start time range.
    # This API supports pagination for large result sets.
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

    # Returns a list of Lambda function URLs for the specified function.
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

    # Update the code signing configuration for the function. Changes to the code signing
    # configuration take effect the next time a user tries to deploy a code package to the function.
    def put_function_code_signing_config(input : AL::PutFunctionCodeSigningConfigRequest) : Core::ParsedResponse(AL::PutFunctionCodeSigningConfigResponse)
      Log.info { "performing 'PutFunctionCodeSigningConfig' operation" }
      path = "/2020-06-30/functions/#{URI.encode_path_segment(input.function_name)}/code-signing-config"
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionCodeSigningConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutFunctionCodeSigningConfigResponse).new(response)
    end

    # Sets your function's [recursive loop
    # detection](https://docs.aws.amazon.com/lambda/latest/dg/invocation-recursion.html)
    # configuration.
    #
    # When you configure a Lambda function to output to the same service or resource that invokes the
    # function, it's possible to create an infinite recursive loop. For example, a Lambda function
    # might write a message to an Amazon Simple Queue Service (Amazon SQS) queue, which then invokes
    # the same function. This invocation causes the function to write another message to the queue,
    # which in turn invokes the function again.
    #
    # Lambda can detect certain types of recursive loops shortly after they occur. When Lambda detects
    # a recursive loop and your function's recursive loop detection configuration is set to
    # `Terminate`, it stops your function being invoked and notifies you.
    def put_function_recursion_config(input : AL::PutFunctionRecursionConfigRequest) : Core::ParsedResponse(AL::PutFunctionRecursionConfigResponse)
      Log.info { "performing 'PutFunctionRecursionConfig' operation" }
      path = "/2024-08-31/functions/#{URI.encode_path_segment(input.function_name)}/recursion-config"
      headers = HTTP::Headers.new
      response = rest_request("PutFunctionRecursionConfig", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::PutFunctionRecursionConfigResponse).new(response)
    end

    # Sets the scaling configuration for a Lambda Managed Instances function. The scaling
    # configuration defines the minimum and maximum number of execution environments that can be
    # provisioned for the function, allowing you to control scaling behavior and resource allocation.
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

    # Sets the runtime management configuration for a function's version. For more information, see
    # [Runtime updates](https://docs.aws.amazon.com/lambda/latest/dg/runtimes-update.html).
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

    # Updates the configuration for a Lambda function URL.
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

    # Creates a Lambda function. To create a function, you need a [deployment
    # package](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html) and an
    # [execution
    # role](https://docs.aws.amazon.com/lambda/latest/dg/intro-permission-model.html#lambda-intro-execution-role).
    # The deployment package is a .zip file archive or container image that contains your function
    # code. The execution role grants the function permission to use Amazon Web Services services,
    # such as Amazon CloudWatch Logs for log streaming and X-Ray for request tracing.
    #
    # If the deployment package is a [container
    # image](https://docs.aws.amazon.com/lambda/latest/dg/lambda-images.html), then you set the
    # package type to `Image`. For a container image, the code property must include the URI of a
    # container image in the Amazon ECR registry. You do not need to specify the handler and runtime
    # properties.
    #
    # If the deployment package is a [.zip file
    # archive](https://docs.aws.amazon.com/lambda/latest/dg/gettingstarted-package.html#gettingstarted-package-zip),
    # then you set the package type to `Zip`. For a .zip file archive, the code property specifies the
    # location of the .zip file. You must also specify the handler and runtime properties. The code in
    # the deployment package must be compatible with the target instruction set architecture of the
    # function (`x86-64` or `arm64`). If you do not specify the architecture, then the default value
    # is `x86-64`.
    #
    # When you create a function, Lambda provisions an instance of the function and its supporting
    # resources. If your function connects to a VPC, this process can take a minute or so. During this
    # time, you can't invoke or modify the function. The `State`, `StateReason`, and `StateReasonCode`
    # fields in the response from GetFunctionConfiguration indicate when the function is ready to
    # invoke. For more information, see [Lambda function
    # states](https://docs.aws.amazon.com/lambda/latest/dg/functions-states.html).
    #
    # A function has an unpublished version, and can have published versions and aliases. The
    # unpublished version changes when you update your function's code and configuration. A published
    # version is a snapshot of your function code and configuration that can't be changed. An alias is
    # a named resource that maps to a version, and can be changed to map to a different version. Use
    # the `Publish` parameter to create version `1` of your function from its initial configuration.
    #
    # The other parameters let you configure version-specific and function-level settings. You can
    # modify version-specific settings later with UpdateFunctionConfiguration. Function-level settings
    # apply to both the unpublished and published versions of the function, and include tags
    # (TagResource) and per-function concurrency limits (PutFunctionConcurrency).
    #
    # You can use code signing if your deployment package is a .zip file archive. To enable code
    # signing for this function, specify the ARN of a code-signing configuration. When a user attempts
    # to deploy a code package with UpdateFunctionCode, Lambda checks that the code package has a
    # valid signature from a trusted publisher. The code-signing configuration includes set of signing
    # profiles, which define the trusted publishers for this function.
    #
    # If another Amazon Web Services account or an Amazon Web Services service invokes your function,
    # use AddPermission to grant permission by creating a resource-based Identity and Access
    # Management (IAM) policy. You can grant permissions at the function level, on a version, or on an
    # alias.
    #
    # To invoke your function directly, use Invoke. To invoke your function in response to events in
    # other Amazon Web Services services, create an event source mapping (CreateEventSourceMapping),
    # or configure a function trigger in the other service. For more information, see [Invoking Lambda
    # functions](https://docs.aws.amazon.com/lambda/latest/dg/lambda-invocation.html).
    def create_function(input : AL::CreateFunctionRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'CreateFunction' operation" }
      path = "/2015-03-31/functions"
      headers = HTTP::Headers.new
      response = rest_request("CreateFunction", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    # Returns a list of Lambda functions, with the version-specific configuration of each. Lambda
    # returns up to 50 functions per call.
    #
    # Set `FunctionVersion` to `ALL` to include all published versions of each function in addition to
    # the unpublished version.
    #
    # The `ListFunctions` operation returns a subset of the FunctionConfiguration fields. To get the
    # additional fields (State, StateReasonCode, StateReason, LastUpdateStatus,
    # LastUpdateStatusReason, LastUpdateStatusReasonCode, RuntimeVersionConfig) for a function or
    # version, use GetFunction.
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

    # Creates an [alias](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html) for
    # a Lambda function version. Use aliases to provide clients with a function identifier that you
    # can update to invoke a different version.
    #
    # You can also map an alias to split invocation requests between two versions. Use the
    # `RoutingConfig` parameter to specify a second version and the percentage of invocation requests
    # that it receives.
    def create_alias(input : AL::CreateAliasRequest) : Core::ParsedResponse(AL::AliasConfiguration)
      Log.info { "performing 'CreateAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases"
      headers = HTTP::Headers.new
      response = rest_request("CreateAlias", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::AliasConfiguration).new(response)
    end

    # Returns details about a Lambda function
    # [alias](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html).
    def get_alias(input : AL::GetAliasRequest) : Core::ParsedResponse(AL::AliasConfiguration)
      Log.info { "performing 'GetAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases/#{URI.encode_path_segment(input.name)}"
      headers = HTTP::Headers.new
      response = rest_request("GetAlias", "GET", path, headers, nil)
      Core::ParsedResponse(AL::AliasConfiguration).new(response)
    end

    # Updates the configuration of a Lambda function
    # [alias](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html).
    def update_alias(input : AL::UpdateAliasRequest) : Core::ParsedResponse(AL::AliasConfiguration)
      Log.info { "performing 'UpdateAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases/#{URI.encode_path_segment(input.name)}"
      headers = HTTP::Headers.new
      response = rest_request("UpdateAlias", "PUT", path, headers, input.to_json)
      Core::ParsedResponse(AL::AliasConfiguration).new(response)
    end

    # Deletes a Lambda function
    # [alias](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html).
    def delete_alias(input : AL::DeleteAliasRequest) : Core::Response
      Log.info { "performing 'DeleteAlias' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/aliases/#{URI.encode_path_segment(input.name)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteAlias", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Returns a list of
    # [aliases](https://docs.aws.amazon.com/lambda/latest/dg/configuration-aliases.html) for a Lambda
    # function.
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

    # Returns a list of
    # [versions](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html), with the
    # version-specific configuration of each. Lambda returns up to 50 versions per call.
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

    # Creates a [version](https://docs.aws.amazon.com/lambda/latest/dg/versioning-aliases.html) from
    # the current code and configuration of a function. Use versions to create a snapshot of your
    # function code and configuration that doesn't change.
    #
    # Lambda doesn't publish a version if the function's configuration and code haven't changed since
    # the last version. Use UpdateFunctionCode or UpdateFunctionConfiguration to update the function
    # before publishing a version.
    #
    # Clients can invoke versions directly or with an alias. To create an alias, use CreateAlias.
    def publish_version(input : AL::PublishVersionRequest) : Core::ParsedResponse(AL::FunctionConfiguration)
      Log.info { "performing 'PublishVersion' operation" }
      path = "/2015-03-31/functions/#{URI.encode_path_segment(input.function_name)}/versions"
      headers = HTTP::Headers.new
      response = rest_request("PublishVersion", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::FunctionConfiguration).new(response)
    end

    # Lists [Lambda layers](https://docs.aws.amazon.com/lambda/latest/dg/invocation-layers.html) and
    # shows information about the latest version of each. Specify a [runtime
    # identifier](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) to list only
    # layers that indicate that they're compatible with that runtime. Specify a compatible
    # architecture to include only layers that are compatible with that [instruction set
    # architecture](https://docs.aws.amazon.com/lambda/latest/dg/foundation-arch.html).
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

    # Adds permissions to the resource-based policy of a version of an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html). Use this action
    # to grant layer usage permission to other accounts. You can grant permission to a single account,
    # all accounts in an organization, or all Amazon Web Services accounts.
    #
    # To revoke permission, call RemoveLayerVersionPermission with the statement ID that you specified
    # when you added it.
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

    # Deletes a version of an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html). Deleted versions
    # can no longer be viewed or added to functions. To avoid breaking functions, a copy of the
    # version remains in Lambda until no functions refer to it.
    def delete_layer_version(input : AL::DeleteLayerVersionRequest) : Core::Response
      Log.info { "performing 'DeleteLayerVersion' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}"
      headers = HTTP::Headers.new
      response = rest_request("DeleteLayerVersion", "DELETE", path, headers, nil)
      Core::Response.new(response)
    end

    # Returns information about a version of an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html), with a link to
    # download the layer archive that's valid for 10 minutes.
    def get_layer_version(input : AL::GetLayerVersionRequest) : Core::ParsedResponse(AL::GetLayerVersionResponse)
      Log.info { "performing 'GetLayerVersion' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}"
      headers = HTTP::Headers.new
      response = rest_request("GetLayerVersion", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetLayerVersionResponse).new(response)
    end

    # Returns information about a version of an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html), with a link to
    # download the layer archive that's valid for 10 minutes.
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

    # Returns the permission policy for a version of an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html). For more
    # information, see AddLayerVersionPermission.
    def get_layer_version_policy(input : AL::GetLayerVersionPolicyRequest) : Core::ParsedResponse(AL::GetLayerVersionPolicyResponse)
      Log.info { "performing 'GetLayerVersionPolicy' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions/#{URI.encode_path_segment(input.version_number)}/policy"
      headers = HTTP::Headers.new
      response = rest_request("GetLayerVersionPolicy", "GET", path, headers, nil)
      Core::ParsedResponse(AL::GetLayerVersionPolicyResponse).new(response)
    end

    # Creates an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) from a ZIP
    # archive. Each time you call `PublishLayerVersion` with the same layer name, a new version is
    # created.
    #
    # Add layers to your function with CreateFunction or UpdateFunctionConfiguration.
    def publish_layer_version(input : AL::PublishLayerVersionRequest) : Core::ParsedResponse(AL::PublishLayerVersionResponse)
      Log.info { "performing 'PublishLayerVersion' operation" }
      path = "/2018-10-31/layers/#{URI.encode_path_segment(input.layer_name)}/versions"
      headers = HTTP::Headers.new
      response = rest_request("PublishLayerVersion", "POST", path, headers, input.to_json)
      Core::ParsedResponse(AL::PublishLayerVersionResponse).new(response)
    end

    # Removes a statement from the permissions policy for a version of an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html). For more
    # information, see AddLayerVersionPermission.
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

    # Lists the versions of an [Lambda
    # layer](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html). Versions that
    # have been deleted aren't listed. Specify a [runtime
    # identifier](https://docs.aws.amazon.com/lambda/latest/dg/lambda-runtimes.html) to list only
    # versions that indicate that they're compatible with that runtime. Specify a compatible
    # architecture to include only layer versions that are compatible with that architecture.
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

    # Grants a
    # [principal](https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_elements_principal.html#Principal_specifying)
    # permission to use a function. You can apply the policy at the function level, or specify a
    # qualifier to restrict access to a single version or alias. If you use a qualifier, the invoker
    # must use the full Amazon Resource Name (ARN) of that version or alias to invoke the function.
    # Note: Lambda does not support adding policies to version $LATEST.
    #
    # To grant permission to another account, specify the account ID as the `Principal`. To grant
    # permission to an organization defined in Organizations, specify the organization ID as the
    # `PrincipalOrgID`. For Amazon Web Services services, the principal is a domain-style identifier
    # that the service defines, such as `s3.amazonaws.com` or `sns.amazonaws.com`. For Amazon Web
    # Services services, you can also specify the ARN of the associated resource as the `SourceArn`.
    # If you grant permission to a service principal without specifying the source, other accounts
    # could potentially configure resources in their account to invoke your Lambda function.
    #
    # This operation adds a statement to a resource-based permissions policy for the function. For
    # more information about function policies, see [Using resource-based policies for
    # Lambda](https://docs.aws.amazon.com/lambda/latest/dg/access-control-resource-based.html).
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

    # Revokes function-use permission from an Amazon Web Services service or another Amazon Web
    # Services account. You can get the ID of the statement from the output of GetPolicy.
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

    # Adds a provisioned concurrency configuration to a function's alias or version.
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

    # Retrieves the provisioned concurrency configuration for a function's alias or version.
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

    # Deletes the provisioned concurrency configuration for a function.
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
