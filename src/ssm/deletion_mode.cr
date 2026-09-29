private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum DeletionMode
    RemoveSharing
    RollbackMigration

    def self.to_json(e : DeletionMode, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DeletionMode
      value = pull.read_string
      case value
      when "RemoveSharing"     then AS::DeletionMode::RemoveSharing
      when "RollbackMigration" then AS::DeletionMode::RollbackMigration
      else
        raise Exception.new("unknown enum value for 'DeletionMode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DeletionMode?
      case key
      when "RemoveSharing"     then AS::DeletionMode::RemoveSharing
      when "RollbackMigration" then AS::DeletionMode::RollbackMigration
      else
        nil
      end
    end
  end
end
