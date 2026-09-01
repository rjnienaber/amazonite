private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum ManagedByTypeType
    Service

    def self.to_json(e : ManagedByTypeType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::ManagedByTypeType
      value = pull.read_string
      case value
      when "Service" then AI::ManagedByTypeType::Service
      else
        raise Exception.new("unknown enum value for 'ManagedByTypeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::ManagedByTypeType?
      case key
      when "Service" then AI::ManagedByTypeType::Service
      else
        nil
      end
    end
  end
end
