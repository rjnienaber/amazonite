private alias AI = Amazonite::IamV1

module Amazonite::IamV1
  enum AssignmentStatusType
    Assigned
    Unassigned
    Any

    def self.to_json(e : AssignmentStatusType, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AI::AssignmentStatusType
      value = pull.read_string
      case value
      when "Assigned"   then AI::AssignmentStatusType::Assigned
      when "Unassigned" then AI::AssignmentStatusType::Unassigned
      when "Any"        then AI::AssignmentStatusType::Any
      else
        raise Exception.new("unknown enum value for 'AssignmentStatusType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AI::AssignmentStatusType?
      case key
      when "Assigned"   then AI::AssignmentStatusType::Assigned
      when "Unassigned" then AI::AssignmentStatusType::Unassigned
      when "Any"        then AI::AssignmentStatusType::Any
      else
        nil
      end
    end
  end
end
