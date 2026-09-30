private alias AI = Amazonite::Iam

module Amazonite::Iam
  enum StatusType
    Active
    Inactive
    Expired

    def self.to_json(e : StatusType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::StatusType
      value = pull.read_string
      case value
      when "Active"   then AI::StatusType::Active
      when "Inactive" then AI::StatusType::Inactive
      when "Expired"  then AI::StatusType::Expired
      else
        raise Exception.new("unknown enum value for 'StatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::StatusType?
      case key
      when "Active"   then AI::StatusType::Active
      when "Inactive" then AI::StatusType::Inactive
      when "Expired"  then AI::StatusType::Expired
      else
        nil
      end
    end
  end
end
