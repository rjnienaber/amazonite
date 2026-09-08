private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum InstanceTypeHypervisor
    Nitro
    Xen

    def self.to_json(e : InstanceTypeHypervisor, json : JSON::Builder) : Nil
      value = case e
              when AEC::InstanceTypeHypervisor::Nitro then "nitro"
              when AEC::InstanceTypeHypervisor::Xen   then "xen"
              else
                raise Exception.new("unknown enum value for 'InstanceTypeHypervisor' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::InstanceTypeHypervisor
      value = pull.read_string
      case value
      when "nitro" then AEC::InstanceTypeHypervisor::Nitro
      when "xen"   then AEC::InstanceTypeHypervisor::Xen
      else
        raise Exception.new("unknown enum value for 'InstanceTypeHypervisor' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::InstanceTypeHypervisor::Nitro then "nitro"
      when AEC::InstanceTypeHypervisor::Xen   then "xen"
      else
        raise Exception.new("unknown enum value for 'InstanceTypeHypervisor' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::InstanceTypeHypervisor?
      case key
      when "nitro" then AEC::InstanceTypeHypervisor::Nitro
      when "xen"   then AEC::InstanceTypeHypervisor::Xen
      else
        nil
      end
    end
  end
end
