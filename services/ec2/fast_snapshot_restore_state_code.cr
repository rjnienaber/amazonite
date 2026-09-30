private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum FastSnapshotRestoreStateCode
    Enabling
    Optimizing
    Enabled
    Disabling
    Disabled

    def self.to_json(e : FastSnapshotRestoreStateCode, json : JSON::Builder) : Nil
      value = case e
              when AEC::FastSnapshotRestoreStateCode::Enabling   then "enabling"
              when AEC::FastSnapshotRestoreStateCode::Optimizing then "optimizing"
              when AEC::FastSnapshotRestoreStateCode::Enabled    then "enabled"
              when AEC::FastSnapshotRestoreStateCode::Disabling  then "disabling"
              when AEC::FastSnapshotRestoreStateCode::Disabled   then "disabled"
              else
                raise Exception.new("unknown enum value for 'FastSnapshotRestoreStateCode' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::FastSnapshotRestoreStateCode
      value = pull.read_string
      case value
      when "enabling"   then AEC::FastSnapshotRestoreStateCode::Enabling
      when "optimizing" then AEC::FastSnapshotRestoreStateCode::Optimizing
      when "enabled"    then AEC::FastSnapshotRestoreStateCode::Enabled
      when "disabling"  then AEC::FastSnapshotRestoreStateCode::Disabling
      when "disabled"   then AEC::FastSnapshotRestoreStateCode::Disabled
      else
        raise Exception.new("unknown enum value for 'FastSnapshotRestoreStateCode' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::FastSnapshotRestoreStateCode::Enabling   then "enabling"
      when AEC::FastSnapshotRestoreStateCode::Optimizing then "optimizing"
      when AEC::FastSnapshotRestoreStateCode::Enabled    then "enabled"
      when AEC::FastSnapshotRestoreStateCode::Disabling  then "disabling"
      when AEC::FastSnapshotRestoreStateCode::Disabled   then "disabled"
      else
        raise Exception.new("unknown enum value for 'FastSnapshotRestoreStateCode' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::FastSnapshotRestoreStateCode?
      case key
      when "enabling"   then AEC::FastSnapshotRestoreStateCode::Enabling
      when "optimizing" then AEC::FastSnapshotRestoreStateCode::Optimizing
      when "enabled"    then AEC::FastSnapshotRestoreStateCode::Enabled
      when "disabling"  then AEC::FastSnapshotRestoreStateCode::Disabling
      when "disabled"   then AEC::FastSnapshotRestoreStateCode::Disabled
      else
        nil
      end
    end
  end
end
