private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum HandlerErrorCode
    NotUpdatable
    InvalidRequest
    AccessDenied
    InvalidCredentials
    AlreadyExists
    NotFound
    ResourceConflict
    Throttling
    ServiceLimitExceeded
    NotStabilized
    GeneralServiceException
    ServiceInternalError
    NetworkFailure
    InternalFailure
    InvalidTypeConfiguration
    HandlerInternalFailure
    NonCompliant
    Unknown
    UnsupportedTarget

    def self.to_json(e : HandlerErrorCode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::HandlerErrorCode
      value = pull.read_string
      case value
      when "NotUpdatable"             then ACF::HandlerErrorCode::NotUpdatable
      when "InvalidRequest"           then ACF::HandlerErrorCode::InvalidRequest
      when "AccessDenied"             then ACF::HandlerErrorCode::AccessDenied
      when "InvalidCredentials"       then ACF::HandlerErrorCode::InvalidCredentials
      when "AlreadyExists"            then ACF::HandlerErrorCode::AlreadyExists
      when "NotFound"                 then ACF::HandlerErrorCode::NotFound
      when "ResourceConflict"         then ACF::HandlerErrorCode::ResourceConflict
      when "Throttling"               then ACF::HandlerErrorCode::Throttling
      when "ServiceLimitExceeded"     then ACF::HandlerErrorCode::ServiceLimitExceeded
      when "NotStabilized"            then ACF::HandlerErrorCode::NotStabilized
      when "GeneralServiceException"  then ACF::HandlerErrorCode::GeneralServiceException
      when "ServiceInternalError"     then ACF::HandlerErrorCode::ServiceInternalError
      when "NetworkFailure"           then ACF::HandlerErrorCode::NetworkFailure
      when "InternalFailure"          then ACF::HandlerErrorCode::InternalFailure
      when "InvalidTypeConfiguration" then ACF::HandlerErrorCode::InvalidTypeConfiguration
      when "HandlerInternalFailure"   then ACF::HandlerErrorCode::HandlerInternalFailure
      when "NonCompliant"             then ACF::HandlerErrorCode::NonCompliant
      when "Unknown"                  then ACF::HandlerErrorCode::Unknown
      when "UnsupportedTarget"        then ACF::HandlerErrorCode::UnsupportedTarget
      else
        raise Exception.new("unknown enum value for 'HandlerErrorCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::HandlerErrorCode?
      case key
      when "NotUpdatable"             then ACF::HandlerErrorCode::NotUpdatable
      when "InvalidRequest"           then ACF::HandlerErrorCode::InvalidRequest
      when "AccessDenied"             then ACF::HandlerErrorCode::AccessDenied
      when "InvalidCredentials"       then ACF::HandlerErrorCode::InvalidCredentials
      when "AlreadyExists"            then ACF::HandlerErrorCode::AlreadyExists
      when "NotFound"                 then ACF::HandlerErrorCode::NotFound
      when "ResourceConflict"         then ACF::HandlerErrorCode::ResourceConflict
      when "Throttling"               then ACF::HandlerErrorCode::Throttling
      when "ServiceLimitExceeded"     then ACF::HandlerErrorCode::ServiceLimitExceeded
      when "NotStabilized"            then ACF::HandlerErrorCode::NotStabilized
      when "GeneralServiceException"  then ACF::HandlerErrorCode::GeneralServiceException
      when "ServiceInternalError"     then ACF::HandlerErrorCode::ServiceInternalError
      when "NetworkFailure"           then ACF::HandlerErrorCode::NetworkFailure
      when "InternalFailure"          then ACF::HandlerErrorCode::InternalFailure
      when "InvalidTypeConfiguration" then ACF::HandlerErrorCode::InvalidTypeConfiguration
      when "HandlerInternalFailure"   then ACF::HandlerErrorCode::HandlerInternalFailure
      when "NonCompliant"             then ACF::HandlerErrorCode::NonCompliant
      when "Unknown"                  then ACF::HandlerErrorCode::Unknown
      when "UnsupportedTarget"        then ACF::HandlerErrorCode::UnsupportedTarget
      else
        nil
      end
    end
  end
end
