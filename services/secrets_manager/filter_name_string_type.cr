private alias ASM = Amazonite::SecretsManager

module Amazonite::SecretsManager
  enum FilterNameStringType
    Description
    Name
    TagKey
    TagValue
    PrimaryRegion
    OwningService
    All

    def self.to_json(e : FilterNameStringType, json : JSON::Builder) : Nil
      value = case e
              when ASM::FilterNameStringType::Description   then "description"
              when ASM::FilterNameStringType::Name          then "name"
              when ASM::FilterNameStringType::TagKey        then "tag-key"
              when ASM::FilterNameStringType::TagValue      then "tag-value"
              when ASM::FilterNameStringType::PrimaryRegion then "primary-region"
              when ASM::FilterNameStringType::OwningService then "owning-service"
              when ASM::FilterNameStringType::All           then "all"
              else
                raise Exception.new("unknown enum value for 'FilterNameStringType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ASM::FilterNameStringType
      value = pull.read_string
      case value
      when "description"    then ASM::FilterNameStringType::Description
      when "name"           then ASM::FilterNameStringType::Name
      when "tag-key"        then ASM::FilterNameStringType::TagKey
      when "tag-value"      then ASM::FilterNameStringType::TagValue
      when "primary-region" then ASM::FilterNameStringType::PrimaryRegion
      when "owning-service" then ASM::FilterNameStringType::OwningService
      when "all"            then ASM::FilterNameStringType::All
      else
        raise Exception.new("unknown enum value for 'FilterNameStringType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ASM::FilterNameStringType::Description   then "description"
      when ASM::FilterNameStringType::Name          then "name"
      when ASM::FilterNameStringType::TagKey        then "tag-key"
      when ASM::FilterNameStringType::TagValue      then "tag-value"
      when ASM::FilterNameStringType::PrimaryRegion then "primary-region"
      when ASM::FilterNameStringType::OwningService then "owning-service"
      when ASM::FilterNameStringType::All           then "all"
      else
        raise Exception.new("unknown enum value for 'FilterNameStringType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ASM::FilterNameStringType?
      case key
      when "description"    then ASM::FilterNameStringType::Description
      when "name"           then ASM::FilterNameStringType::Name
      when "tag-key"        then ASM::FilterNameStringType::TagKey
      when "tag-value"      then ASM::FilterNameStringType::TagValue
      when "primary-region" then ASM::FilterNameStringType::PrimaryRegion
      when "owning-service" then ASM::FilterNameStringType::OwningService
      when "all"            then ASM::FilterNameStringType::All
      else
        nil
      end
    end
  end
end
