private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum OfferingClassType
    Standard
    Convertible

    def self.to_json(e : OfferingClassType, json : JSON::Builder) : Nil
      value = case e
              when AEC::OfferingClassType::Standard    then "standard"
              when AEC::OfferingClassType::Convertible then "convertible"
              else
                raise Exception.new("unknown enum value for 'OfferingClassType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::OfferingClassType
      value = pull.read_string
      case value
      when "standard"    then AEC::OfferingClassType::Standard
      when "convertible" then AEC::OfferingClassType::Convertible
      else
        raise Exception.new("unknown enum value for 'OfferingClassType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::OfferingClassType::Standard    then "standard"
      when AEC::OfferingClassType::Convertible then "convertible"
      else
        raise Exception.new("unknown enum value for 'OfferingClassType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::OfferingClassType?
      case key
      when "standard"    then AEC::OfferingClassType::Standard
      when "convertible" then AEC::OfferingClassType::Convertible
      else
        nil
      end
    end
  end
end
