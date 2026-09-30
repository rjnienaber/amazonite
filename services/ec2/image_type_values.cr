private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum ImageTypeValues
    Machine
    Kernel
    Ramdisk

    def self.to_json(e : ImageTypeValues, json : JSON::Builder) : Nil
      value = case e
              when AEC::ImageTypeValues::Machine then "machine"
              when AEC::ImageTypeValues::Kernel  then "kernel"
              when AEC::ImageTypeValues::Ramdisk then "ramdisk"
              else
                raise Exception.new("unknown enum value for 'ImageTypeValues' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::ImageTypeValues
      value = pull.read_string
      case value
      when "machine" then AEC::ImageTypeValues::Machine
      when "kernel"  then AEC::ImageTypeValues::Kernel
      when "ramdisk" then AEC::ImageTypeValues::Ramdisk
      else
        raise Exception.new("unknown enum value for 'ImageTypeValues' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::ImageTypeValues::Machine then "machine"
      when AEC::ImageTypeValues::Kernel  then "kernel"
      when AEC::ImageTypeValues::Ramdisk then "ramdisk"
      else
        raise Exception.new("unknown enum value for 'ImageTypeValues' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::ImageTypeValues?
      case key
      when "machine" then AEC::ImageTypeValues::Machine
      when "kernel"  then AEC::ImageTypeValues::Kernel
      when "ramdisk" then AEC::ImageTypeValues::Ramdisk
      else
        nil
      end
    end
  end
end
