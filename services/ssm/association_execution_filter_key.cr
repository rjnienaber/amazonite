private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum AssociationExecutionFilterKey
    ExecutionId
    Status
    CreatedTime

    def self.to_json(e : AssociationExecutionFilterKey, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::AssociationExecutionFilterKey
      value = pull.read_string
      case value
      when "ExecutionId" then AS::AssociationExecutionFilterKey::ExecutionId
      when "Status"      then AS::AssociationExecutionFilterKey::Status
      when "CreatedTime" then AS::AssociationExecutionFilterKey::CreatedTime
      else
        raise Exception.new("unknown enum value for 'AssociationExecutionFilterKey' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::AssociationExecutionFilterKey?
      case key
      when "ExecutionId" then AS::AssociationExecutionFilterKey::ExecutionId
      when "Status"      then AS::AssociationExecutionFilterKey::Status
      when "CreatedTime" then AS::AssociationExecutionFilterKey::CreatedTime
      else
        nil
      end
    end
  end
end
