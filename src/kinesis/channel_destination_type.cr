private alias AK = Amazonite::Kinesis

module Amazonite::Kinesis
  enum ChannelDestinationType
    S3
    S3Tables

    def self.to_json(e : ChannelDestinationType, json : JSON::Builder) : Nil
      value = case e
              when AK::ChannelDestinationType::S3       then "S3"
              when AK::ChannelDestinationType::S3Tables then "S3_TABLES"
              else
                raise Exception.new("unknown enum value for 'ChannelDestinationType' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AK::ChannelDestinationType
      value = pull.read_string
      case value
      when "S3"        then AK::ChannelDestinationType::S3
      when "S3_TABLES" then AK::ChannelDestinationType::S3Tables
      else
        raise Exception.new("unknown enum value for 'ChannelDestinationType' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AK::ChannelDestinationType::S3       then "S3"
      when AK::ChannelDestinationType::S3Tables then "S3_TABLES"
      else
        raise Exception.new("unknown enum value for 'ChannelDestinationType' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AK::ChannelDestinationType?
      case key
      when "S3"        then AK::ChannelDestinationType::S3
      when "S3_TABLES" then AK::ChannelDestinationType::S3Tables
      else
        nil
      end
    end
  end
end
