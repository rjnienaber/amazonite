private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VolumeType
    Standard
    Io1
    Io2
    Gp2
    Sc1
    St1
    Gp3

    def self.to_json(e : VolumeType, json : JSON::Builder) : Nil
      value = case e
              when AEC::VolumeType::Standard then "standard"
              when AEC::VolumeType::Io1      then "io1"
              when AEC::VolumeType::Io2      then "io2"
              when AEC::VolumeType::Gp2      then "gp2"
              when AEC::VolumeType::Sc1      then "sc1"
              when AEC::VolumeType::St1      then "st1"
              when AEC::VolumeType::Gp3      then "gp3"
              else
                raise Exception.new("unknown enum value for 'VolumeType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VolumeType
      value = pull.read_string
      case value
      when "standard" then AEC::VolumeType::Standard
      when "io1"      then AEC::VolumeType::Io1
      when "io2"      then AEC::VolumeType::Io2
      when "gp2"      then AEC::VolumeType::Gp2
      when "sc1"      then AEC::VolumeType::Sc1
      when "st1"      then AEC::VolumeType::St1
      when "gp3"      then AEC::VolumeType::Gp3
      else
        raise Exception.new("unknown enum value for 'VolumeType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VolumeType::Standard then "standard"
      when AEC::VolumeType::Io1      then "io1"
      when AEC::VolumeType::Io2      then "io2"
      when AEC::VolumeType::Gp2      then "gp2"
      when AEC::VolumeType::Sc1      then "sc1"
      when AEC::VolumeType::St1      then "st1"
      when AEC::VolumeType::Gp3      then "gp3"
      else
        raise Exception.new("unknown enum value for 'VolumeType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VolumeType?
      case key
      when "standard" then AEC::VolumeType::Standard
      when "io1"      then AEC::VolumeType::Io1
      when "io2"      then AEC::VolumeType::Io2
      when "gp2"      then AEC::VolumeType::Gp2
      when "sc1"      then AEC::VolumeType::Sc1
      when "st1"      then AEC::VolumeType::St1
      when "gp3"      then AEC::VolumeType::Gp3
      else
        nil
      end
    end
  end
end
