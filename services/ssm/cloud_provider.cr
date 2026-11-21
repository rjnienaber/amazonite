private alias AS = Amazonite::Ssm

module Amazonite::Ssm
  enum CloudProvider
    Aws
    Azure
    Gcp

    def self.to_json(e : CloudProvider, json : JSON::Builder) : Nil
      value = case e
              when AS::CloudProvider::Aws   then "AWS"
              when AS::CloudProvider::Azure then "Azure"
              when AS::CloudProvider::Gcp   then "GCP"
              else
                raise Exception.new("unknown enum value for 'CloudProvider' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AS::CloudProvider
      value = pull.read_string
      case value
      when "AWS"   then AS::CloudProvider::Aws
      when "Azure" then AS::CloudProvider::Azure
      when "GCP"   then AS::CloudProvider::Gcp
      else
        raise Exception.new("unknown enum value for 'CloudProvider' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AS::CloudProvider::Aws   then "AWS"
      when AS::CloudProvider::Azure then "Azure"
      when AS::CloudProvider::Gcp   then "GCP"
      else
        raise Exception.new("unknown enum value for 'CloudProvider' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AS::CloudProvider?
      case key
      when "AWS"   then AS::CloudProvider::Aws
      when "Azure" then AS::CloudProvider::Azure
      when "GCP"   then AS::CloudProvider::Gcp
      else
        nil
      end
    end
  end
end
