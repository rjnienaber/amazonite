private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum DiskImageFormat
    Vmdk
    Raw
    Vhd

    def self.to_json(e : DiskImageFormat, json : JSON::Builder) : Nil
      value = case e
              when AEC::DiskImageFormat::Vmdk then "VMDK"
              when AEC::DiskImageFormat::Raw  then "RAW"
              when AEC::DiskImageFormat::Vhd  then "VHD"
              else
                raise Exception.new("unknown enum value for 'DiskImageFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::DiskImageFormat
      value = pull.read_string
      case value
      when "VMDK" then AEC::DiskImageFormat::Vmdk
      when "RAW"  then AEC::DiskImageFormat::Raw
      when "VHD"  then AEC::DiskImageFormat::Vhd
      else
        raise Exception.new("unknown enum value for 'DiskImageFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::DiskImageFormat::Vmdk then "VMDK"
      when AEC::DiskImageFormat::Raw  then "RAW"
      when AEC::DiskImageFormat::Vhd  then "VHD"
      else
        raise Exception.new("unknown enum value for 'DiskImageFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::DiskImageFormat?
      case key
      when "VMDK" then AEC::DiskImageFormat::Vmdk
      when "RAW"  then AEC::DiskImageFormat::Raw
      when "VHD"  then AEC::DiskImageFormat::Vhd
      else
        nil
      end
    end
  end
end
