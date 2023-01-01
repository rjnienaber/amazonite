private alias AS = Amazonite::SsmV1

module Amazonite::SsmV1
  enum OpsItemDataType
    SearchableString
    String

    def self.to_json(e : OpsItemDataType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::OpsItemDataType
      value = pull.read_string
      case value
      when "SearchableString" then AS::OpsItemDataType::SearchableString
      when "String"           then AS::OpsItemDataType::String
      else
        raise Exception.new("unknown enum value for 'OpsItemDataType' when deserializing from json: '#{value}'")
      end
    end
  end
end
