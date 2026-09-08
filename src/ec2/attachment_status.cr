private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum AttachmentStatus
    Attaching
    Attached
    Detaching
    Detached

    def self.to_json(e : AttachmentStatus, json : JSON::Builder) : Nil
      value = case e
              when AEC::AttachmentStatus::Attaching then "attaching"
              when AEC::AttachmentStatus::Attached  then "attached"
              when AEC::AttachmentStatus::Detaching then "detaching"
              when AEC::AttachmentStatus::Detached  then "detached"
              else
                raise Exception.new("unknown enum value for 'AttachmentStatus' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::AttachmentStatus
      value = pull.read_string
      case value
      when "attaching" then AEC::AttachmentStatus::Attaching
      when "attached"  then AEC::AttachmentStatus::Attached
      when "detaching" then AEC::AttachmentStatus::Detaching
      when "detached"  then AEC::AttachmentStatus::Detached
      else
        raise Exception.new("unknown enum value for 'AttachmentStatus' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::AttachmentStatus::Attaching then "attaching"
      when AEC::AttachmentStatus::Attached  then "attached"
      when AEC::AttachmentStatus::Detaching then "detaching"
      when AEC::AttachmentStatus::Detached  then "detached"
      else
        raise Exception.new("unknown enum value for 'AttachmentStatus' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::AttachmentStatus?
      case key
      when "attaching" then AEC::AttachmentStatus::Attaching
      when "attached"  then AEC::AttachmentStatus::Attached
      when "detaching" then AEC::AttachmentStatus::Detaching
      when "detached"  then AEC::AttachmentStatus::Detached
      else
        nil
      end
    end
  end
end
