private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum HypervisorType
    Ovm
    Xen

    def self.to_json(e : HypervisorType, json : JSON::Builder) : Nil
      value = case e
              when AEC::HypervisorType::Ovm then "ovm"
              when AEC::HypervisorType::Xen then "xen"
              else
                raise Exception.new("unknown enum value for 'HypervisorType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::HypervisorType
      value = pull.read_string
      case value
      when "ovm" then AEC::HypervisorType::Ovm
      when "xen" then AEC::HypervisorType::Xen
      else
        raise Exception.new("unknown enum value for 'HypervisorType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::HypervisorType::Ovm then "ovm"
      when AEC::HypervisorType::Xen then "xen"
      else
        raise Exception.new("unknown enum value for 'HypervisorType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::HypervisorType?
      case key
      when "ovm" then AEC::HypervisorType::Ovm
      when "xen" then AEC::HypervisorType::Xen
      else
        nil
      end
    end
  end
end
