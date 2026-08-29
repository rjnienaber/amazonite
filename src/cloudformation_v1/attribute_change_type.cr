private alias ACF = Amazonite::CloudFormationV1

module Amazonite::CloudFormationV1
  enum AttributeChangeType
    Add
    Remove
    Modify
    SyncWithActual

    def self.to_json(e : AttributeChangeType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : ACF::AttributeChangeType
      value = pull.read_string
      case value
      when "Add"            then ACF::AttributeChangeType::Add
      when "Remove"         then ACF::AttributeChangeType::Remove
      when "Modify"         then ACF::AttributeChangeType::Modify
      when "SyncWithActual" then ACF::AttributeChangeType::SyncWithActual
      else
        raise Exception.new("unknown enum value for 'AttributeChangeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : ACF::AttributeChangeType?
      case key
      when "Add"            then ACF::AttributeChangeType::Add
      when "Remove"         then ACF::AttributeChangeType::Remove
      when "Modify"         then ACF::AttributeChangeType::Modify
      when "SyncWithActual" then ACF::AttributeChangeType::SyncWithActual
      else
        nil
      end
    end
  end
end
