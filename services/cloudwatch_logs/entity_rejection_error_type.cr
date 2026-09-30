private alias ACWL = Amazonite::CloudWatchLogs

module Amazonite::CloudWatchLogs
  enum EntityRejectionErrorType
    InvalidEntity
    InvalidTypeValue
    InvalidKeyAttributes
    InvalidAttributes
    EntitySizeTooLarge
    UnsupportedLogGroupType
    MissingRequiredFields

    def self.to_json(e : EntityRejectionErrorType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACWL::EntityRejectionErrorType
      value = pull.read_string
      case value
      when "InvalidEntity"           then ACWL::EntityRejectionErrorType::InvalidEntity
      when "InvalidTypeValue"        then ACWL::EntityRejectionErrorType::InvalidTypeValue
      when "InvalidKeyAttributes"    then ACWL::EntityRejectionErrorType::InvalidKeyAttributes
      when "InvalidAttributes"       then ACWL::EntityRejectionErrorType::InvalidAttributes
      when "EntitySizeTooLarge"      then ACWL::EntityRejectionErrorType::EntitySizeTooLarge
      when "UnsupportedLogGroupType" then ACWL::EntityRejectionErrorType::UnsupportedLogGroupType
      when "MissingRequiredFields"   then ACWL::EntityRejectionErrorType::MissingRequiredFields
      else
        raise Exception.new("unknown enum value for 'EntityRejectionErrorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACWL::EntityRejectionErrorType?
      case key
      when "InvalidEntity"           then ACWL::EntityRejectionErrorType::InvalidEntity
      when "InvalidTypeValue"        then ACWL::EntityRejectionErrorType::InvalidTypeValue
      when "InvalidKeyAttributes"    then ACWL::EntityRejectionErrorType::InvalidKeyAttributes
      when "InvalidAttributes"       then ACWL::EntityRejectionErrorType::InvalidAttributes
      when "EntitySizeTooLarge"      then ACWL::EntityRejectionErrorType::EntitySizeTooLarge
      when "UnsupportedLogGroupType" then ACWL::EntityRejectionErrorType::UnsupportedLogGroupType
      when "MissingRequiredFields"   then ACWL::EntityRejectionErrorType::MissingRequiredFields
      else
        nil
      end
    end
  end
end
