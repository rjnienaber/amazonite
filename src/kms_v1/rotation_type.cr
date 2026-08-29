private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum RotationType
    Automatic
    OnDemand

    def self.to_json(e : RotationType, json : JSON::Builder) : Nil
      value = case e
              when AK::RotationType::Automatic then "AUTOMATIC"
              when AK::RotationType::OnDemand  then "ON_DEMAND"
              else
                raise Exception.new("unknown enum value for 'RotationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::RotationType
      value = pull.read_string
      case value
      when "AUTOMATIC" then AK::RotationType::Automatic
      when "ON_DEMAND" then AK::RotationType::OnDemand
      else
        raise Exception.new("unknown enum value for 'RotationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::RotationType::Automatic then "AUTOMATIC"
      when AK::RotationType::OnDemand  then "ON_DEMAND"
      else
        raise Exception.new("unknown enum value for 'RotationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::RotationType?
      case key
      when "AUTOMATIC" then AK::RotationType::Automatic
      when "ON_DEMAND" then AK::RotationType::OnDemand
      else
        nil
      end
    end
  end
end
