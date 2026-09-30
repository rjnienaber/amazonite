private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum SnapshotReturnCodes
    Success
    Skipped
    MissingPermissions
    InternalError
    ClientError

    def self.to_json(e : SnapshotReturnCodes, json : JSON::Builder) : Nil
      value = case e
              when AEC::SnapshotReturnCodes::Success            then "success"
              when AEC::SnapshotReturnCodes::Skipped            then "skipped"
              when AEC::SnapshotReturnCodes::MissingPermissions then "missing-permissions"
              when AEC::SnapshotReturnCodes::InternalError      then "internal-error"
              when AEC::SnapshotReturnCodes::ClientError        then "client-error"
              else
                raise Exception.new("unknown enum value for 'SnapshotReturnCodes' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::SnapshotReturnCodes
      value = pull.read_string
      case value
      when "success"             then AEC::SnapshotReturnCodes::Success
      when "skipped"             then AEC::SnapshotReturnCodes::Skipped
      when "missing-permissions" then AEC::SnapshotReturnCodes::MissingPermissions
      when "internal-error"      then AEC::SnapshotReturnCodes::InternalError
      when "client-error"        then AEC::SnapshotReturnCodes::ClientError
      else
        raise Exception.new("unknown enum value for 'SnapshotReturnCodes' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::SnapshotReturnCodes::Success            then "success"
      when AEC::SnapshotReturnCodes::Skipped            then "skipped"
      when AEC::SnapshotReturnCodes::MissingPermissions then "missing-permissions"
      when AEC::SnapshotReturnCodes::InternalError      then "internal-error"
      when AEC::SnapshotReturnCodes::ClientError        then "client-error"
      else
        raise Exception.new("unknown enum value for 'SnapshotReturnCodes' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::SnapshotReturnCodes?
      case key
      when "success"             then AEC::SnapshotReturnCodes::Success
      when "skipped"             then AEC::SnapshotReturnCodes::Skipped
      when "missing-permissions" then AEC::SnapshotReturnCodes::MissingPermissions
      when "internal-error"      then AEC::SnapshotReturnCodes::InternalError
      when "client-error"        then AEC::SnapshotReturnCodes::ClientError
      else
        nil
      end
    end
  end
end
