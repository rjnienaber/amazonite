private alias AEC = Amazonite::EC2

module Amazonite::EC2
  enum EkPubKeyFormat
    Der
    Tpmt

    def self.to_json(e : EkPubKeyFormat, json : JSON::Builder) : Nil
      value = case e
              when AEC::EkPubKeyFormat::Der  then "der"
              when AEC::EkPubKeyFormat::Tpmt then "tpmt"
              else
                raise Exception.new("unknown enum value for 'EkPubKeyFormat' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AEC::EkPubKeyFormat
      value = pull.read_string
      case value
      when "der"  then AEC::EkPubKeyFormat::Der
      when "tpmt" then AEC::EkPubKeyFormat::Tpmt
      else
        raise Exception.new("unknown enum value for 'EkPubKeyFormat' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AEC::EkPubKeyFormat::Der  then "der"
      when AEC::EkPubKeyFormat::Tpmt then "tpmt"
      else
        raise Exception.new("unknown enum value for 'EkPubKeyFormat' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AEC::EkPubKeyFormat?
      case key
      when "der"  then AEC::EkPubKeyFormat::Der
      when "tpmt" then AEC::EkPubKeyFormat::Tpmt
      else
        nil
      end
    end
  end
end
