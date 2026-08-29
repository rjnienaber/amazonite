private alias AK = Amazonite::KmsV1

module Amazonite::KmsV1
  enum DataKeySpec
    Aes256
    Aes128

    def self.to_json(e : DataKeySpec, json : JSON::Builder) : Nil
      value = case e
              when AK::DataKeySpec::Aes256 then "AES_256"
              when AK::DataKeySpec::Aes128 then "AES_128"
              else
                raise Exception.new("unknown enum value for 'DataKeySpec' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::DataKeySpec
      value = pull.read_string
      case value
      when "AES_256" then AK::DataKeySpec::Aes256
      when "AES_128" then AK::DataKeySpec::Aes128
      else
        raise Exception.new("unknown enum value for 'DataKeySpec' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::DataKeySpec::Aes256 then "AES_256"
      when AK::DataKeySpec::Aes128 then "AES_128"
      else
        raise Exception.new("unknown enum value for 'DataKeySpec' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::DataKeySpec?
      case key
      when "AES_256" then AK::DataKeySpec::Aes256
      when "AES_128" then AK::DataKeySpec::Aes128
      else
        nil
      end
    end
  end
end
