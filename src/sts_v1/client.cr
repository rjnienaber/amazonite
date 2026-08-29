private alias AS = Amazonite::StsV1
private alias Core = Amazonite::Core

module Amazonite::StsV1
  class Client < Core::Client
    Log               = ::Log.for("amazonite.sts_v1.client")
    EXCEPTION_FACTORY = ExceptionFactory.new

    def initialize(config = Core::Config.new)
      super("AWSSecurityTokenServiceV20110615", "sts", "1.0", EXCEPTION_FACTORY, config)
    end

    def assume_role(input : AS::AssumeRoleRequest) : Core::ParsedResponse(AS::AssumeRoleResponse)
      Log.info { "performing 'AssumeRole' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AssumeRole")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AssumeRole", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='AssumeRoleResult']").not_nil!
      result = AS::AssumeRoleResponse.from_xml(result_node)
      Core::ParsedResponse(AS::AssumeRoleResponse).new(response, result)
    end

    def assume_role_with_saml(input : AS::AssumeRoleWithSAMLRequest) : Core::ParsedResponse(AS::AssumeRoleWithSAMLResponse)
      Log.info { "performing 'AssumeRoleWithSAML' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AssumeRoleWithSAML")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AssumeRoleWithSAML", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='AssumeRoleWithSAMLResult']").not_nil!
      result = AS::AssumeRoleWithSAMLResponse.from_xml(result_node)
      Core::ParsedResponse(AS::AssumeRoleWithSAMLResponse).new(response, result)
    end

    def assume_role_with_web_identity(input : AS::AssumeRoleWithWebIdentityRequest) : Core::ParsedResponse(AS::AssumeRoleWithWebIdentityResponse)
      Log.info { "performing 'AssumeRoleWithWebIdentity' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AssumeRoleWithWebIdentity")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AssumeRoleWithWebIdentity", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='AssumeRoleWithWebIdentityResult']").not_nil!
      result = AS::AssumeRoleWithWebIdentityResponse.from_xml(result_node)
      Core::ParsedResponse(AS::AssumeRoleWithWebIdentityResponse).new(response, result)
    end

    def assume_root(input : AS::AssumeRootRequest) : Core::ParsedResponse(AS::AssumeRootResponse)
      Log.info { "performing 'AssumeRoot' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "AssumeRoot")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("AssumeRoot", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='AssumeRootResult']").not_nil!
      result = AS::AssumeRootResponse.from_xml(result_node)
      Core::ParsedResponse(AS::AssumeRootResponse).new(response, result)
    end

    def decode_authorization_message(input : AS::DecodeAuthorizationMessageRequest) : Core::ParsedResponse(AS::DecodeAuthorizationMessageResponse)
      Log.info { "performing 'DecodeAuthorizationMessage' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "DecodeAuthorizationMessage")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("DecodeAuthorizationMessage", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='DecodeAuthorizationMessageResult']").not_nil!
      result = AS::DecodeAuthorizationMessageResponse.from_xml(result_node)
      Core::ParsedResponse(AS::DecodeAuthorizationMessageResponse).new(response, result)
    end

    def get_access_key_info(input : AS::GetAccessKeyInfoRequest) : Core::ParsedResponse(AS::GetAccessKeyInfoResponse)
      Log.info { "performing 'GetAccessKeyInfo' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetAccessKeyInfo")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetAccessKeyInfo", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetAccessKeyInfoResult']").not_nil!
      result = AS::GetAccessKeyInfoResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetAccessKeyInfoResponse).new(response, result)
    end

    def get_caller_identity(input : AS::GetCallerIdentityRequest) : Core::ParsedResponse(AS::GetCallerIdentityResponse)
      Log.info { "performing 'GetCallerIdentity' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetCallerIdentity")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetCallerIdentity", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetCallerIdentityResult']").not_nil!
      result = AS::GetCallerIdentityResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetCallerIdentityResponse).new(response, result)
    end

    def get_delegated_access_token(input : AS::GetDelegatedAccessTokenRequest) : Core::ParsedResponse(AS::GetDelegatedAccessTokenResponse)
      Log.info { "performing 'GetDelegatedAccessToken' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetDelegatedAccessToken")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetDelegatedAccessToken", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetDelegatedAccessTokenResult']").not_nil!
      result = AS::GetDelegatedAccessTokenResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetDelegatedAccessTokenResponse).new(response, result)
    end

    def get_federation_token(input : AS::GetFederationTokenRequest) : Core::ParsedResponse(AS::GetFederationTokenResponse)
      Log.info { "performing 'GetFederationToken' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetFederationToken")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetFederationToken", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetFederationTokenResult']").not_nil!
      result = AS::GetFederationTokenResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetFederationTokenResponse).new(response, result)
    end

    def get_session_token(input : AS::GetSessionTokenRequest) : Core::ParsedResponse(AS::GetSessionTokenResponse)
      Log.info { "performing 'GetSessionToken' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetSessionToken")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetSessionToken", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetSessionTokenResult']").not_nil!
      result = AS::GetSessionTokenResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetSessionTokenResponse).new(response, result)
    end

    def get_web_identity_token(input : AS::GetWebIdentityTokenRequest) : Core::ParsedResponse(AS::GetWebIdentityTokenResponse)
      Log.info { "performing 'GetWebIdentityToken' operation" }
      params = input.to_query_params("")
      body = URI::Params.build do |form|
        form.add("Action", "GetWebIdentityToken")
        form.add("Version", "2011-06-15")
        params.each { |key, value| form.add(key, value) }
      end
      response = query_request("GetWebIdentityToken", body)
      result_node = XML.parse(response.body).xpath_node("//*[local-name()='GetWebIdentityTokenResult']").not_nil!
      result = AS::GetWebIdentityTokenResponse.from_xml(result_node)
      Core::ParsedResponse(AS::GetWebIdentityTokenResponse).new(response, result)
    end
  end
end
