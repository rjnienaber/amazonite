private alias AL = Amazonite::Lambda

module Amazonite::Lambda
  enum DirectS3Read
    Enabled
    Disabled
    Auto

    def self.to_json(e : DirectS3Read, json : JSON::Builder) : Nil
      value = case e
              when AL::DirectS3Read::Enabled  then "ENABLED"
              when AL::DirectS3Read::Disabled then "DISABLED"
              when AL::DirectS3Read::Auto     then "AUTO"
              else
                raise Exception.new("unknown enum value for 'DirectS3Read' when serializing to json: '#{e}'")
              end
      json.string(value)
    end

    def self.from_json(pull : JSON::PullParser) : AL::DirectS3Read
      value = pull.read_string
      case value
      when "ENABLED"  then AL::DirectS3Read::Enabled
      when "DISABLED" then AL::DirectS3Read::Disabled
      when "AUTO"     then AL::DirectS3Read::Auto
      else
        raise Exception.new("unknown enum value for 'DirectS3Read' when deserializing from json: '#{value}'")
      end
    end

    def to_json_object_key : String
      case self
      when AL::DirectS3Read::Enabled  then "ENABLED"
      when AL::DirectS3Read::Disabled then "DISABLED"
      when AL::DirectS3Read::Auto     then "AUTO"
      else
        raise Exception.new("unknown enum value for 'DirectS3Read' when serializing to json: '#{self}'")
      end
    end

    def self.from_json_object_key?(key : String) : AL::DirectS3Read?
      case key
      when "ENABLED"  then AL::DirectS3Read::Enabled
      when "DISABLED" then AL::DirectS3Read::Disabled
      when "AUTO"     then AL::DirectS3Read::Auto
      else
        nil
      end
    end
  end
end
