private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum VirtualizationType
    Hvm
    Paravirtual

    def self.to_json(e : VirtualizationType, json : JSON::Builder) : Nil
      value = case e
              when AEC::VirtualizationType::Hvm         then "hvm"
              when AEC::VirtualizationType::Paravirtual then "paravirtual"
              else
                raise Exception.new("unknown enum value for 'VirtualizationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::VirtualizationType
      value = pull.read_string
      case value
      when "hvm"         then AEC::VirtualizationType::Hvm
      when "paravirtual" then AEC::VirtualizationType::Paravirtual
      else
        raise Exception.new("unknown enum value for 'VirtualizationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::VirtualizationType::Hvm         then "hvm"
      when AEC::VirtualizationType::Paravirtual then "paravirtual"
      else
        raise Exception.new("unknown enum value for 'VirtualizationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::VirtualizationType?
      case key
      when "hvm"         then AEC::VirtualizationType::Hvm
      when "paravirtual" then AEC::VirtualizationType::Paravirtual
      else
        nil
      end
    end
  end
end
