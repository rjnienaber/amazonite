private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum FeatureType
    RootCredentialsManagement
    RootSessions

    def self.to_json(e : FeatureType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::FeatureType
      value = pull.read_string
      case value
      when "RootCredentialsManagement" then AI::FeatureType::RootCredentialsManagement
      when "RootSessions"              then AI::FeatureType::RootSessions
      else
        raise Exception.new("unknown enum value for 'FeatureType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::FeatureType?
      case key
      when "RootCredentialsManagement" then AI::FeatureType::RootCredentialsManagement
      when "RootSessions"              then AI::FeatureType::RootSessions
      else
        nil
      end
    end
  end
end
