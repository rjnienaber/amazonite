private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VolumeState
    Creating
    Available
    InUse
    Deleting
    Deleted
    Error

    def self.to_json(e : VolumeState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VolumeState::Creating  then "creating"
              when AEC::VolumeState::Available then "available"
              when AEC::VolumeState::InUse     then "in-use"
              when AEC::VolumeState::Deleting  then "deleting"
              when AEC::VolumeState::Deleted   then "deleted"
              when AEC::VolumeState::Error     then "error"
              else
                raise Exception.new("unknown enum value for 'VolumeState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VolumeState
      value = pull.read_string
      case value
      when "creating"  then AEC::VolumeState::Creating
      when "available" then AEC::VolumeState::Available
      when "in-use"    then AEC::VolumeState::InUse
      when "deleting"  then AEC::VolumeState::Deleting
      when "deleted"   then AEC::VolumeState::Deleted
      when "error"     then AEC::VolumeState::Error
      else
        raise Exception.new("unknown enum value for 'VolumeState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VolumeState::Creating  then "creating"
      when AEC::VolumeState::Available then "available"
      when AEC::VolumeState::InUse     then "in-use"
      when AEC::VolumeState::Deleting  then "deleting"
      when AEC::VolumeState::Deleted   then "deleted"
      when AEC::VolumeState::Error     then "error"
      else
        raise Exception.new("unknown enum value for 'VolumeState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VolumeState?
      case key
      when "creating"  then AEC::VolumeState::Creating
      when "available" then AEC::VolumeState::Available
      when "in-use"    then AEC::VolumeState::InUse
      when "deleting"  then AEC::VolumeState::Deleting
      when "deleted"   then AEC::VolumeState::Deleted
      when "error"     then AEC::VolumeState::Error
      else
        nil
      end
    end
  end
end
