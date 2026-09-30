private alias AAG = Amazonite::ApiGateway

module Amazonite::ApiGateway
  enum GatewayResponseType
    Default4xx
    Default5xx
    ResourceNotFound
    Unauthorized
    InvalidApiKey
    AccessDenied
    AuthorizerFailure
    AuthorizerConfigurationError
    InvalidSignature
    ExpiredToken
    MissingAuthenticationToken
    IntegrationFailure
    IntegrationTimeout
    ApiConfigurationError
    UnsupportedMediaType
    BadRequestParameters
    BadRequestBody
    RequestTooLarge
    Throttled
    QuotaExceeded
    WafFiltered

    def self.to_json(e : GatewayResponseType, json : JSON::Builder) : Nil
      value = case e
              when AAG::GatewayResponseType::Default4xx                   then "DEFAULT_4XX"
              when AAG::GatewayResponseType::Default5xx                   then "DEFAULT_5XX"
              when AAG::GatewayResponseType::ResourceNotFound             then "RESOURCE_NOT_FOUND"
              when AAG::GatewayResponseType::Unauthorized                 then "UNAUTHORIZED"
              when AAG::GatewayResponseType::InvalidApiKey                then "INVALID_API_KEY"
              when AAG::GatewayResponseType::AccessDenied                 then "ACCESS_DENIED"
              when AAG::GatewayResponseType::AuthorizerFailure            then "AUTHORIZER_FAILURE"
              when AAG::GatewayResponseType::AuthorizerConfigurationError then "AUTHORIZER_CONFIGURATION_ERROR"
              when AAG::GatewayResponseType::InvalidSignature             then "INVALID_SIGNATURE"
              when AAG::GatewayResponseType::ExpiredToken                 then "EXPIRED_TOKEN"
              when AAG::GatewayResponseType::MissingAuthenticationToken   then "MISSING_AUTHENTICATION_TOKEN"
              when AAG::GatewayResponseType::IntegrationFailure           then "INTEGRATION_FAILURE"
              when AAG::GatewayResponseType::IntegrationTimeout           then "INTEGRATION_TIMEOUT"
              when AAG::GatewayResponseType::ApiConfigurationError        then "API_CONFIGURATION_ERROR"
              when AAG::GatewayResponseType::UnsupportedMediaType         then "UNSUPPORTED_MEDIA_TYPE"
              when AAG::GatewayResponseType::BadRequestParameters         then "BAD_REQUEST_PARAMETERS"
              when AAG::GatewayResponseType::BadRequestBody               then "BAD_REQUEST_BODY"
              when AAG::GatewayResponseType::RequestTooLarge              then "REQUEST_TOO_LARGE"
              when AAG::GatewayResponseType::Throttled                    then "THROTTLED"
              when AAG::GatewayResponseType::QuotaExceeded                then "QUOTA_EXCEEDED"
              when AAG::GatewayResponseType::WafFiltered                  then "WAF_FILTERED"
              else
                raise Exception.new("unknown enum value for 'GatewayResponseType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AAG::GatewayResponseType
      value = pull.read_string
      case value
      when "DEFAULT_4XX"                    then AAG::GatewayResponseType::Default4xx
      when "DEFAULT_5XX"                    then AAG::GatewayResponseType::Default5xx
      when "RESOURCE_NOT_FOUND"             then AAG::GatewayResponseType::ResourceNotFound
      when "UNAUTHORIZED"                   then AAG::GatewayResponseType::Unauthorized
      when "INVALID_API_KEY"                then AAG::GatewayResponseType::InvalidApiKey
      when "ACCESS_DENIED"                  then AAG::GatewayResponseType::AccessDenied
      when "AUTHORIZER_FAILURE"             then AAG::GatewayResponseType::AuthorizerFailure
      when "AUTHORIZER_CONFIGURATION_ERROR" then AAG::GatewayResponseType::AuthorizerConfigurationError
      when "INVALID_SIGNATURE"              then AAG::GatewayResponseType::InvalidSignature
      when "EXPIRED_TOKEN"                  then AAG::GatewayResponseType::ExpiredToken
      when "MISSING_AUTHENTICATION_TOKEN"   then AAG::GatewayResponseType::MissingAuthenticationToken
      when "INTEGRATION_FAILURE"            then AAG::GatewayResponseType::IntegrationFailure
      when "INTEGRATION_TIMEOUT"            then AAG::GatewayResponseType::IntegrationTimeout
      when "API_CONFIGURATION_ERROR"        then AAG::GatewayResponseType::ApiConfigurationError
      when "UNSUPPORTED_MEDIA_TYPE"         then AAG::GatewayResponseType::UnsupportedMediaType
      when "BAD_REQUEST_PARAMETERS"         then AAG::GatewayResponseType::BadRequestParameters
      when "BAD_REQUEST_BODY"               then AAG::GatewayResponseType::BadRequestBody
      when "REQUEST_TOO_LARGE"              then AAG::GatewayResponseType::RequestTooLarge
      when "THROTTLED"                      then AAG::GatewayResponseType::Throttled
      when "QUOTA_EXCEEDED"                 then AAG::GatewayResponseType::QuotaExceeded
      when "WAF_FILTERED"                   then AAG::GatewayResponseType::WafFiltered
      else
        raise Exception.new("unknown enum value for 'GatewayResponseType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AAG::GatewayResponseType::Default4xx                   then "DEFAULT_4XX"
      when AAG::GatewayResponseType::Default5xx                   then "DEFAULT_5XX"
      when AAG::GatewayResponseType::ResourceNotFound             then "RESOURCE_NOT_FOUND"
      when AAG::GatewayResponseType::Unauthorized                 then "UNAUTHORIZED"
      when AAG::GatewayResponseType::InvalidApiKey                then "INVALID_API_KEY"
      when AAG::GatewayResponseType::AccessDenied                 then "ACCESS_DENIED"
      when AAG::GatewayResponseType::AuthorizerFailure            then "AUTHORIZER_FAILURE"
      when AAG::GatewayResponseType::AuthorizerConfigurationError then "AUTHORIZER_CONFIGURATION_ERROR"
      when AAG::GatewayResponseType::InvalidSignature             then "INVALID_SIGNATURE"
      when AAG::GatewayResponseType::ExpiredToken                 then "EXPIRED_TOKEN"
      when AAG::GatewayResponseType::MissingAuthenticationToken   then "MISSING_AUTHENTICATION_TOKEN"
      when AAG::GatewayResponseType::IntegrationFailure           then "INTEGRATION_FAILURE"
      when AAG::GatewayResponseType::IntegrationTimeout           then "INTEGRATION_TIMEOUT"
      when AAG::GatewayResponseType::ApiConfigurationError        then "API_CONFIGURATION_ERROR"
      when AAG::GatewayResponseType::UnsupportedMediaType         then "UNSUPPORTED_MEDIA_TYPE"
      when AAG::GatewayResponseType::BadRequestParameters         then "BAD_REQUEST_PARAMETERS"
      when AAG::GatewayResponseType::BadRequestBody               then "BAD_REQUEST_BODY"
      when AAG::GatewayResponseType::RequestTooLarge              then "REQUEST_TOO_LARGE"
      when AAG::GatewayResponseType::Throttled                    then "THROTTLED"
      when AAG::GatewayResponseType::QuotaExceeded                then "QUOTA_EXCEEDED"
      when AAG::GatewayResponseType::WafFiltered                  then "WAF_FILTERED"
      else
        raise Exception.new("unknown enum value for 'GatewayResponseType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AAG::GatewayResponseType?
      case key
      when "DEFAULT_4XX"                    then AAG::GatewayResponseType::Default4xx
      when "DEFAULT_5XX"                    then AAG::GatewayResponseType::Default5xx
      when "RESOURCE_NOT_FOUND"             then AAG::GatewayResponseType::ResourceNotFound
      when "UNAUTHORIZED"                   then AAG::GatewayResponseType::Unauthorized
      when "INVALID_API_KEY"                then AAG::GatewayResponseType::InvalidApiKey
      when "ACCESS_DENIED"                  then AAG::GatewayResponseType::AccessDenied
      when "AUTHORIZER_FAILURE"             then AAG::GatewayResponseType::AuthorizerFailure
      when "AUTHORIZER_CONFIGURATION_ERROR" then AAG::GatewayResponseType::AuthorizerConfigurationError
      when "INVALID_SIGNATURE"              then AAG::GatewayResponseType::InvalidSignature
      when "EXPIRED_TOKEN"                  then AAG::GatewayResponseType::ExpiredToken
      when "MISSING_AUTHENTICATION_TOKEN"   then AAG::GatewayResponseType::MissingAuthenticationToken
      when "INTEGRATION_FAILURE"            then AAG::GatewayResponseType::IntegrationFailure
      when "INTEGRATION_TIMEOUT"            then AAG::GatewayResponseType::IntegrationTimeout
      when "API_CONFIGURATION_ERROR"        then AAG::GatewayResponseType::ApiConfigurationError
      when "UNSUPPORTED_MEDIA_TYPE"         then AAG::GatewayResponseType::UnsupportedMediaType
      when "BAD_REQUEST_PARAMETERS"         then AAG::GatewayResponseType::BadRequestParameters
      when "BAD_REQUEST_BODY"               then AAG::GatewayResponseType::BadRequestBody
      when "REQUEST_TOO_LARGE"              then AAG::GatewayResponseType::RequestTooLarge
      when "THROTTLED"                      then AAG::GatewayResponseType::Throttled
      when "QUOTA_EXCEEDED"                 then AAG::GatewayResponseType::QuotaExceeded
      when "WAF_FILTERED"                   then AAG::GatewayResponseType::WafFiltered
      else
        nil
      end
    end
  end
end
