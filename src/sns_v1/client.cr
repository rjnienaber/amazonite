private alias AS = Amazonite::SnsV1
private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.sns_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonSimpleNotificationService", "sns", "1.0", EXCEPTION_FACTORY, config)
    end

    def add_permission(input : AS::AddPermissionInput) : Core::Response
      Log.info { "performing 'AddPermission' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AddPermission")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AddPermission", body)
      Core::Response.new(response)
    end

    def check_if_phone_number_is_opted_out(input : AS::CheckIfPhoneNumberIsOptedOutInput) : Core::ParsedResponse(AS::CheckIfPhoneNumberIsOptedOutResponse)
      Log.info { "performing 'CheckIfPhoneNumberIsOptedOut' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CheckIfPhoneNumberIsOptedOut")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CheckIfPhoneNumberIsOptedOut", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CheckIfPhoneNumberIsOptedOutResult']").not_nil!
      result = AS::CheckIfPhoneNumberIsOptedOutResponse.from_xml(result_node)
      Core::ParsedResponse(AS::CheckIfPhoneNumberIsOptedOutResponse).new(response, result)
    end

    def confirm_subscription(input : AS::ConfirmSubscriptionInput) : Core::ParsedResponse(AS::ConfirmSubscriptionResponse)
      Log.info { "performing 'ConfirmSubscription' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ConfirmSubscription")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ConfirmSubscription", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ConfirmSubscriptionResult']").not_nil!
      result = AS::ConfirmSubscriptionResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ConfirmSubscriptionResponse).new(response, result)
    end

    def create_platform_application(input : AS::CreatePlatformApplicationInput) : Core::ParsedResponse(AS::CreatePlatformApplicationResponse)
      Log.info { "performing 'CreatePlatformApplication' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreatePlatformApplication")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreatePlatformApplication", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreatePlatformApplicationResult']").not_nil!
      result = AS::CreatePlatformApplicationResponse.from_xml(result_node)
      Core::ParsedResponse(AS::CreatePlatformApplicationResponse).new(response, result)
    end

    def create_platform_endpoint(input : AS::CreatePlatformEndpointInput) : Core::ParsedResponse(AS::CreateEndpointResponse)
      Log.info { "performing 'CreatePlatformEndpoint' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreatePlatformEndpoint")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreatePlatformEndpoint", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreatePlatformEndpointResult']").not_nil!
      result = AS::CreateEndpointResponse.from_xml(result_node)
      Core::ParsedResponse(AS::CreateEndpointResponse).new(response, result)
    end

    def create_sms_sandbox_phone_number(input : AS::CreateSMSSandboxPhoneNumberInput) : Core::ParsedResponse(AS::CreateSMSSandboxPhoneNumberResult)
      Log.info { "performing 'CreateSMSSandboxPhoneNumber' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateSMSSandboxPhoneNumber")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateSMSSandboxPhoneNumber", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateSMSSandboxPhoneNumberResult']").not_nil!
      result = AS::CreateSMSSandboxPhoneNumberResult.from_xml(result_node)
      Core::ParsedResponse(AS::CreateSMSSandboxPhoneNumberResult).new(response, result)
    end

    def create_topic(input : AS::CreateTopicInput) : Core::ParsedResponse(AS::CreateTopicResponse)
      Log.info { "performing 'CreateTopic' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "CreateTopic")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("CreateTopic", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='CreateTopicResult']").not_nil!
      result = AS::CreateTopicResponse.from_xml(result_node)
      Core::ParsedResponse(AS::CreateTopicResponse).new(response, result)
    end

    def delete_endpoint(input : AS::DeleteEndpointInput) : Core::Response
      Log.info { "performing 'DeleteEndpoint' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteEndpoint")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteEndpoint", body)
      Core::Response.new(response)
    end

    def delete_platform_application(input : AS::DeletePlatformApplicationInput) : Core::Response
      Log.info { "performing 'DeletePlatformApplication' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeletePlatformApplication")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeletePlatformApplication", body)
      Core::Response.new(response)
    end

    def delete_sms_sandbox_phone_number(input : AS::DeleteSMSSandboxPhoneNumberInput) : Core::ParsedResponse(AS::DeleteSMSSandboxPhoneNumberResult)
      Log.info { "performing 'DeleteSMSSandboxPhoneNumber' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteSMSSandboxPhoneNumber")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteSMSSandboxPhoneNumber", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DeleteSMSSandboxPhoneNumberResult']").not_nil!
      result = AS::DeleteSMSSandboxPhoneNumberResult.from_xml(result_node)
      Core::ParsedResponse(AS::DeleteSMSSandboxPhoneNumberResult).new(response, result)
    end

    def delete_topic(input : AS::DeleteTopicInput) : Core::Response
      Log.info { "performing 'DeleteTopic' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DeleteTopic")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DeleteTopic", body)
      Core::Response.new(response)
    end

    def get_data_protection_policy(input : AS::GetDataProtectionPolicyInput) : Core::ParsedResponse(AS::GetDataProtectionPolicyResponse)
      Log.info { "performing 'GetDataProtectionPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetDataProtectionPolicy")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetDataProtectionPolicy", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetDataProtectionPolicyResult']").not_nil!
      result = AS::GetDataProtectionPolicyResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetDataProtectionPolicyResponse).new(response, result)
    end

    def get_endpoint_attributes(input : AS::GetEndpointAttributesInput) : Core::ParsedResponse(AS::GetEndpointAttributesResponse)
      Log.info { "performing 'GetEndpointAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetEndpointAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetEndpointAttributes", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetEndpointAttributesResult']").not_nil!
      result = AS::GetEndpointAttributesResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetEndpointAttributesResponse).new(response, result)
    end

    def get_platform_application_attributes(input : AS::GetPlatformApplicationAttributesInput) : Core::ParsedResponse(AS::GetPlatformApplicationAttributesResponse)
      Log.info { "performing 'GetPlatformApplicationAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetPlatformApplicationAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetPlatformApplicationAttributes", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetPlatformApplicationAttributesResult']").not_nil!
      result = AS::GetPlatformApplicationAttributesResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetPlatformApplicationAttributesResponse).new(response, result)
    end

    def get_sms_attributes(input : AS::GetSMSAttributesInput) : Core::ParsedResponse(AS::GetSMSAttributesResponse)
      Log.info { "performing 'GetSMSAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetSMSAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetSMSAttributes", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetSMSAttributesResult']").not_nil!
      result = AS::GetSMSAttributesResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetSMSAttributesResponse).new(response, result)
    end

    def get_sms_sandbox_account_status(input : AS::GetSMSSandboxAccountStatusInput) : Core::ParsedResponse(AS::GetSMSSandboxAccountStatusResult)
      Log.info { "performing 'GetSMSSandboxAccountStatus' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetSMSSandboxAccountStatus")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetSMSSandboxAccountStatus", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetSMSSandboxAccountStatusResult']").not_nil!
      result = AS::GetSMSSandboxAccountStatusResult.from_xml(result_node)
      Core::ParsedResponse(AS::GetSMSSandboxAccountStatusResult).new(response, result)
    end

    def get_subscription_attributes(input : AS::GetSubscriptionAttributesInput) : Core::ParsedResponse(AS::GetSubscriptionAttributesResponse)
      Log.info { "performing 'GetSubscriptionAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetSubscriptionAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetSubscriptionAttributes", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetSubscriptionAttributesResult']").not_nil!
      result = AS::GetSubscriptionAttributesResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetSubscriptionAttributesResponse).new(response, result)
    end

    def get_topic_attributes(input : AS::GetTopicAttributesInput) : Core::ParsedResponse(AS::GetTopicAttributesResponse)
      Log.info { "performing 'GetTopicAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetTopicAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetTopicAttributes", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetTopicAttributesResult']").not_nil!
      result = AS::GetTopicAttributesResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetTopicAttributesResponse).new(response, result)
    end

    def list_endpoints_by_platform_application(input : AS::ListEndpointsByPlatformApplicationInput) : Core::ParsedResponse(AS::ListEndpointsByPlatformApplicationResponse)
      Log.info { "performing 'ListEndpointsByPlatformApplication' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListEndpointsByPlatformApplication")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListEndpointsByPlatformApplication", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListEndpointsByPlatformApplicationResult']").not_nil!
      result = AS::ListEndpointsByPlatformApplicationResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ListEndpointsByPlatformApplicationResponse).new(response, result)
    end

    def list_origination_numbers(input : AS::ListOriginationNumbersRequest) : Core::ParsedResponse(AS::ListOriginationNumbersResult)
      Log.info { "performing 'ListOriginationNumbers' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListOriginationNumbers")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListOriginationNumbers", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListOriginationNumbersResult']").not_nil!
      result = AS::ListOriginationNumbersResult.from_xml(result_node)
      Core::ParsedResponse(AS::ListOriginationNumbersResult).new(response, result)
    end

    def list_phone_numbers_opted_out(input : AS::ListPhoneNumbersOptedOutInput) : Core::ParsedResponse(AS::ListPhoneNumbersOptedOutResponse)
      Log.info { "performing 'ListPhoneNumbersOptedOut' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListPhoneNumbersOptedOut")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListPhoneNumbersOptedOut", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListPhoneNumbersOptedOutResult']").not_nil!
      result = AS::ListPhoneNumbersOptedOutResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ListPhoneNumbersOptedOutResponse).new(response, result)
    end

    def list_platform_applications(input : AS::ListPlatformApplicationsInput) : Core::ParsedResponse(AS::ListPlatformApplicationsResponse)
      Log.info { "performing 'ListPlatformApplications' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListPlatformApplications")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListPlatformApplications", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListPlatformApplicationsResult']").not_nil!
      result = AS::ListPlatformApplicationsResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ListPlatformApplicationsResponse).new(response, result)
    end

    def list_sms_sandbox_phone_numbers(input : AS::ListSMSSandboxPhoneNumbersInput) : Core::ParsedResponse(AS::ListSMSSandboxPhoneNumbersResult)
      Log.info { "performing 'ListSMSSandboxPhoneNumbers' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListSMSSandboxPhoneNumbers")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListSMSSandboxPhoneNumbers", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListSMSSandboxPhoneNumbersResult']").not_nil!
      result = AS::ListSMSSandboxPhoneNumbersResult.from_xml(result_node)
      Core::ParsedResponse(AS::ListSMSSandboxPhoneNumbersResult).new(response, result)
    end

    def list_subscriptions(input : AS::ListSubscriptionsInput) : Core::ParsedResponse(AS::ListSubscriptionsResponse)
      Log.info { "performing 'ListSubscriptions' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListSubscriptions")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListSubscriptions", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListSubscriptionsResult']").not_nil!
      result = AS::ListSubscriptionsResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ListSubscriptionsResponse).new(response, result)
    end

    def list_subscriptions_by_topic(input : AS::ListSubscriptionsByTopicInput) : Core::ParsedResponse(AS::ListSubscriptionsByTopicResponse)
      Log.info { "performing 'ListSubscriptionsByTopic' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListSubscriptionsByTopic")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListSubscriptionsByTopic", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListSubscriptionsByTopicResult']").not_nil!
      result = AS::ListSubscriptionsByTopicResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ListSubscriptionsByTopicResponse).new(response, result)
    end

    def list_tags_for_resource(input : AS::ListTagsForResourceRequest) : Core::ParsedResponse(AS::ListTagsForResourceResponse)
      Log.info { "performing 'ListTagsForResource' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListTagsForResource")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListTagsForResource", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListTagsForResourceResult']").not_nil!
      result = AS::ListTagsForResourceResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ListTagsForResourceResponse).new(response, result)
    end

    def list_topics(input : AS::ListTopicsInput) : Core::ParsedResponse(AS::ListTopicsResponse)
      Log.info { "performing 'ListTopics' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "ListTopics")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("ListTopics", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='ListTopicsResult']").not_nil!
      result = AS::ListTopicsResponse.from_xml(result_node)
      Core::ParsedResponse(AS::ListTopicsResponse).new(response, result)
    end

    def opt_in_phone_number(input : AS::OptInPhoneNumberInput) : Core::ParsedResponse(AS::OptInPhoneNumberResponse)
      Log.info { "performing 'OptInPhoneNumber' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "OptInPhoneNumber")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("OptInPhoneNumber", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='OptInPhoneNumberResult']").not_nil!
      result = AS::OptInPhoneNumberResponse.from_xml(result_node)
      Core::ParsedResponse(AS::OptInPhoneNumberResponse).new(response, result)
    end

    def publish(input : AS::PublishInput) : Core::ParsedResponse(AS::PublishResponse)
      Log.info { "performing 'Publish' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "Publish")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("Publish", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='PublishResult']").not_nil!
      result = AS::PublishResponse.from_xml(result_node)
      Core::ParsedResponse(AS::PublishResponse).new(response, result)
    end

    def publish_batch(input : AS::PublishBatchInput) : Core::ParsedResponse(AS::PublishBatchResponse)
      Log.info { "performing 'PublishBatch' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PublishBatch")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PublishBatch", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='PublishBatchResult']").not_nil!
      result = AS::PublishBatchResponse.from_xml(result_node)
      Core::ParsedResponse(AS::PublishBatchResponse).new(response, result)
    end

    def put_data_protection_policy(input : AS::PutDataProtectionPolicyInput) : Core::Response
      Log.info { "performing 'PutDataProtectionPolicy' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "PutDataProtectionPolicy")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("PutDataProtectionPolicy", body)
      Core::Response.new(response)
    end

    def remove_permission(input : AS::RemovePermissionInput) : Core::Response
      Log.info { "performing 'RemovePermission' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "RemovePermission")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("RemovePermission", body)
      Core::Response.new(response)
    end

    def set_endpoint_attributes(input : AS::SetEndpointAttributesInput) : Core::Response
      Log.info { "performing 'SetEndpointAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetEndpointAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetEndpointAttributes", body)
      Core::Response.new(response)
    end

    def set_platform_application_attributes(input : AS::SetPlatformApplicationAttributesInput) : Core::Response
      Log.info { "performing 'SetPlatformApplicationAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetPlatformApplicationAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetPlatformApplicationAttributes", body)
      Core::Response.new(response)
    end

    def set_sms_attributes(input : AS::SetSMSAttributesInput) : Core::ParsedResponse(AS::SetSMSAttributesResponse)
      Log.info { "performing 'SetSMSAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetSMSAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetSMSAttributes", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='SetSMSAttributesResult']").not_nil!
      result = AS::SetSMSAttributesResponse.from_xml(result_node)
      Core::ParsedResponse(AS::SetSMSAttributesResponse).new(response, result)
    end

    def set_subscription_attributes(input : AS::SetSubscriptionAttributesInput) : Core::Response
      Log.info { "performing 'SetSubscriptionAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetSubscriptionAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetSubscriptionAttributes", body)
      Core::Response.new(response)
    end

    def set_topic_attributes(input : AS::SetTopicAttributesInput) : Core::Response
      Log.info { "performing 'SetTopicAttributes' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "SetTopicAttributes")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("SetTopicAttributes", body)
      Core::Response.new(response)
    end

    def subscribe(input : AS::SubscribeInput) : Core::ParsedResponse(AS::SubscribeResponse)
      Log.info { "performing 'Subscribe' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "Subscribe")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("Subscribe", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='SubscribeResult']").not_nil!
      result = AS::SubscribeResponse.from_xml(result_node)
      Core::ParsedResponse(AS::SubscribeResponse).new(response, result)
    end

    def tag_resource(input : AS::TagResourceRequest) : Core::ParsedResponse(AS::TagResourceResponse)
      Log.info { "performing 'TagResource' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "TagResource")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("TagResource", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='TagResourceResult']").not_nil!
      result = AS::TagResourceResponse.from_xml(result_node)
      Core::ParsedResponse(AS::TagResourceResponse).new(response, result)
    end

    def unsubscribe(input : AS::UnsubscribeInput) : Core::Response
      Log.info { "performing 'Unsubscribe' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "Unsubscribe")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("Unsubscribe", body)
      Core::Response.new(response)
    end

    def untag_resource(input : AS::UntagResourceRequest) : Core::ParsedResponse(AS::UntagResourceResponse)
      Log.info { "performing 'UntagResource' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "UntagResource")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("UntagResource", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='UntagResourceResult']").not_nil!
      result = AS::UntagResourceResponse.from_xml(result_node)
      Core::ParsedResponse(AS::UntagResourceResponse).new(response, result)
    end

    def verify_sms_sandbox_phone_number(input : AS::VerifySMSSandboxPhoneNumberInput) : Core::ParsedResponse(AS::VerifySMSSandboxPhoneNumberResult)
      Log.info { "performing 'VerifySMSSandboxPhoneNumber' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "VerifySMSSandboxPhoneNumber")
        form.add("Version", "2010-03-31")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("VerifySMSSandboxPhoneNumber", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='VerifySMSSandboxPhoneNumberResult']").not_nil!
      result = AS::VerifySMSSandboxPhoneNumberResult.from_xml(result_node)
      Core::ParsedResponse(AS::VerifySMSSandboxPhoneNumberResult).new(response, result)
    end
  end
end
