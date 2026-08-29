private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum WrappingKeySpec
    Rsa2048
    Rsa3072
    Rsa4096
    Sm2

    def self.to_json(e : WrappingKeySpec, json : JSON::Builder) : Nil
      value = case e
              when AK::WrappingKeySpec::Rsa2048 then "RSA_2048"
              when AK::WrappingKeySpec::Rsa3072 then "RSA_3072"
              when AK::WrappingKeySpec::Rsa4096 then "RSA_4096"
              when AK::WrappingKeySpec::Sm2     then "SM2"
              else
                raise Exception.new("unknown enum value for 'WrappingKeySpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::WrappingKeySpec
      value = pull.read_string
      case value
      when "RSA_2048" then AK::WrappingKeySpec::Rsa2048
      when "RSA_3072" then AK::WrappingKeySpec::Rsa3072
      when "RSA_4096" then AK::WrappingKeySpec::Rsa4096
      when "SM2"      then AK::WrappingKeySpec::Sm2
      else
        raise Exception.new("unknown enum value for 'WrappingKeySpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::WrappingKeySpec::Rsa2048 then "RSA_2048"
      when AK::WrappingKeySpec::Rsa3072 then "RSA_3072"
      when AK::WrappingKeySpec::Rsa4096 then "RSA_4096"
      when AK::WrappingKeySpec::Sm2     then "SM2"
      else
        raise Exception.new("unknown enum value for 'WrappingKeySpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::WrappingKeySpec?
      case key
      when "RSA_2048" then AK::WrappingKeySpec::Rsa2048
      when "RSA_3072" then AK::WrappingKeySpec::Rsa3072
      when "RSA_4096" then AK::WrappingKeySpec::Rsa4096
      when "SM2"      then AK::WrappingKeySpec::Sm2
      else
        nil
      end
    end
  end
end
