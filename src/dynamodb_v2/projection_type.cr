private alias ADDB = Amazonite::DynamoDBv2

module Amazonite::DynamoDBv2
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
                raise Exception.new("unknown enum value for 'ProjectionType' when serializing to json: '#{e.to_s}'")
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
  end
end
