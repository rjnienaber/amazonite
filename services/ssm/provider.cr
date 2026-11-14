private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum Provider
    Azure
    Gcp

    def self.to_json(e : Provider, json : JSON::Builder) : Nil
      value = case e
              when AS::Provider::Azure then "Azure"
              when AS::Provider::Gcp   then "GCP"
              else
                raise Exception.new("unknown enum value for 'Provider' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::Provider
      value = pull.read_string
      case value
      when "Azure" then AS::Provider::Azure
      when "GCP"   then AS::Provider::Gcp
      else
        raise Exception.new("unknown enum value for 'Provider' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::Provider::Azure then "Azure"
      when AS::Provider::Gcp   then "GCP"
      else
        raise Exception.new("unknown enum value for 'Provider' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::Provider?
      case key
      when "Azure" then AS::Provider::Azure
      when "GCP"   then AS::Provider::Gcp
      else
        nil
      end
    end
  end
end
