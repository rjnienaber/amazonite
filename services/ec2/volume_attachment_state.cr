private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VolumeAttachmentState
    Attaching
    Attached
    Detaching
    Detached
    Busy

    def self.to_json(e : VolumeAttachmentState, json : JSON::Builder) : Nil
      value = case e
              when AEC::VolumeAttachmentState::Attaching then "attaching"
              when AEC::VolumeAttachmentState::Attached  then "attached"
              when AEC::VolumeAttachmentState::Detaching then "detaching"
              when AEC::VolumeAttachmentState::Detached  then "detached"
              when AEC::VolumeAttachmentState::Busy      then "busy"
              else
                raise Exception.new("unknown enum value for 'VolumeAttachmentState' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VolumeAttachmentState
      value = pull.read_string
      case value
      when "attaching" then AEC::VolumeAttachmentState::Attaching
      when "attached"  then AEC::VolumeAttachmentState::Attached
      when "detaching" then AEC::VolumeAttachmentState::Detaching
      when "detached"  then AEC::VolumeAttachmentState::Detached
      when "busy"      then AEC::VolumeAttachmentState::Busy
      else
        raise Exception.new("unknown enum value for 'VolumeAttachmentState' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VolumeAttachmentState::Attaching then "attaching"
      when AEC::VolumeAttachmentState::Attached  then "attached"
      when AEC::VolumeAttachmentState::Detaching then "detaching"
      when AEC::VolumeAttachmentState::Detached  then "detached"
      when AEC::VolumeAttachmentState::Busy      then "busy"
      else
        raise Exception.new("unknown enum value for 'VolumeAttachmentState' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VolumeAttachmentState?
      case key
      when "attaching" then AEC::VolumeAttachmentState::Attaching
      when "attached"  then AEC::VolumeAttachmentState::Attached
      when "detaching" then AEC::VolumeAttachmentState::Detaching
      when "detached"  then AEC::VolumeAttachmentState::Detached
      when "busy"      then AEC::VolumeAttachmentState::Busy
      else
        nil
      end
    end
  end
end
