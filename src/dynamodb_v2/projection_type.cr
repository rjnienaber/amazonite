private alias ADDB = Amazonite::DynamoDBV2

module Amazonite::DynamoDBV2
  enum ProjectionType
    All
    KeysOnly
    Include

    def self.to_json(e : ProjectionType, json : JSON::Builder) : Nil
      value = case e
              when ADDB::ProjectionType::All      then "ALL"
              when ADDB::ProjectionType::KeysOnly then "KEYS_ONLY"
              when ADDB::ProjectionType::Include  then "INCLUDE"
              else
                raise Exception.new("unknown enum value for 'ProjectionType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : ADDB::ProjectionType
      value = pull.read_string
      case value
      when "ALL"       then ADDB::ProjectionType::All
      when "KEYS_ONLY" then ADDB::ProjectionType::KeysOnly
      when "INCLUDE"   then ADDB::ProjectionType::Include
      else
        raise Exception.new("unknown enum value for 'ProjectionType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when ADDB::ProjectionType::All      then "ALL"
      when ADDB::ProjectionType::KeysOnly then "KEYS_ONLY"
      when ADDB::ProjectionType::Include  then "INCLUDE"
      else
        raise Exception.new("unknown enum value for 'ProjectionType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : ADDB::ProjectionType?
      case key
      when "ALL"       then ADDB::ProjectionType::All
      when "KEYS_ONLY" then ADDB::ProjectionType::KeysOnly
      when "INCLUDE"   then ADDB::ProjectionType::Include
      else
        nil
      end
    end
  end
end
