private alias AS = Amazonite::SnsV1
private alias Core = Amazonite::Core

module Amazonite::SnsV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.sns_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AmazonSimpleNotificationService", "sns", "1.0", EXCEPTION_FACTORY, config)
    end

    # Adds a statement to a topic's access control policy, granting access for the specified Amazon
    # Web Services accounts to the specified actions.
    #
    # To remove the ability to change topic permissions, you must deny permissions to the
    # `AddPermission`, `RemovePermission`, and `SetTopicAttributes` actions in your IAM policy.
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

    # Accepts a phone number and indicates whether the phone holder has opted out of receiving SMS
    # messages from your Amazon Web Services account. You cannot send SMS messages to a number that is
    # opted out.
    #
    # To resume sending messages, you can opt in the number by using the `OptInPhoneNumber` action.
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

    # Verifies an endpoint owner's intent to receive messages by validating the token sent to the
    # endpoint by an earlier `Subscribe` action. If the token is valid, the action creates a new
    # subscription and returns its Amazon Resource Name (ARN). This call requires an AWS signature
    # only when the `AuthenticateOnUnsubscribe` flag is set to "true".
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

    # Creates a platform application object for one of the supported push notification services, such
    # as APNS and GCM (Firebase Cloud Messaging), to which devices and mobile apps may register. You
    # must specify `PlatformPrincipal` and `PlatformCredential` attributes when using the
    # `CreatePlatformApplication` action.
    #
    # `PlatformPrincipal` and `PlatformCredential` are received from the notification service.
    #
    # - For ADM, `PlatformPrincipal` is `client id` and `PlatformCredential` is `client secret`.
    #
    # - For APNS and `APNS_SANDBOX` using certificate credentials, `PlatformPrincipal` is `SSL
    # certificate` and `PlatformCredential` is `private key`.
    #
    # - For APNS and `APNS_SANDBOX` using token credentials, `PlatformPrincipal` is `signing key ID`
    # and `PlatformCredential` is `signing key`.
    #
    # - For Baidu, `PlatformPrincipal` is `API key` and `PlatformCredential` is `secret key`.
    #
    # - For GCM (Firebase Cloud Messaging) using key credentials, there is no `PlatformPrincipal`. The
    # `PlatformCredential` is `API key`.
    #
    # - For GCM (Firebase Cloud Messaging) using token credentials, there is no `PlatformPrincipal`.
    # The `PlatformCredential` is a JSON formatted private key file. When using the Amazon Web
    # Services CLI or Amazon Web Services SDKs, the file must be in string format and special
    # characters must be ignored. To format the file correctly, Amazon SNS recommends using the
    # following command: `SERVICE_JSON=$(jq @json < service.json)`.
    #
    # - For MPNS, `PlatformPrincipal` is `TLS certificate` and `PlatformCredential` is `private key`.
    #
    # - For WNS, `PlatformPrincipal` is `Package Security Identifier` and `PlatformCredential` is
    # `secret key`.
    #
    # You can use the returned `PlatformApplicationArn` as an attribute for the
    # `CreatePlatformEndpoint` action.
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

    # Creates an endpoint for a device and mobile app on one of the supported push notification
    # services, such as GCM (Firebase Cloud Messaging) and APNS. `CreatePlatformEndpoint` requires the
    # `PlatformApplicationArn` that is returned from `CreatePlatformApplication`. You can use the
    # returned `EndpointArn` to send a message to a mobile app or by the `Subscribe` action for
    # subscription to a topic. The `CreatePlatformEndpoint` action is idempotent, so if the requester
    # already owns an endpoint with the same device token and attributes, that endpoint's ARN is
    # returned without creating a new endpoint. For more information, see [Using Amazon SNS Mobile
    # Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
    #
    # When using `CreatePlatformEndpoint` with Baidu, two attributes must be provided: ChannelId and
    # UserId. The token field must also contain the ChannelId. For more information, see [Creating an
    # Amazon SNS Endpoint for
    # Baidu](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePushBaiduEndpoint.html).
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

    # Adds a destination phone number to an Amazon Web Services account in the SMS sandbox and sends a
    # one-time password (OTP) to that phone number.
    #
    # When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the
    # *SMS sandbox*. The SMS sandbox provides a safe environment for you to try Amazon SNS features
    # without risking your reputation as an SMS sender. While your Amazon Web Services account is in
    # the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS
    # messages only to verified destination phone numbers. For more information, including how to move
    # out of the sandbox to send messages without restrictions, see [SMS
    # sandbox](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) in the *Amazon SNS
    # Developer Guide*.
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

    # Creates a topic to which notifications can be published. Users can create at most 100,000
    # standard topics (at most 1,000 FIFO topics). For more information, see [Creating an Amazon SNS
    # topic](https://docs.aws.amazon.com/sns/latest/dg/sns-create-topic.html) in the *Amazon SNS
    # Developer Guide*. This action is idempotent, so if the requester already owns a topic with the
    # specified name, that topic's ARN is returned without creating a new topic.
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

    # Deletes the endpoint for a device and mobile app from Amazon SNS. This action is idempotent. For
    # more information, see [Using Amazon SNS Mobile Push
    # Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
    #
    # When you delete an endpoint that is also subscribed to a topic, then you must also unsubscribe
    # the endpoint from the topic.
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

    # Deletes a platform application object for one of the supported push notification services, such
    # as APNS and GCM (Firebase Cloud Messaging). For more information, see [Using Amazon SNS Mobile
    # Push Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
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

    # Deletes an Amazon Web Services account's verified or pending phone number from the SMS sandbox.
    #
    # When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the
    # *SMS sandbox*. The SMS sandbox provides a safe environment for you to try Amazon SNS features
    # without risking your reputation as an SMS sender. While your Amazon Web Services account is in
    # the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS
    # messages only to verified destination phone numbers. For more information, including how to move
    # out of the sandbox to send messages without restrictions, see [SMS
    # sandbox](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) in the *Amazon SNS
    # Developer Guide*.
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

    # Deletes a topic and all its subscriptions. Deleting a topic might prevent some messages
    # previously sent to the topic from being delivered to subscribers. This action is idempotent, so
    # deleting a topic that does not exist does not result in an error.
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

    # Retrieves the specified inline `DataProtectionPolicy` document that is stored in the specified
    # Amazon SNS topic.
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

    # Retrieves the endpoint attributes for a device on one of the supported push notification
    # services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see [Using
    # Amazon SNS Mobile Push
    # Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
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

    # Retrieves the attributes of the platform application object for the supported push notification
    # services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see [Using
    # Amazon SNS Mobile Push
    # Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
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

    # Returns the settings for sending SMS messages from your Amazon Web Services account.
    #
    # These settings are set with the `SetSMSAttributes` action.
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

    # Retrieves the SMS sandbox status for the calling Amazon Web Services account in the target
    # Amazon Web Services Region.
    #
    # When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the
    # *SMS sandbox*. The SMS sandbox provides a safe environment for you to try Amazon SNS features
    # without risking your reputation as an SMS sender. While your Amazon Web Services account is in
    # the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS
    # messages only to verified destination phone numbers. For more information, including how to move
    # out of the sandbox to send messages without restrictions, see [SMS
    # sandbox](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) in the *Amazon SNS
    # Developer Guide*.
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

    # Returns all of the properties of a subscription.
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

    # Returns all of the properties of a topic. Topic properties returned might differ based on the
    # authorization of the user.
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

    # Lists the endpoints and endpoint attributes for devices in a supported push notification
    # service, such as GCM (Firebase Cloud Messaging) and APNS. The results for
    # `ListEndpointsByPlatformApplication` are paginated and return a limited list of endpoints, up to
    # 100. If additional records are available after the first page results, then a NextToken string
    # will be returned. To receive the next page, you call `ListEndpointsByPlatformApplication` again
    # using the NextToken string received from the previous call. When there are no more records to
    # return, NextToken will be null. For more information, see [Using Amazon SNS Mobile Push
    # Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
    #
    # This action is throttled at 30 transactions per second (TPS).
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

    # Lists the calling Amazon Web Services account's dedicated origination numbers and their
    # metadata. For more information about origination numbers, see [Origination
    # numbers](https://docs.aws.amazon.com/sns/latest/dg/channels-sms-originating-identities-origination-numbers.html)
    # in the *Amazon SNS Developer Guide*.
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

    # Returns a list of phone numbers that are opted out, meaning you cannot send SMS messages to
    # them.
    #
    # The results for `ListPhoneNumbersOptedOut` are paginated, and each page returns up to 100 phone
    # numbers. If additional phone numbers are available after the first page of results, then a
    # `NextToken` string will be returned. To receive the next page, you call
    # `ListPhoneNumbersOptedOut` again using the `NextToken` string received from the previous call.
    # When there are no more records to return, `NextToken` will be null.
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

    # Lists the platform application objects for the supported push notification services, such as
    # APNS and GCM (Firebase Cloud Messaging). The results for `ListPlatformApplications` are
    # paginated and return a limited list of applications, up to 100. If additional records are
    # available after the first page results, then a NextToken string will be returned. To receive the
    # next page, you call `ListPlatformApplications` using the NextToken string received from the
    # previous call. When there are no more records to return, `NextToken` will be null. For more
    # information, see [Using Amazon SNS Mobile Push
    # Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
    #
    # This action is throttled at 15 transactions per second (TPS).
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

    # Lists the calling Amazon Web Services account's current verified and pending destination phone
    # numbers in the SMS sandbox.
    #
    # When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the
    # *SMS sandbox*. The SMS sandbox provides a safe environment for you to try Amazon SNS features
    # without risking your reputation as an SMS sender. While your Amazon Web Services account is in
    # the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS
    # messages only to verified destination phone numbers. For more information, including how to move
    # out of the sandbox to send messages without restrictions, see [SMS
    # sandbox](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) in the *Amazon SNS
    # Developer Guide*.
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

    # Returns a list of the requester's subscriptions. Each call returns a limited list of
    # subscriptions, up to 100. If there are more subscriptions, a `NextToken` is also returned. Use
    # the `NextToken` parameter in a new `ListSubscriptions` call to get further results.
    #
    # This action is throttled at 30 transactions per second (TPS).
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

    # Returns a list of the subscriptions to a specific topic. Each call returns a limited list of
    # subscriptions, up to 100. If there are more subscriptions, a `NextToken` is also returned. Use
    # the `NextToken` parameter in a new `ListSubscriptionsByTopic` call to get further results.
    #
    # This action is throttled at 30 transactions per second (TPS).
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

    # List all tags added to the specified Amazon SNS topic. For an overview, see [Amazon SNS
    # Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html) in the *Amazon Simple
    # Notification Service Developer Guide*.
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

    # Returns a list of the requester's topics. Each call returns a limited list of topics, up to 100.
    # If there are more topics, a `NextToken` is also returned. Use the `NextToken` parameter in a new
    # `ListTopics` call to get further results.
    #
    # This action is throttled at 30 transactions per second (TPS).
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

    # Use this request to opt in a phone number that is opted out, which enables you to resume sending
    # SMS messages to the number.
    #
    # You can opt in a phone number only once every 30 days.
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

    # Sends a message to an Amazon SNS topic, a text message (SMS message) directly to a phone number,
    # or a message to a mobile platform endpoint (when you specify the `TargetArn`).
    #
    # If you send a message to a topic, Amazon SNS delivers the message to each endpoint that is
    # subscribed to the topic. The format of the message depends on the notification protocol for each
    # subscribed endpoint.
    #
    # When a `messageId` is returned, the message is saved and Amazon SNS immediately delivers it to
    # subscribers.
    #
    # To use the `Publish` action for publishing a message to a mobile endpoint, such as an app on a
    # Kindle device or mobile phone, you must specify the EndpointArn for the TargetArn parameter. The
    # EndpointArn is returned when making a call with the `CreatePlatformEndpoint` action.
    #
    # For more information about formatting messages, see [Send Custom Platform-Specific Payloads in
    # Messages to Mobile
    # Devices](https://docs.aws.amazon.com/sns/latest/dg/mobile-push-send-custommessage.html).
    #
    # You can publish messages only to topics and endpoints in the same Amazon Web Services Region.
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

    # Publishes up to 10 messages to the specified topic in a single batch. This is a batch version of
    # the `Publish` API. If you try to send more than 10 messages in a single batch request, you will
    # receive a `TooManyEntriesInBatchRequest` exception.
    #
    # For FIFO topics, multiple messages within a single batch are published in the order they are
    # sent, and messages are deduplicated within the batch and across batches for five minutes.
    #
    # The result of publishing each message is reported individually in the response. Because the
    # batch request can result in a combination of successful and unsuccessful actions, you should
    # check for batch errors even when the call returns an HTTP status code of 200.
    #
    # The maximum allowed individual message size and the maximum total payload size (the sum of the
    # individual lengths of all of the batched messages) are both 256 KB (262,144 bytes).
    #
    # The `PublishBatch` API can send up to 10 messages at a time. If you attempt to send more than 10
    # messages in one request, you will encounter a `TooManyEntriesInBatchRequest` exception. In such
    # cases, split your messages into multiple requests, each containing no more than 10 messages.
    #
    # Some actions take lists of parameters. These lists are specified using the `param.n` notation.
    # Values of `n` are integers starting from **1**. For example, a parameter list with two elements
    # looks like this:
    #
    # `&AttributeName.1=first`
    #
    # `&AttributeName.2=second`
    #
    # If you send a batch message to a topic, Amazon SNS publishes the batch message to each endpoint
    # that is subscribed to the topic. The format of the batch message depends on the notification
    # protocol for each subscribed endpoint.
    #
    # When a `messageId` is returned, the batch message is saved, and Amazon SNS immediately delivers
    # the message to subscribers.
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

    # Adds or updates an inline policy document that is stored in the specified Amazon SNS topic.
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

    # Removes a statement from a topic's access control policy.
    #
    # To remove the ability to change topic permissions, you must deny permissions to the
    # `AddPermission`, `RemovePermission`, and `SetTopicAttributes` actions in your IAM policy.
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

    # Sets the attributes for an endpoint for a device on one of the supported push notification
    # services, such as GCM (Firebase Cloud Messaging) and APNS. For more information, see [Using
    # Amazon SNS Mobile Push
    # Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html).
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

    # Sets the attributes of the platform application object for the supported push notification
    # services, such as APNS and GCM (Firebase Cloud Messaging). For more information, see [Using
    # Amazon SNS Mobile Push
    # Notifications](https://docs.aws.amazon.com/sns/latest/dg/SNSMobilePush.html). For information on
    # configuring attributes for message delivery status, see [Using Amazon SNS Application Attributes
    # for Message Delivery Status](https://docs.aws.amazon.com/sns/latest/dg/sns-msg-status.html).
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

    # Use this request to set the default settings for sending SMS messages and receiving daily SMS
    # usage reports.
    #
    # You can override some of these settings for a single message when you use the `Publish` action
    # with the `MessageAttributes.entry.N` parameter. For more information, see [Publishing to a
    # mobile phone](https://docs.aws.amazon.com/sns/latest/dg/sms_publish-to-phone.html) in the
    # *Amazon SNS Developer Guide*.
    #
    # To use this operation, you must grant the Amazon SNS service principal (`sns.amazonaws.com`)
    # permission to perform the `s3:ListBucket` action.
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

    # Allows a subscription owner to set an attribute of the subscription to a new value.
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

    # Allows a topic owner to set an attribute of the topic to a new value.
    #
    # To remove the ability to change topic permissions, you must deny permissions to the
    # `AddPermission`, `RemovePermission`, and `SetTopicAttributes` actions in your IAM policy.
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

    # Subscribes an endpoint to an Amazon SNS topic. If the endpoint type is HTTP/S or email, or if
    # the endpoint and the topic are not in the same Amazon Web Services account, the endpoint owner
    # must run the `ConfirmSubscription` action to confirm the subscription.
    #
    # You call the `ConfirmSubscription` action with the token from the subscription response.
    # Confirmation tokens are valid for two days.
    #
    # This action is throttled at 100 transactions per second (TPS).
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

    # Add tags to the specified Amazon SNS topic. For an overview, see [Amazon SNS
    # Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html) in the *Amazon SNS Developer
    # Guide*.
    #
    # When you use topic tags, keep the following guidelines in mind:
    #
    # - Adding more than 50 tags to a topic isn't recommended.
    #
    # - Tags don't have any semantic meaning. Amazon SNS interprets tags as character strings.
    #
    # - Tags are case-sensitive.
    #
    # - A new tag with a key identical to that of an existing tag overwrites the existing tag.
    #
    # - Tagging actions are limited to 10 TPS per Amazon Web Services account, per Amazon Web Services
    # Region. If your application requires a higher throughput, file a [technical support
    # request](https://console.aws.amazon.com/support/home#/case/create?issueType=technical).
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

    # Deletes a subscription. If the subscription requires authentication for deletion, only the owner
    # of the subscription or the topic's owner can unsubscribe, and an Amazon Web Services signature
    # is required. If the `Unsubscribe` call does not require authentication and the requester is not
    # the subscription owner, a final cancellation message is delivered to the endpoint, so that the
    # endpoint owner can easily resubscribe to the topic if the `Unsubscribe` request was unintended.
    #
    # This action is throttled at 100 transactions per second (TPS).
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

    # Remove tags from the specified Amazon SNS topic. For an overview, see [Amazon SNS
    # Tags](https://docs.aws.amazon.com/sns/latest/dg/sns-tags.html) in the *Amazon SNS Developer
    # Guide*.
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

    # Verifies a destination phone number with a one-time password (OTP) for the calling Amazon Web
    # Services account.
    #
    # When you start using Amazon SNS to send SMS messages, your Amazon Web Services account is in the
    # *SMS sandbox*. The SMS sandbox provides a safe environment for you to try Amazon SNS features
    # without risking your reputation as an SMS sender. While your Amazon Web Services account is in
    # the SMS sandbox, you can use all of the features of Amazon SNS. However, you can send SMS
    # messages only to verified destination phone numbers. For more information, including how to move
    # out of the sandbox to send messages without restrictions, see [SMS
    # sandbox](https://docs.aws.amazon.com/sns/latest/dg/sns-sms-sandbox.html) in the *Amazon SNS
    # Developer Guide*.
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
