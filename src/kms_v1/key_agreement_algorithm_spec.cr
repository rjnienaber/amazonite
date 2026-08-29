private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum KeyAgreementAlgorithmSpec
    Ecdh

    def self.to_json(e : KeyAgreementAlgorithmSpec, json : JSON::Builder) : Nil
      value = case e
              when AK::KeyAgreementAlgorithmSpec::Ecdh then "ECDH"
              else
                raise Exception.new("unknown enum value for 'KeyAgreementAlgorithmSpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::KeyAgreementAlgorithmSpec
      value = pull.read_string
      case value
      when "ECDH" then AK::KeyAgreementAlgorithmSpec::Ecdh
      else
        raise Exception.new("unknown enum value for 'KeyAgreementAlgorithmSpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::KeyAgreementAlgorithmSpec::Ecdh then "ECDH"
      else
        raise Exception.new("unknown enum value for 'KeyAgreementAlgorithmSpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::KeyAgreementAlgorithmSpec?
      case key
      when "ECDH" then AK::KeyAgreementAlgorithmSpec::Ecdh
      else
        nil
      end
    end
  end
end
