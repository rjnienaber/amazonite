private alias AS = Amazonite::S3

module Amazonite::S3
  enum ExistingObjectReplicationStatus
    Enabled
    Disabled

    def self.to_json(e : ExistingObjectReplicationStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::ExistingObjectReplicationStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::ExistingObjectReplicationStatus::Enabled
      when "Disabled" then AS::ExistingObjectReplicationStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'ExistingObjectReplicationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::ExistingObjectReplicationStatus?
      case key
      when "Enabled"  then AS::ExistingObjectReplicationStatus::Enabled
      when "Disabled" then AS::ExistingObjectReplicationStatus::Disabled
      else
        nil
      end
    end
  end
end
