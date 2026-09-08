private alias AS = Amazonite::S3

module Amazonite::S3
  enum DeleteMarkerReplicationStatus
    Enabled
    Disabled

    def self.to_json(e : DeleteMarkerReplicationStatus, json : JSON::Builder) : Nil
      json.string(e.to_s)
    end

    def self.from_json(pull : JSON::PullParser) : AS::DeleteMarkerReplicationStatus
      value = pull.read_string
      case value
      when "Enabled"  then AS::DeleteMarkerReplicationStatus::Enabled
      when "Disabled" then AS::DeleteMarkerReplicationStatus::Disabled
      else
        raise Exception.new("unknown enum value for 'DeleteMarkerReplicationStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      to_s
    end

    def self.from_json_object_key?(key : String) : AS::DeleteMarkerReplicationStatus?
      case key
      when "Enabled"  then AS::DeleteMarkerReplicationStatus::Enabled
      when "Disabled" then AS::DeleteMarkerReplicationStatus::Disabled
      else
        nil
      end
    end
  end
end
