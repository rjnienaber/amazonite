private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum InventoryDeletionStatus
    InProgress
    Complete

    def self.to_json(e : InventoryDeletionStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::InventoryDeletionStatus
      value = pull.read_string
      case value
      when "InProgress" then AS::InventoryDeletionStatus::InProgress
      when "Complete"   then AS::InventoryDeletionStatus::Complete
      else
        raise Exception.new("unknown enum value for 'InventoryDeletionStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::InventoryDeletionStatus?
      case key
      when "InProgress" then AS::InventoryDeletionStatus::InProgress
      when "Complete"   then AS::InventoryDeletionStatus::Complete
      else
        nil
      end
    end
  end
end
